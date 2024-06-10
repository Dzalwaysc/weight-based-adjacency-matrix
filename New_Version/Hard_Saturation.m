function tau = Hard_Saturation(tau)
    if abs(tau) > 10
        tau = sign(tau) * 10;
    end
end