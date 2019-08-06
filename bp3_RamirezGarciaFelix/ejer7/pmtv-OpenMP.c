#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argc, char **argv){
	int i, j, N;
	int *v, *r;
	int **m;	
	double inicio, fin;

	if(argc<2){
		fprintf(stderr, "Falta tamaño\n");
		exit(-1);
	}

	N=atoi(argv[1]);

	r=(int*)malloc(N*sizeof(int));
	m=(int**)malloc(N*sizeof(int*));
	v=(int*)malloc(N*sizeof(int));

	for(i=0;i<N;i++) m[i]=(int*)malloc(N*sizeof(int));

	for(i=0;i<N;i++){
		for(j=i;j<N;j++) m[i][j]=2;
		v[i]=2;
		r[i]=0;
	}
	
	inicio=omp_get_wtime();
	#pragma omp parallel for private(j) schedule(runtime)
	for(i=0;i<N;i++){
		for(j=i;j<N;j++) r[i]+=m[i][j]*v[j];
	}
	fin=omp_get_wtime();

	printf("Tiempo= %11.9f\tPrimera=%d\tUltima=%d\n", fin-inicio, r[0], r[N-1]);

	for(i=0;i<N;i++) free(m[i]);
	free(m);
	free(v);
	free(r);
}
	

