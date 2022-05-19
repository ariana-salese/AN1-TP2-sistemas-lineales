
#MATRIZ AMPLIADA A RESOLVER

output_precision(7)

A = [76 -25 -50 0 0 0; -25 56 -1 -30 0 0; -50 -1 106 -55 0 0; 0 -30 -55 160 -25 -50; 0 0 0 -25 56 -1; 0 0 0 -50 -1 106];
b = [10; 0; 0; 0; 0; 0];

disp('----MATRIZ ORIGINAL-----');
disp(A);

#-------------------------------------------- PUNTO A ------------------------------------------------------------

disp('');
disp('----RESULTADO A-----');
disp('');

disp('6 decimales de presicion')
disp(eliminacion_de_gauss(A, b, 6));


#-------------------------------------------- PUNTO B ------------------------------------------------------------

disp('');
disp('----RESULTADO B-----');
disp('');

disp('3 decimales de presicion')
disp(metodo_LU(A, b, 3));
disp('6 decimales de presicion')
disp(metodo_LU(A, b, 6));

#-------------------------------------------- PUNTO C ------------------------------------------------------------

disp('');
disp('----RESULTADO C-----');
disp('');

disp('inversa de A:')
disp(inversa(A, 6));

disp('numero de condicion de A:')
disp(numero_condicion_matriz(A, 6))

#-------------------------------------------- PUNTO D ------------------------------------------------------------

disp('');
disp('----RESULTADO D-----');
disp('');

disp(metodo_gauss_seidel(A, b));

#-------------------------------------------- PUNTO E ------------------------------------------------------------

disp('');
disp('----RESULTADO E-----');
disp('');

voltajes = [0 10; 3 10.20; 6 10.30; 9 10.05; 12 9.95; 15 9.85; 18 9.80; 21 10.05; 24 10.15]
voltajes_res = interpolacion_lineal(voltajes);
disp(voltajes_res)

b_matriz = zeros(rows(b), rows(voltajes_res));

for i = 1:rows(voltajes_res)
  b_matriz(1,i) = voltajes_res(i,2);
endfor

disp(metodo_LU(A, b_matriz, 6));

function graficar_voltajes(horas, voltajes)
  
  plot(horas, voltajes);
  
  title("Voltaje segˆyn hora");
  xlabel ("Hora (h)");
  ylabel ("Voltaje (V)");
  grid on
  set(0, "defaulttextfontsize", 24);
  set(0, "defaultaxesfontsize", 16);

  print -djpg voltajes_segun_hora.jpg 
  
endfunction

graficar_voltajes(voltajes(:, 1), voltajes(:, 2));