
#MATRIZ AMPLIADA A RESOLVER

A = [1 -25 -50 0 0 0; -25 56 -1 -30 0 0; -50 -1 106 -55 0 0; 0 -30 -55 160 -25 -50; 0 0 0 -25 56 -1; 0 0 0 -50 -1 106];
b = [10; 0; 0; 0; 0; 0];

#A_prueba = [5 8 0; 5 8 9; 0 6 5];
#b_prueba = [3; 5; 7];

# esperado
# 5 8 0 3     5 8 0 3
# 5 8 9 5 --> 0 6 5 7
# 0 6 5 7     0 0 9 2

function [matriz_triangular_a, vector_b, p] = triangulacion(A, b) 
  matriz_ampliada = A(:,:);
  matriz_ampliada = [matriz_ampliada, b(:,:)] 
  
  n = columns(A);
  p = [1:n]; #vector correccion
  
  for i = 1:n - 1
    [max_valor indice] = max(abs(matriz_ampliada(i:end,i)));
    #disp(max_valor)
    matriz_ampliada([i i+indice-1], :) = matriz_ampliada([i+indice-1 i], :);
    p([i i+indice-1]) = p([i+indice-1 i])
    
    for j = i+1:n
      multiplicador = matriz_ampliada(j, i)/matriz_ampliada(i,i);
      matriz_ampliada(j,:) = matriz_ampliada(j,:) - multiplicador*matriz_ampliada(i,:);
      #disp('--------')
      #disp(matriz_ampliada)
      #disp(p)
    endfor
  endfor
  matriz_triangular_a = matriz_ampliada(:,1:n)
  vector_b = matriz_ampliada(:,end)
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


disp('----RESULTADO-----');
[a, b, p] = triangulacion(A, b);

disp('Matriz final:')
disp(a);
disp('b final:')
disp(b);
disp('p final:')
disp(p);

disp(sustitucion_inversa(a, b))