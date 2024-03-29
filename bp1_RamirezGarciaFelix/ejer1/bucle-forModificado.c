#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char ** argv){
	int i, n=9;
	
	if(argc<2){
		fprintf(stderr, "\n[ERROR] -Falta nº iteracciones\n");
		exit(-1);
	}
	n=atoi(argv[1]);

	#pragma omp parallel
	{
		#pragma omp parallel for
		for(i=0;i<n;i++){
			printf("Thread %d ejecuta la iteracion %d del bucle\n", omp_get_thread_num(),i);
		}
	}
	return(0);
}
