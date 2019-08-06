#include <stdio.h>
#include <time.h>

struct{
	int a;
	int b;
} s[5000];

int main(){
	int ii, X1, X2, i;
	int R[40000];
	struct timespec ini, fin;
	double time;
	
	clock_gettime(CLOCK_REALTIME, &ini);
	for(ii=0;ii<40000;ii++){
		X1=0; X2=0;
		for(i=0;i<5000;i++) X1+=2*s[i].a+ii;
		for(i=0;i<5000;i++) X2+=3*s[i].b-ii;
		
		if(X1<X2) R[ii]=X1;
		else R[ii]=X2;
	}
	clock_gettime(CLOCK_REALTIME, &fin);

	time=(double)(fin.tv_sec-ini.tv_sec)+
		 (double)((fin.tv_nsec-ini.tv_nsec)/1.e+9);

	printf("R[0]=%d\tR[39999]=%d\n",R[0], R[39999]);
	printf("Time: %11.9f\n", time);
}
