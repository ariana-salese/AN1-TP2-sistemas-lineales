

function matriz_inversa = inversa(A, ds)
  
  n = columns(A);
  identidad = eye(n);
  matriz_inversa = zeros(n, n);
  
  for i = 1:n
    matriz_inversa(:, i) = eliminacion_de_gauss(A, identidad(:,i), ds);
  endfor
  
endfunction