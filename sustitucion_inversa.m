
function solucion = sustitucion_inversa(A, b, ds)
  n = columns(A);
  solucion = zeros(n,1);
  
  solucion(n,1) = redondear(b(n) / A(n,n), ds);
  suma = 0;
  
  for i = n-1:-1:1
       suma = 0;
    for j = i+1:n
       suma = redondear(suma + redondear(A(i,j) * solucion(j,1), ds), ds);
    endfor
    solucion(i,1) = redondear((b(i) - suma)/A(i,i), ds);
  endfor
  
endfunction
