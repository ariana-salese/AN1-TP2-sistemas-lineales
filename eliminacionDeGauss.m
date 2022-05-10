
#MATRIZ AMPLIADA A RESOLVER

#A = [1 -25 -50 0 0 0 10; -25 56 -1 -30 0 0 0; -25 56 -1 -30 0 0 0; 0 -30 -55 160 -25 -50 0; 0 0 0 -25 56 -1 0; 0 0 0 -50 -1 106 0];
#b = [10 0 0 0 0 0];

A_prueba = [5 8 0; 5 8 9; 0 6 5];
b_prueba = [3 5 7];

# esperado
# 5 8 0 3     5 8 0 3
# 5 8 9 5 --> 0 6 5 7
# 0 6 5 7     0 0 9 2

function [matriz_triangular, b_de_triangular, p] = triangulacion(A, b) 
  matriz_triangular = A(:,:);
  b_de_triangular = b(:,:);
  n = columns(A) - 1;
  p = []; #vector correccion
  
  for i = 1:n - 1
    for j = i+1:n
      multiplicador = matriz_triangular(j, i)/matriz_triangular(i,i);
      matriz_triangular(j,:) = matriz_triangular(j,:) - multiplicador*matriz_triangular(i,:);
      b_de_triangular(j) = b_de_triangular(j) - multiplicador*b(i);
      
      disp('--------')
      disp(matriz_triangular)
    endfor
  endfor
  
endfunction

disp('----RESULTADO-----');
[a, b, p] = triangulacion(A_prueba, b_prueba);

disp('Matriz final:')
disp(a);
disp('b final:')
disp(b);
disp('p final:')
disp(p);
