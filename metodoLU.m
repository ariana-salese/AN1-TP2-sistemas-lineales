
function matriz_resultado = metodoLU(A, b_matriz, ds)
  col_b = columns(b_matriz);
  fil_b = rows(b_matriz);
  
  matriz_resultado = zeros(fil_b, col_b);
  
  [U, _, m] = triangulacion(A, zeros(fil_b, 1), ds);
  L = matriz_L(m, columns(A));
  

  for i = 1:col_b
    y = sustitucion_directa(L, b_matriz(:, i), ds);
    
    matriz_resultado(:,i) = sustitucion_inversa(U, y, ds);
  endfor
  
endfunction


#contruimos la matriz L
function matriz = matriz_L(mult, n)
  
  matriz = zeros(n, n);
  cont = 1;
  
  for columna = 1:n
    for fila = columna + 1:n
      matriz(fila, columna) = mult(cont, 1);
      cont += 1;
    endfor
  endfor
  
  for i = 1:n
    matriz(i, i) = 1;
  endfor
  
endfunction