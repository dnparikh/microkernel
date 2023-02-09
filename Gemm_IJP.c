#define alpha( i,j ) A[ (j)*ldA + i ]   // map alpha( i,j ) to array A 
#define beta( i,j )  B[ (j)*ldB + i ]   // map beta( i,j )  to array B
#define gamma( i,j ) C[ (j)*ldC + i ]   // map gamma( i,j ) to array C

#define MR 4
#define NR 4


void MyGer( int m, int n, double *x, int incx,
      double *y, int incy, double *A, int ldA ); 

void MyGemm( int m, int n, int k, double *A, int ldA,
	     double *B, int ldB, double *C, int ldC )
{
  for ( int j=0; j<n; j+= NR )
    for ( int i=0; i<m; i+= MR )
      for ( int p=0; p<k; p++ )
        MyGer(  ,  ,  ,  ,  ,  ,  , );
       
}
  
