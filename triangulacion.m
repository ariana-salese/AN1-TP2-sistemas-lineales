
function [matriz_triangular_a, vector_b, m] = triangulacion(A, b, ds) 
  matriz_ampliada = A(:,:);
  matriz_ampliada = [matriz_ampliada, b(:,:)]; 
  
  n = columns(A);
  m = [];
  
  for i = 1:n - 1  
    for j = i+1:n
      multiplicador = redondear(matriz_ampliada(j, i)/matriz_ampliada(i,i), ds);
      m = vertcat(m, [multiplicador]);
      for k = 1:n + 1
        matriz_ampliada(j,k) = redondear(matriz_ampliada(j,k) - redondear(multiplicador*matriz_ampliada(i,k), ds), ds);
      endfor
    endfor
  endfor
  
  matriz_triangular_a = matriz_ampliada(:,1:n);
  vector_b = matriz_ampliada(:,end);
  
endfunction