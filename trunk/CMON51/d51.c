/*
CMON51: C Monitor for the 8051
Copyright (C) 2005, 2006  Jesus Calvino-Fraga / jesusc at ece.ubc.ca

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
*/

#include <8051.h>
#include "d51.h"
#include "proto.h"

unsigned char cur;
unsigned int discnt;

extern char buff[];
extern const char hexval[];
extern code unsigned char sfrn[];
extern code unsigned char bitn[];

#define addchar(c) (buff[cur++]=c)

void addbyte (unsigned char x)
{
	addchar(hexval[x/0x10]);
	addchar(hexval[x&0xf]);
	outbyte(x);
	putc(' ');
}

void addstr(unsigned char * x)
{
	while ((*x!=0)&&(*x<0x80))
	{
		addchar(*x);
		x++;
	}
}

void addword (unsigned int x)
{
	addchar(hexval[(x/0x1000)&0xf]);
	addchar(hexval[(x/0x100)&0xf]);
	addchar(hexval[(x/0x10)&0xf]);
	addchar(hexval[x&0xf]);
}

//Disassemble code starting at 'address'.  To economize a bit uses the input
//buffer 'buff' for output.
void unassemble (unsigned int address)
{
	unsigned int j;
	unsigned char n, opcode, i=0;
	unsigned char * ptr;
	unsigned int absadd;
	code unsigned char * pcounter;
	bit bitncheck;
	char bitnum;
	
	pcounter=(unsigned char code *)address;
	if(discnt==0) discnt=1;
	
	while(discnt--)
	{
		outword((int) pcounter);
		putsp(": ");
		opcode=*pcounter;
		outbyte(opcode);
		putc(' ');
		cur=0;
		addchar('\t');
		
		//Scan the mnemonic table for the corresponding opcode format string.  To avoid
		//having 256 generic pointers (3 bytes each) for a total of 768 bytes, the format
		//strings are part of a bigger string and separated by '\n'
		for(j=0, n=0; (mnemtbl[j]!=0)&&(opcode!=n); j++)
		{
			if(mnemtbl[j]=='\n') n++;
		}
		
		//Some opcode format strings are repeated so skip them.  For example, the
		//format for "mov a,r0" is the same as for "mov a,r7", so use the one for
		//"mov a,r7" this saves quite a bit of memory!
		while (mnemtbl[j]=='\n') j++; 

		//Parse the mnemonic format string
		for(; mnemtbl[j]!='\n'; j++)
		{
			n=mnemtbl[j];
			
			bitncheck=0;
			
			if((n>='A')&&(n<='Z')) //Replace with string in table
				addstr(mnem[n-'A']);
			else switch (n)
			{
				case '#': //Numeric constant (in hex)
					addchar('#');
					addbyte(*(++pcounter));
					if(opcode==0x90) //"mov dptr,#1234" uses two bytes (Only exception)
					{
						addbyte(*(++pcounter));
					}
					break;
					
				case '%': //Direct bit addressing
					bitncheck=1;
				case '!': //Direct memory addressing including sfrs
					ptr=(bitncheck?bitn:sfrn); //Select the right table of names
					n=*(++pcounter);
					
					bitnum=0;
					
					checkagain:
					if(n>0x7f)  //Search for sfr or bit names
					{
						for(; *ptr; ptr++)
						{
							if(*ptr==n)
							{
								outbyte(n);
								putc(' ');
								for(ptr++; *ptr<0x80; ptr++) addchar(*ptr);
								if(bitnum>0)
								{
									addchar('.');
									addchar(bitnum);
								}
								break;
							}
						}
						if(*ptr==0)
						{
							if(bitnum>0) n|=(bitnum&7);
							if(bitncheck)
							{
								//Didn't find a proper bitname.  Try with the SFR name, like in P2.1
								bitncheck=0;
								bitnum=(n&7)|'0';
								n&=0xf8;
								ptr=sfrn;
								goto checkagain;
							}
							else addbyte(n); //sfr name not found in table, print the number
						}
					}
					else addbyte(n); //Not an sfr name print the number
					break;
					
				case '.': //8 bit relative address
					pcounter++;
					absadd=(unsigned int)pcounter+(char)*pcounter+1;
					addword(absadd);
					outbyte(*pcounter);
					putc(' ');
					break;
					
				case '&': //11 bit paged address
					n=(*pcounter/0x20)|((((unsigned int)pcounter+2)/0x100)&0xf8);
					pcounter++;
					absadd=(n*0x100)+(*pcounter);
					addword(absadd);
					outbyte(*pcounter);
					putc(' ');
					break;
					
				case ':': // 16 bit absolute address
					absadd=*(++pcounter)*0x100;
					outbyte(*pcounter);
					putc(' ');
					outbyte(*(++pcounter));
					putc(' ');
					absadd+=*pcounter;
					addword(absadd);
					break;
					
				case '*': //@r0 or @r1
					addstr("@r");
					addchar((opcode&0x1)|'0');
					break;
					
				case '?': //r0 to r7
					addchar('r');
					addchar((opcode&0x7)|'0');
					break;
			
				default:
					addchar(n);
					break;
			}
		}
		addchar('\n');
		addchar(0);
		putsp(buff);
		pcounter++; //points to next opcode
	
		if(++i==23) 
		{
			n=hitanykey();
			if (n==0x1b) break;
			else if (n==' ') i--;
			else i=0;
		}
	}
}
