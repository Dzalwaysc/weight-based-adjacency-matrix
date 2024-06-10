function Tk = Dwell_Time(Tk, Loop)
    if mod(Loop, 500) == 0
        Tk(1) = Loop;
    end
    if mod(Loop, 2500) == 0
        Tk(2) = Loop;
    end
    if mod(Loop, 420) == 0
        Tk(3) = Loop;
    end
    if mod(Loop, 3550) == 0
        Tk(4) = Loop;
    end
    if mod(Loop, 600) == 0
        Tk(5) = Loop;
    end
    if mod(Loop, 120) == 0
        Tk(6) = Loop;
    end
    if mod(Loop, 500) == 0
        Tk(7) = Loop;
    end
    if mod(Loop, 1000) == 0
        Tk(8) = Loop;
    end
    if mod(Loop, 1500) == 0
        Tk(9) = Loop;
    end
    if mod(Loop, 200) == 0
        Tk(10) = Loop;
    end
end