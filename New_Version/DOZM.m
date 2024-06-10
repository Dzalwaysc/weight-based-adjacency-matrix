function tau_ = DOZM(tau)
    Mathfrak_H = 20;
    d_1 = Pra(Mathfrak_H,tau(1));
    d_2 = Pra(Mathfrak_H,tau(2));
    d_3 = Pra(Mathfrak_H,tau(3));

    tau_(1) = (ck(Mathfrak_H)*tau(1) - d_1);
    tau_(2) = (ck(Mathfrak_H)*tau(2) - d_2);
    tau_(3) = (ck(Mathfrak_H)*tau(3) - d_3);
end