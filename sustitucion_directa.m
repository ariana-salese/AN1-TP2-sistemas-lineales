
function solucion = sustitucion_directa(A, b, ds)
  n = columns(A);
  solucion = zeros(n,1);
  
  solucion(1,1) = redondear(b(1) / A(1,1), ds);
  suma = 0;
  
  for i = 2:n
       suma = 0;
    for j = 1:i
       suma = redondear(suma + redondear(A(i,j) * solucion(j,1), ds), ds);
    endfor
    solucion(i,1) = redondear(redondear(b(i) - suma, ds)/A(i,i), ds);
  endfor
endfunction