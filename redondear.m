
function res = redondear(x, ds)

  # Redondea el valor de x a ds dˆqgitos significativos
  
  if x != 0
    D = 10^(ds-ceil(log10(abs(x))));
    res = round(x*D)/D;
  else
    res = 0;
  endif

endfunction