#include <stdlib.h> 
#include <stdio.h>
#include <time.h> 
#include <omp.h>


int main(int argc, char** argv){
	int i;
	double ncgt, start, end; 

	if (argc<2){
		printf("Faltan nº componentes del vector\n");
		exit(-1);
	}

	unsigned int N = atoi(argv[1]); 

	double *v1, *v2, *v3;
	v1 = (double*) malloc(N*sizeof(double));// malloc necesita el tamaño en bytes
	v2 = (double*) malloc(N*sizeof(double));
	v3 = (double*) malloc(N*sizeof(double));
	if ((v1 == NULL) || (v2 == NULL) || (v2 == NULL)) {	
		printf("No hay suficiente espacio para los vectores \n");
		exit(-2);
	}

	//Inicializar vectores
	#pragma omp parallel private(i)
	{
		#pragma omp sections
		{
			#pragma omp section
			for(i=0;i<(N/4);i++){
				v1[i] = N*0.1+i*0.1; 
				v2[i] = N*0.1-i*0.1;	
			}
			#pragma omp section
			for(i=(N/4);i<2*(N/4);i++){
				v1[i] = N*0.1+i*0.1; 
				v2[i] = N*0.1-i*0.1;
			}
			#pragma omp section
			for(i=2*(N/4); i<3*(N/4); i++){
				v1[i] = N*0.1+i*0.1; 
				v2[i] = N*0.1-i*0.1;
			}
			#pragma omp section
			for(i=3*(N/4); i<4*(N/4); i++){
				v1[i] = N*0.1+i*0.1; 
				v2[i] = N*0.1-i*0.1;
			}
			
		}
	}

	start=omp_get_wtime();
	//Calcular suma de vectores
	#pragma omp parallel private(i)
	{
		#pragma omp sections
		{
			#pragma omp section
			for(i=0;i<(N/4);i++){
				v3[i] = v1[i] + v2[i];
			}
			#pragma omp section
			for(i=(N/4);i<2*(N/4);i++){
				v3[i] = v1[i] + v2[i];	
			}
			#pragma omp section
			for(i=2*(N/4); i<3*(N/4); i++){
				v3[i] = v1[i] + v2[i];	
			}
			#pragma omp section
			for(i=3*(N/4); i<4*(N/4); i++){
				v3[i] = v1[i] + v2[i];
			}
		}
	}
	end=omp_get_wtime();

	/*for(i=0;i<N;i++){
		printf("V3[%i]=%f\n", i, v3[i]);
	}*/

	printf("Tiempo que se ha tardado en hacer la suma-->%11.9f\n", end-start);
	printf("V1[0]=%f\nV1[N-1]=%f\nV2[0]=%f\nV2[N-1]=%f\nV3[0]=%f\nV3[N-1]=%f\n",
			v1[0], 	  v1[N-1],    v2[0],    v2[N-1],    v3[0],    v3[N-1]);

	return 0;
}
