function y = S1(v_curent, e)
  
  if e > 10
    y = v_curent + 10;
  elseif e > 0
    y = v_curent + 1;
  else
    y = v_curent;
  end
  
endfunction