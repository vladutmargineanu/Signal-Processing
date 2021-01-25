% Functia care calculeaza convolutia

function y = func_conv(x, h, size_conv)
  M = length(h);
  y = zeros(1, size_conv);
  
  for i=[1:size_conv]
      y(i) = h * x(M+i-1:-1:i)';
  end
  
endfunction
