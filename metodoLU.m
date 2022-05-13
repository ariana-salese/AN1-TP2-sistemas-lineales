
function vector_resultado = metodoLU(A, b, ds)
  
  [U, _, m] = triangulacion(A, b, ds);
  
  L = matriz_L(m, columns(A));
  
  y = sustitucion_directa(L, b, ds);
  
  vector_resultado = sustitucion_inversa(U, y, ds);
  
endfunction

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