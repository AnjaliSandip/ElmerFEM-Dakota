Vortex Shedding (2D, Transient)

This is a common benchmark problem in fluid-structure interaction problems [1]. 


 - Objective: Determine the effect of changes in Reynold's number (between 0 and 100) on drag coefficient at the final timestep
 - Experimental data: Previous literature [1-4]
 - Numerical model: Implemented in Elmer FEM/FlowSolve Solver [5]
 - Data Analysis: Centered parameter study [6] performed using Dakota
 - Results: Numerical model predictions were in good agreement with the analytical model, max. discrepancy - 3% (refer to results.jpg)
 
   
References:
[1] Turek, S., & Schäfer, M. (1996). Recent benchmark computations of laminar flow around a cylinder.
[2] https://www.featool.com/model-showcase/04_fluid_dynamics_03_flow_around_cylinder1/
[3] John V, Matthies G. Higher-order finite element discretizations in a benchmark problem for incompressible flows. International Journal for Numerical Methods in Fluids 2001.
[4] Nabh G. On higher order methods for the stationary incompressible Navier-Stokes equations. PhD Thesis, Universitaet Heidelberg, 1998.
[5] Elmer GUI Tutorials Manual/Chapter 10/Vortex Shedding http://www.nic.funet.fi/pub/sci/physics/elmer/doc/ 
[6] https://dakota.sandia.gov/sites/default/files/docs/6.10/html-ref/method-centered_parameter_study.html


