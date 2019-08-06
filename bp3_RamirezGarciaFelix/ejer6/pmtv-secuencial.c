#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv){
	int i, j, N;
	int *v, *resultado;
	int **m;

	if(argc<2){
		fprintf(stderr, "Falta el tamaño\n");
		exit(-1);
	}

	N=atoi(argv[1]);

	v=(int*)malloc(N*sizeof(int));
	resultado=(int*)malloc(N*sizeof(int));
	m=(int**)malloc(N*sizeof(int*));

	for(i=0;i<N;i++) m[i]=(int*)malloc(N*sizeof(int));

	for(i=0;i<N;i++){
		for(j=i;j<N;j++) m[i][j]=2;
		v[i]=2;
		resultado[i]=0;
	}

	for(i=0;i<N;i++){
		for(j=i;j<N;j++) resultado[i]+=m[i][j]*v[j];
	}

  printf("\tResultado(0): %d\n\tResultado(N-1): %d\n", resultado[0], resultado[N-1]);

  for (i=0; i<N; i++) free(m[i]);
  free(m);
  free(v);
  free(resultado);
}
