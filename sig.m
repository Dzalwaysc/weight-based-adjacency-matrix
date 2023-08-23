function out = sig(in, order)
    out = sign(in) .* (abs(in).^order);
end