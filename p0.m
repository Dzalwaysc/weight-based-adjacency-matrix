function out = p0(R)
    fun = @(x) density(x,R);
    out = integral(fun, 0, R, 'ArrayValued', true);
end