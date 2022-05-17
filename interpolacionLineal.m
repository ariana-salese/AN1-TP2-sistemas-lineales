#Retorna una matriz con los valores naturales faltantes 
function  matriz_resultado = interpolacionLineal(matriz) 
  n = rows(matriz);
  matriz_resultado = zeros(matriz(n, 1) + 1, 2);
  
  for i = 1:n - 1
    x_i = matriz(i, 1);
    x_f = matriz(i + 1, 1);
    
    matriz_resultado(x_i + 1,:) = matriz(i,:);
    matriz_resultado(x_f + 1,:) = matriz(i + 1,:);
  
      for j = x_i + 1:x_f - 1
        valor_en_j = ((x_f - j)/(x_f - x_i))*matriz(i, 2)+((j - x_i)/(x_f - x_i))*matriz(i + 1, 2);
        matriz_resultado(j + 1,:) = [j valor_en_j];
      endfor
  endfor
  
endfunction