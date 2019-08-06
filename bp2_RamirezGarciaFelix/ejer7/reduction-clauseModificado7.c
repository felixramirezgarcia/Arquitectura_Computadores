#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
	#include <omp.h>
#else 
	#define omp_get_thread_num() 0
	#define omp_get_num_threads() 1
#endif

int main(int argc, char **argv){
	int i, n=20, a[n], suma=0;
	if(argc<2){
		fprintf(stderr, "Faltan iteraciones\n");
		exit(-1);
	}	
	n=atoi(argv[1]);
	if(n>20){
		n=20;
		printf("n=%d", n);
	}
	for(i=0;i<n;i++){
		a[i]=i;
	}
	
	omp_set_num_threads(n);
	#pragma omp parallel
	{
		suma+=a[omp_get_thread_num()];
	}

	printf("Tras parallel suma=%d\n", suma);
}
