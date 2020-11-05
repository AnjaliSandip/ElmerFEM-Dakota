Electromagnetics (3D, Steady state)

The interface program was validated against a 3D, steady state benchmark test: magnetic field induced by a potential difference applied over a wire of finite length [1, 2].  

- Objective: Determine the effect of changes in wire radius (+ 10%) and electric conductivity (+ 2000000 A/m-V) on maximum field value for joule heating
- Analytical model: Implemented in MATLAB
- Elmer FEM solver: WhitneyAV
- Data analysis: Latin hypercube sampling study, with a sample size of 400; input parameters were distributed normally;  Asynchronous local parallelism was implemented, 4 evaluations performed concurrently.
- Results: Numerical model predictions were in good agreement with the analytical model (refer to results.jpg).  The numerical model predicts that for the changes in the wire’s material and geometric parameters, there is a 95% probability that the maximum field value for joule heating would vary between 0.004 and 0.011 watts.  -In addition, design and analysis of computer experiments (DACE) technique was employed to generate training data, a sample size of 50 was chosen.  A linear regression fit was applied to the training data to construct the global surrogate model.  Latin hypercube sampling study was then performed on the global surrogate model. The DACE technique was shown to reduce the total run time by 87% for the benchmark test while maintaining the predictive accuracy of the numerical model.


The benchmark test demonstrates the key capabilities of Elmer FEM-Dakota interface program: uncertainty quantification, surrogate modelling and parameter studies. The files required to reproduce the benchmark test are provided in the software repository.


References:
[1] Bossavit A. Computational electromagnetism: variational formulations, complementarity, edge elements. Academic Press; 1998.  
[2] Råback P, Malinen M, Ruokolainen J, Pursula A, Zwinger T. Elmer models manual. Computation of magnetic fields in 3D, CSC–IT Center for Science, Helsinki, Finland. 2013 Feb 1.  
