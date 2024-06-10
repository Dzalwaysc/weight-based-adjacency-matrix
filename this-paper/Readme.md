## 1. Main

Simulation_Main.m

## 2. Control Solve

### Weight-based Adjacency Matrix
involve the calculation of Eqs. (13)-(16)
- Weight_Matrix.m

### Hierarchical Observer
involve the calculation of Eq. (19)
- Estimation.m

### Dead Zone-based Model
involve the calculation of Eq. (6)
- DOZM.m: the calculation of $P(\cdot)$
- Pra.m: the calculation of $u(\cdot)$
- density.m: the density function $\rho( \mathfrak{T} )$
- dead_zone.m: the dead zone $z(a,b)$
- ck.m: the parameter $c_{ik}$

### Anti-HCCDAs Weight-based Distributed Formation Control
involve the calculation of Eq. (21)
- Control.m

### Plant Iteration
involve the calculation of Eq. (A1)-(A2)
- plant.m: the model iteration.
- obtain_M.m
- obtain_J.m

### Plant Setting
- HCCDAs_Channel.m: impose the STC and VTV attacks on the states (CTA attack is imposed before the line of code where the model iteration occurs).
- Hard_Saturation.m: the control saturation constraint $\text{sat}(\tau, \bar{\tau})$
- Dwell_Time.m: the setting of the dwell time of sensing devices $\Delta t$

### Plot

- res_plot_4_connected.m: draw the results of 4-connect case
- res_plot_2_connected.m: draw the results of 2-connect case
- HCCDAs_form_plot.m: draw HCCDAs on 4-th member.
- ship_contour.m: draw the vehicle model.
- Lumped_Uncertainties.m: calculate the lumped uncertainties $\Delta \eta$ and $\Delta \omega$

### Other Tools

- sig.m: given $x$ and $a$, calculate $\text{sign}(x)|x|^{a}$
- posPi_2_nagPi.m: constrain $\phi$ within $$
- Creat_Graph.m: Plot a graph. it is used to preview what the constructed graph looks like.
- PiecewiseLike_Function.m: it is used to construct a piecewise-like smooth function, and the VTV attack on the 4-th member is an example of such a function.
