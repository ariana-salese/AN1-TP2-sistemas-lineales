
function numero_condicion = numero_condicion_matriz(A, ds)
  
  numero_condicion = norm(A, 'inf')*norm(inversa(A, ds), 'inf');
    
endfunction