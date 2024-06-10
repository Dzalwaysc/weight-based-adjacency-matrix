## 1. Main

Simulation_Main.m

## 2. Control Solve

### Weight-based Adjacency Matrix
involves the calculation of Eqs. (13)-(16)
- Weight_Matrix.m: the calculation of modified trustworthiness $\zeta$ - Eqs. (13)-(16)

### Hierarchical Observer
involve the calculation of Eq. (19)
- Estimation.m: the calculation of estimations $\delta_{\diamond}, \diamond=\{\breve{\eta}, \Delta \eta, \breve{\omega}, \Delta \omega\}$ - Eq. (19)

### Dead Zone Model
involves the calculation of Eq. (6)
- DOZM.m: the calculation of dead-zone model $P(\cdot)$ - Eq. (6)
- Pra.m: the calculation of fitting gain $u(\cdot)$ - the definition below Eq. (A5)
- density.m: set the density function $\rho( \mathfrak{T} )$ - Eq. (22)
- dead_zone.m: the dead zone operator $z(a,b)$ - the definition below Eq. (6)
- ck.m: the parameter $c_{ik}$ - Eq. (7)

### Anti-HCCDAs Weight-based Distributed Formation Control
involve the calculation of Eq. (21)
- Control.m: the calculation of control signal $\tau$ - Eq. (21)

### Plant Iteration
involves the calculation of Eq. (A1)-(A2)
- plant.m: the model iteration based on Eq. (A1)-(A2)
- obtain_M.m: the set of inertia matrix $M$
- obtain_J.m: the calculation of rotation matrix $J$

### Plant Setting
- HCCDAs_Channel.m: impose the STC and VTV attacks on the states (CTA attack is imposed before the line of code where the model iteration occurs).
- Hard_Saturation.m: the control saturation constraint $\text{sat}(\tau, \bar{\tau})$
- Dwell_Time.m: the setting of the dwell time of sensing devices $\Delta t$

### Plot

- res_plot_4_connected.m: draw the results of the 4-connect case
- res_plot_2_connected.m: draw the results of the 2-connect case
- HCCDAs_form_plot.m: draw HCCDAs on the 4th member.
- ship_contour.m: draw the vehicle model.
- Lumped_Uncertainties.m: calculate the lumped uncertainties $\Delta \eta$ and $\Delta \omega$

### Other Tools

- sig.m: given $x$ and $a$, calculate $\text{sign}(x)|x|^{a}$
- posPi_2_nagPi.m: constrain $\phi$ within $(-\pi, \pi]$
- Creat_Graph.m: Plot a graph. it is used to preview what the constructed graph looks like.
- PiecewiseLike_Function.m: it is used to construct a piecewise-like smooth function, and the VTV attack on the 4-th member is an example of such a function.

