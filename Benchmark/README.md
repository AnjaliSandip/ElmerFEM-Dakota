Electromagnetics (3D, Steady state)

The interface program was validated against a 3D, steady state benchmark test: magnetic field induced by a potential difference applied over a wire of finite length [1, 2].  
The material properties of the wire are that of copper.  The wire is aligned in the z direction and is surrounded by air.  
The objective was to determine the effect of changes in wire radius (+ 10%) and electric conductivity (+ 2 x 106 A/m-V) on maximum field value for joule heating. 


Analytical model was implemented in Matlab.  The numerical model was built in Elmer FEM using unstructured, hexahedral mesh elements and quadratic linear elements.  
Elmer FEM’s electromagnetic solver, WhitneyAV, was chosen for this study.  The solver implements classic Lagrange interpolation and edge element basis functions to approximate the scalar and the vector potentials, respectively [2]. 


Latin hypercube sampling study was performed, with a sample size of 400.  The input parameters were distributed normally.  
Asynchronous local parallelism was implemented, 4 evaluations performed concurrently.  The results from the numerical model were in good agreement with the analytical model as shown in Fig. 2.  
The numerical model predicts that for the changes in the wire’s material and geometric parameters, there is a 95% probability that the maximum field value for joule heating would vary between 0.004 and 0.011 watts.  
In addition, design and analysis of computer experiments (DACE) technique was employed to generate the training data, a sample size of 50 was chosen.  
A linear regression fit was applied to the training data to construct the global surrogate model.  Latin hypercube sampling study was then performed on the global surrogate model. 
Were the results of the sampling study on surrogate model same as the truth? Should I mention the reduction in the CPU time.  
The DACE technique was shown to reduce the total run time by 87% for the benchmark test. 



References:
[1] Bossavit A. Computational electromagnetism: variational formulations, complementarity, edge elements. Academic Press; 1998.  
[2] Råback P, Malinen M, Ruokolainen J, Pursula A, Zwinger T. Elmer models manual. Computation of magnetic fields in 3D, CSC–IT Center for Science, Helsinki, Finland. 2013 Feb 1.  
