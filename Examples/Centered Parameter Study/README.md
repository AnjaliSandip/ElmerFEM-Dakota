Vortex Shedding (2D, Transient)

This is a common benchmark problem in fluid-structure interaction problems [1]. 


 - Elmer solver: FlowSolve
 
 - Elmer files courtesy Elmer Tutorial Files GUI
   http://www.nic.funet.fi/pub/sci/physics/elmer/doc/   (For Elmer vortex shedding project description, refer to chapter 10 in ElmerTutorials.pdf file)
   
 - Boundary conditions: inlet (parabolic fully developed laminar velocity profile), no-slip walls and outlet (vertical component equal to zero). 
 
 - Data analysis: Centered parameter study (CPS)
   https://dakota.sandia.gov/sites/default/files/docs/6.10/html-ref/method-centered_parameter_study.html
   
 - Input parameter: Reynold's number (by varying the maximum velocity at the cylinder inlet) -- between 0 and 100.
 
 - Output parameter: Drag coefficient (determined using simulation output, Drag force in Newtons) --final timestep
 
 - The results from this study were in good agreement (max. discrepancy - 3%) with literature data [1 - 4].


References:
[1] Turek, S., & Schäfer, M. (1996). Recent benchmark computations of laminar flow around a cylinder.
[2] https://www.featool.com/model-showcase/04_fluid_dynamics_03_flow_around_cylinder1/
[3] John V, Matthies G. Higher-order finite element discretizations in a benchmark problem for incompressible flows. International Journal for Numerical Methods in Fluids 2001.
[4] Nabh G. On higher order methods for the stationary incompressible Navier-Stokes equations. PhD Thesis, Universitaet Heidelberg, 1998.

