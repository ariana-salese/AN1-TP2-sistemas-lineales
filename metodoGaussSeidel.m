function vector_resultado = metodoGaussSeidel(A, b)
  
  res = [0; 0; 0; 0; 0; 0];
  res_inicial = res;
  n = rows(A);
  
  do
    for j = 1:n      
      res(j,1)=(b(j)-(A(j,1:j-1)*res(1:j-1))-(A(j,j+1:n)*res(j+1:n)))/A(j,j);
    endfor
    
  error = norm(res - res_inicial, inf);
  res_inicial = res;
  
  until (error < 0.0001)

  vector_resultado = res;
endfunction