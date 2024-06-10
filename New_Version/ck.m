function out = ck(R)
    fun = @(x) density(x,R);
    out = integral(fun, 0, R, 'ArrayValued', true);
end