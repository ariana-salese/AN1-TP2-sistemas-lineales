
#MATRIZ AMPLIADA A RESOLVER

output_precision(3);

A = [1 -25 -50 0 0 0; -25 56 -1 -30 0 0; -50 -1 106 -55 0 0; 0 -30 -55 160 -25 -50; 0 0 0 -25 56 -1; 0 0 0 -50 -1 106];
b = [10; 0; 0; 0; 0; 0];

#-------------------------------------------- PUNTO A ------------------------------------------------------------

function [matriz_triangular_a, vector_b, m] = triangulacion(A, b) 
  matriz_ampliada = A(:,:);
  matriz_ampliada = [matriz_ampliada, b(:,:)]; 
  
  n = columns(A);
  m = [];
  
  for i = 1:n - 1  
    for j = i+1:n
      multiplicador = matriz_ampliada(j, i)/matriz_ampliada(i,i);
      m = vertcat(m, [multiplicador]);
      matriz_ampliada(j,:) = matriz_ampliada(j,:) - multiplicador*matriz_ampliada(i,:);
    endfor
  endfor
  matriz_triangular_a = matriz_ampliada(:,1:n);
  vector_b = matriz_ampliada(:,end);
endfunction

function solucion = sustitucion_inversa(A, b)
  n = columns(A);
  solucion = zeros(n,1);
  
  solucion(n,1) = b(n) / A(n,n);
  suma = 0;
  
  for i = n-1:-1:1
       suma = 0;
    for j = i+1:n
       suma = suma + A(i,j) * solucion(j,1);
    endfor
    solucion(i,1) = (b(i) - suma)/A(i,i);
  endfor
endfunction

disp('----MATRIZ ORIGINAL-----');
disp(A)

disp('----RESULTADO-----');
[a, b_trucho, m] = triangulacion(A, b);
disp('Matriz final:')
disp(a);
disp('b final:')
disp(b_trucho);
disp('m final:')
disp(m);

disp('----RESULTADO 2-----');
disp(sustitucion_inversa(a, b_trucho))

#-------------------------------------------- PUNTO B ------------------------------------------------------------

disp('');
disp('----PUNTO B-----');
disp('');

#contruimos la matriz L
function matriz = matriz_L(mult, n)
  
  matriz = zeros(n,n);
  cont = 1;
  
  for columna = 1:n
    for fila = columna+1:n
      matriz(fila, columna) = mult(cont,1);
      cont += 1;
    endfor
  endfor
  
  for i = 1:n
    matriz(i,i) = 1;
  endfor
  
endfunction

function solucion = sustitucion_directa(L, b)
  n = columns(L);
  solucion = zeros(n,1);
  
  solucion(1,1) = b(1) / L(1,1);
  suma = 0;
  
  for i = 2:n
       suma = 0;
    for j = 1:i
       suma = suma + L(i,j) * solucion(j,1);
    endfor
    solucion(i,1) = (b(i) - suma)/L(i,i);
  endfor
endfunction

L = matriz_L(m, columns(A));
U = a;

disp("L")
disp(L)
disp("U")
disp(U)
y = sustitucion_directa(L, b);
sol = sustitucion_inversa(U, y);
disp("sol")
disp(sol)

#-------------------------------------------- PUNTO C ------------------------------------------------------------


