#include <8051.h>  
#include <string.h>
void main()

{
	unsigned int i, k, j, p;
	unsigned char *str = "Txt";
	unsigned char *str2 = "txT";
	unsigned char *str3 = " ";
	P0 = 0x38;
	P2 = 0x1;
	P2 = 0x0;
	P0 = 0x87;
	P2 = 0x1;
	P2 = 0x0;
	P0 = 0xC;
	P2 = 0x1;
	P2 = 0x0;
	p = 0x80;
	for (i = 0; i < 6; i++) //1 8
	{
		P0 = str[i];
		P2 = 0x3;
		P2 = 0x2;
	}
while(1){
		P0 = 0xCF;  
		P2 = 0x1;
		P2 = 0x0;
		for(i=0;i<6;i++) 
		{	
			for(k=0;k<=i;k++){
 				P0 = str2[k];
 				P2 = 0x3;  
 				P2 = 0x2;
			}
			P0 = 0xCF;  
			P2 = 0x1;
			P2 = 0x0;
			for(k=0;k<=i;k++){
				P0 = 0x10;  
				P2 = 0x1;
				P2 = 0x0;
			}

		}
		for(i=0;i<10;i++){
			for(k=0;k<=7;k++){
 				P0 = str2[k];
 				P2 = 0x3;  
 				P2 = 0x2;
				if(k>6) {
					P0 = str3[0];
 					P2 = 0x3;  
 					P2 = 0x2;
				}
			}
			for(k=0;k<=9;k++){
				P0 = 0x10;  
				P2 = 0x1;
				P2 = 0x0;
			}
		}
		P0 = 0x14;  
		P2 = 0x1;
		P2 = 0x0;
		for(i=6;i>0;i--){
			for(k=7-i;k<=7;k++){
 				P0 = str2[k];
 				P2 = 0x3;  
 				P2 = 0x2;
				if(k>6) {
					P0 = str3[0];
 					P2 = 0x3;  
 					P2 = 0x2;
				}
			}
			P0 = 0xC0;  
			P2 = 0x1;
			P2 = 0x0;		
		}
		P0 = str3[0];
 		P2 = 0x3;  
 		P2 = 0x2;

	}
}
end;

