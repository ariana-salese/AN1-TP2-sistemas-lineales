
function vector_resultado = eliminacion_de_gauss(A, b, ds)
  
  [matriz_triangular_a, vector_b, _] = triangulacion(A, b, ds);
  
  vector_resultado = sustitucion_inversa(matriz_triangular_a, vector_b, ds);
  
endfunction





