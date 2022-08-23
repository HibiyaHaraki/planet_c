#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#define DIM 3  // Dimension
#define NUM 5  // Number of Planets
#define G 6.67430e-20 //Newtonian constant of gravitation

// Absolutevalue of Matrix
double Mat_abs(double a[DIM]) {
  double ans = 0;
  for (int i=0; i<DIM; i++) {
    ans += a[i]*a[i];
  }
  return sqrt(ans);
}

// Equation of Motion Calculation
void Calc_Force(double r[NUM][DIM], double a[NUM][DIM], double m[NUM]) {
  double l[DIM];
  // Initiallize
  for (int i=0; i<NUM; i++) {
    for (int j=0; j<NUM; j++) {
      a[i][j] = 0;
    }
  }
  // Equation of Motion
  for (int i=0; i<NUM; i++) {
    for (int j=i+1; j<NUM; j++) {
      for (int k=0; k<DIM; k++) {
        l[k] = r[i][k] - r[j][k];
      }
      for (int k=0; k<DIM; k++) {
        a[i][k] -= G*m[j]/pow(Mat_abs(l),3)*l[k];
        a[j][k] += G*m[i]/pow(Mat_abs(l),3)*l[k];
      }
    }
  }
}

// Euler Method Calculation
void Euler_Calc(double r_c[NUM][DIM],double r_p[NUM][DIM],double v_c[NUM][DIM],double v_p[NUM][DIM],double a_c[NUM][DIM],double h) {
  for (int i=0; i<NUM; i++) {
    for (int k=0; k<DIM; k++) {
      v_c[i][k] = v_p[i][k] + h*a_c[i][k];
      r_c[i][k] = r_p[i][k] + h*v_p[i][k] + a_c[i][k]*h*h/2;
    }
  }
}

// Main Program
int main(void) {
  int autodef; // auto or manual
  double m[NUM], r_c[NUM][DIM], v_c[NUM][DIM], a_c[NUM][DIM], r_p[NUM][DIM], v_p[NUM][DIM]; // Matrix for Data
  double t=0, h, pint, fint, goal;
  double tmp1[DIM], tmp2[DIM];
  int count=0, pcount, fcount,i,j,k;
  FILE *fp;

  printf("\n --- Program Start --- ");

  // Planet Data
  printf("\n\nInput Planet Data -");
  i = 0;

  // Sun
  m[i] = 1.989e30;
  r_p[i][0] = 0; r_p[i][1] = 0; r_p[i][2] = 0;
  v_p[i][0] = 0; v_p[i][1] = 0; v_p[i][2] = 0;
  i += 1;
  printf("-");

  // Mersury
  m[i] = 3.301e23;
  r_p[i][0] = 57910000/sqrt(3); r_p[i][1] = 57910000/sqrt(3); r_p[i][2] = 57910000/sqrt(3); //57910000[km]
  v_p[i][0] = 47.36/sqrt(14); v_p[i][1] = 47.36*(-3)/sqrt(14); v_p[i][2] = 47.36*2/sqrt(14);  // 47.36[km/s]
  i += 1;
  printf("-");

  // Venus
  m[i] = 4.869e24;
  r_p[i][0] = 108208930/sqrt(3); r_p[i][1] = 108208930/sqrt(3); r_p[i][2] = 108208930/sqrt(3); //108208930[km]
  v_p[i][0] = 35.0214/sqrt(14); v_p[i][1] = 35.0214*(-3)/sqrt(14); v_p[i][2] = 35.0214*2/sqrt(14);  // 35.0214[km/s]
  i += 1;
  printf("-");

  // Earth
  m[i] = 5.972e24;
  r_p[i][0] = 1.495978e8/sqrt(3); r_p[i][1] = 1.495978e8/sqrt(3); r_p[i][2] = 1.495978e8/sqrt(3);  // 1.495978e8[km]
  v_p[i][0] = 29.78/sqrt(14); v_p[i][1] = 29.78*(-3)/sqrt(14); v_p[i][2] = 29.78*2/sqrt(14);  // 29.78[km/s]
  i += 1;
  printf("-");

  // Mars
  m[i] = 6.4171e23;
  r_p[i][0] = 227920000/sqrt(3); r_p[i][1] = 227920000/sqrt(3); r_p[i][2] = 227920000/sqrt(3);  // 227920000[km]
  v_p[i][0] = 24.07/sqrt(14); v_p[i][1] = 24.07*(-3)/sqrt(14); v_p[i][2] = 24.07*2/sqrt(14);  // 24.07[km/s]
  i += 1;
  printf("-");



  if (i != NUM) {
    printf("\n\nError!! (Number of Planets)\n\n");
  } else {
    printf("> Complete!!\n");
  }

  // Calculation Setting
  printf("\nCalculation Setting >");
  autodef = 1;
  if (autodef == 1) {
    goal = 365*24*60*60;
    h = 10;
    pint = 30*24*60*60;
    fint = 24*60*60;

    pcount = (int) pint/h;
    fcount = (int) fint/h;
    if ((fp=fopen("planet_result.txt","w")) == NULL) {
      printf("\nError!! (File Open)");
    }
    printf("Auto Setting - Complete!!\n");
  } else {
    do {
      printf("\nGoal [s] : "); scanf("%lf",&goal); // Calculation time
      printf("Interval [s] : "); scanf("%lf",&h); //Euler Method Interval
    }while (goal < 0 || h < 0 || goal < h);
    printf ("Complete!!\n\n");

    // Output Setting
    printf("Output Setting > \n");
    do {
      printf("Output Interval [s] : "); scanf("%lf",&pint);
    }while(pint < 0 || pint > goal || pint < h);
    pcount = (int) pint/h;
    printf("Complete!!\n\n");

    // File Setting
    printf("File (planet_result.txt) Setting > \n");
    do {
      printf("File Output Interval [s] : "); scanf("%lf",&fint);
    }while(fint < 0 || fint > goal || fint < h);
    fcount = (int) fint/h;

    // File Open
    if ((fp=fopen("planet_result.txt","w")) == NULL) {
      printf("\nError!! (File Open)");
    }
    printf("Complete!!\n\n");
  }

  printf("\n\nResult >\n");
  // Output Initial Data
  printf("\nt = %1.8e\n",t);
  for (i=0; i<NUM; i++) {
    printf("%d |\tR( %12.8e , %12.8e , %1.12e )\tV( %12.8e , %12.8e , %12.8e )\n",i,r_p[i][0],r_p[i][1],r_p[i][2],v_p[i][0],v_p[i][1],v_p[i][2]);
  }

  fprintf(fp,"%1.5e\t",t);
  for (i=0; i<NUM; i++) {
    for (j=0; j<DIM; j++) {
      fprintf(fp,"%1.5e\t",r_p[i][j]);
    }
    for (j=0; j<DIM; j++) {
      fprintf(fp,"%1.5e\t",v_p[i][j]);
    }
  }
  fprintf(fp,"\n");

  // Calculation
  do {
    t += h; count += 1;  // Move Next Step

    // Force Calculation
    Calc_Force(r_p,a_c,m);

    // Euler Method Calculation
    Euler_Calc(r_c,r_p,v_c,v_p,a_c,h);

    // Output
    if (count % pcount == 0) {
      printf("\nt = %1.8e\n",t);
      for (i=0; i<NUM; i++) {
        printf("%d |\tR( %12.8e , %12.8e , %1.12e )\tV( %12.8e , %12.8e , %12.8e )\tA( %12.8e , %12.8e , %12.8e )\n",i,r_c[i][0],r_c[i][1],r_c[i][2],v_c[i][0],v_c[i][1],v_c[i][2],a_c[i][0],a_c[i][1],a_c[i][2]);
      }
    }

    // File Output
    if (count % fcount == 0) {
      fprintf(fp,"%1.5e\t",t);
      for (i=0; i<NUM; i++) {
        for (j=0; j<DIM; j++) {
          fprintf(fp,"%12.8e\t",r_c[i][j]);
        }
        for (j=0; j<DIM; j++) {
          fprintf(fp,"%12.8e\t",v_c[i][j]);
        }
      }
      fprintf(fp,"\n");
    }

    for (i=0; i<NUM; i++) {
      for (j=0; j<DIM; j++) {
        r_p[i][j] = r_c[i][j];
        v_p[i][j] = v_c[i][j];
      }
    }
  }while (t < goal);

  printf("\n\n Calculation Finish!!\n");
  fclose(fp);
  printf(" --- Program End --- \n\n");

  return 0;
}
