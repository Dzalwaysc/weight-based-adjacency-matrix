function out = posPi_2_nagPi(in)
    ang = in(3);
    while abs(ang) > pi
        if ang >= pi
            ang = ang - 2*pi;
        elseif ang <= -pi
            ang = ang + 2*pi;
        end
    end
    in(3) = ang;

    out = in;
end