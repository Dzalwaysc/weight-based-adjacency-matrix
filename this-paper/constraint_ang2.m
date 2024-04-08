function out = constraint_ang2(in)
    ang = in(3);
    if ang > pi
        ang = 2*pi - ang;
    elseif ang <= -pi
        ang = 2*pi + ang;
    end
    in(3) = ang;

    out = in;
end