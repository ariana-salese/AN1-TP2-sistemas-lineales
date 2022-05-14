
#MATRIZ AMPLIADA A RESOLVER

output_precision(6)

A = [1 -25 -50 0 0 0; -25 56 -1 -30 0 0; -50 -1 106 -55 0 0; 0 -30 -55 160 -25 -50; 0 0 0 -25 56 -1; 0 0 0 -50 -1 106];
b = [10; 0; 0; 0; 0; 0];

disp('----MATRIZ ORIGINAL-----');
disp(A);

#-------------------------------------------- PUNTO A ------------------------------------------------------------

disp('');
disp('----RESULTADO A-----');
disp('');

disp('6 decimales de presicion')
disp(eliminacionDeGauss(A, b, 6));


#-------------------------------------------- PUNTO B ------------------------------------------------------------

disp('');
disp('----RESULTADO B-----');
disp('');

disp('3 decimales de presicion')
disp(metodoLU(A, b, 3));
disp('6 decimales de presicion')
disp(metodoLU(A, b, 6));

#-------------------------------------------- PUNTO C ------------------------------------------------------------

disp('');
disp('----RESULTADO C-----');
disp('');

disp('inversa de A:')
disp(inversa(A, 6));

disp('numero de condicion de A:')
disp(numero_condicion_matriz(A, 6))

#-------------------------------------------- PUNTO D ------------------------------------------------------------

disp('');
disp('----RESULTADO D-----');
disp('');

disp(metodoGaussSeidel(1))