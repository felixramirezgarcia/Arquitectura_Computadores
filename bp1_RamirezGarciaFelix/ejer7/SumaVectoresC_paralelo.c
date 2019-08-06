#include <stdlib.h> 
#include <stdio.h>
#include <time.h> 
#include <omp.h>

double v1[33554432], v2[33554432], v3[33554432];

int main(int argc, char** argv){
	int i;
	double ncgt, start, end; 
	if (argc<2){
		printf("Faltan nº componentes del vector\n");
		exit(-1);
	}

	unsigned int N = atoi(argv[1]); 

	if (N>33554432) N=33554432;

	//Inicializar vectores
	#pragma omp parallel
	{
		#pragma omp for
			for(i=0; i<N; i++){
				v1[i] = N*0.1+i*0.1; 
				v2[i] = N*0.1-i*0.1; 
			}
	}
	//Variable para medir tiempo
	start = omp_get_wtime();
	//Calcular suma de vectores
	#pragma omp parallel
	{
		#pragma omp for
			for(i=0; i<N; i++){
				v3[i] = v1[i] + v2[i];
			}
	}
	//Variable para medir tiempo
	end = omp_get_wtime();
	for(i=0;i<N;i++){
		printf("V3[%i]=%f\n", i, v3[i]);
	}
	printf("Tiempo que se ha tardado en hacer la suma-->%11.9f\n", end-start);
	printf("V1[0]=%f\nV1[N-1]=%f\nV2[0]=%f\nV2[N-1]=%f\nV3[0]=%f\nV3[N-1]=%f\n",
			v1[0], 	  v1[N-1],    v2[0],    v2[N-1],    v3[0],    v3[N-1]);
	return 0;
}
