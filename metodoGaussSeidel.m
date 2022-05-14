function vector_resultado = metodoGaussSeidel(ds)
  
  res = [-0.01; -0.01; -0.01; -0.01; -0.01; -0.01];
  
  for i = 0:20
  
    res(1,1) = 10 + 25 * res(2,1) + 50 * res(3,1);
    res(2,1) = (25 * res(1,1) + res(3,1) + 30 * res(4,1)) / 56;
    res(3,1) = (50 * res(1,1) + res(2,1) + 55 * res(4,1)) / 106;
    res(4,1) = (6 * res(2,1) + 11 * res(3,1) + 5 * res(5,1) + 10 * res(6,1)) / 32;
    res(5,1) = (25 * res(4,1) + res(6,1)) / 56;
    res(6,1) = (50 * res(4,1) + res(5,1)) / 106;
  
  endfor
 
  vector_resultado = res;
  
endfunction