#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv){
	int i, j, k, N;
	int **m1, **m2, **mResultado;
	struct timespec inicio, fin;
	double time;

	if(argc<2){
		fprintf(stderr, "falta el tamaño\n");
		exit(-1);
	}

	N=atoi(argv[1]); 

	m1=(int**)malloc(N*sizeof(int*));
	m2=(int**)malloc(N*sizeof(int*));
	mResultado=(int**)malloc(N*sizeof(int*));

	for (i=0;i<N;i++){
		m1[i]=(int*)malloc(N*sizeof(int));
		m2[i]=(int*)malloc(N*sizeof(int));
		mResultado[i]=(int*)malloc(N*sizeof(int));
	}

	#pragma omp parallel for private(j)
	for(i=0;i<N;i++){
		for(j=0;j<N;j++){
			m1[i][j]=2;
			m2[i][j]=2;
			mResultado[i][j]=0;
		}
	}

	clock_gettime(CLOCK_REALTIME,&inicio);
	#pragma omp parallel for private(j, k)
	for(i=0;i<N;i++){
		for(j=0;j<N;j++){
			for(k=0;k<N;k++) mResultado[i][j]+=m1[i][k]*m2[k][j];
		}
	}
	clock_gettime(CLOCK_REALTIME,&fin);

	time=(double)(fin.tv_sec-inicio.tv_sec)+(double)((fin.tv_nsec-inicio.tv_nsec)/(1.e+9));

	printf("Tiempo=%11.9f\n\t(0,0)=%d\n\t(N-1, N-1)=%d\n", time,mResultado[0][0], mResultado[N-1][N-1]);

	for (i=0; i<N; i++){
		free(m1[i]);
		free(m2[i]);
		free(mResultado[i]);
	}
	free(m1);
	free(m2);
	free(mResultado);
}
