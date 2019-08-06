#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#define max 33554432

int x[max], y[max];

int main(int argc, char *argv[]){
	int n, constante, i;	
	struct timespec ini, fin;
	double time;

	if(argc<3){
		fprintf(stderr, "Falta el tamaño del vector y la constante");
		exit(-1);
	}

	n=atoi(argv[1]);
	constante=atoi(argv[2]);
	if(n>max) n=max;	

	for(i=0;i<n;i++){
		x[i]=i;
		y[i]=i*i;
	}

	clock_gettime(CLOCK_REALTIME, &ini);
	for(i=0;i<n;i++) y[i]= constante*x[i]+y[i];
	clock_gettime(CLOCK_REALTIME, &fin);
	
	time=(double)(fin.tv_sec-ini.tv_sec)+
		 (double)((fin.tv_nsec-ini.tv_nsec)/1.e+9);

	printf("Time=%11.9f\ty[0]=%d, y[%d]=%d\n", time, y[0], n-1, y[n-1]);
}
