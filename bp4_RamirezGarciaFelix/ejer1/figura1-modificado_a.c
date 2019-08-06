#include <stdio.h>
#include <time.h>
#include "figura1_a.h"

int main(){
	int ii, X1, X2, i;
	int R[40000];
	struct timespec ini, fin;
	double time;
	
	clock_gettime(CLOCK_REALTIME, &ini);
	auxiliar(ii,X1,X2,i,R);	//definicion en figura1_a.h
	clock_gettime(CLOCK_REALTIME, &fin);

	time=(double)(fin.tv_sec-ini.tv_sec)+(double)((fin.tv_nsec-ini.tv_nsec)/1.e+9);

	printf("R[0]=%d\tR[39999]=%d\n",R[0], R[39999]);
	printf("Time: %11.9f\n", time);
}
