function out = sgn_(in, small_variable)
    if in > small_variable
        out = 1;
    elseif ge(abs(in), small_variable)
        out = sig(in,1);
    else
        out = -1;
    end
end