
function vector_resultado = eliminacionDeGauss(A, b, ds)
  
  [matriz_triangular_a, vector_b, _] = triangulacion(A, b, ds);
  
  vector_resultado = sustitucion_inversa(matriz_triangular_a, vector_b, ds);
  
endfunction





