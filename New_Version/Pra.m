function out = Pra(R,u)
    fun = @(x,u) dead_zone(x,u,R);
    out = integral(@(x) fun(x,u),0,R,'ArrayValued', true);
end