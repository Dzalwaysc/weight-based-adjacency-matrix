function out = dead_zone(r,u,R)
    pr = density(r,R);
    zr = max(u-r, min(0,u+r));
    out = pr*zr;
end