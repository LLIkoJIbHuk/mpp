#include <8051.h>
void msec (int x) 
{
while(x-->0) 
{
TH0 = (-10000)>>8 ;
TL0=-10000; 
TR0=1;
do;
while(TF0==0);
TF0=0; 
TR0=0;
}
}
void main() 
{
TMOD=0x1; 
P1=0x0;
P1=0x49;
msec(400);
P1=0x80;
msec(250);
P1 = 0x2;
msec(150);
P1=0x34;
msec(700);

P1=0x0;
while(1);
}