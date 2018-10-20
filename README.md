# myMATLABcode

	Clone the repository `git clone https://github.com/gsivaych/matLab`

## MATLAB

- Know more about [MATLAB](https://www.mathworks.com/products/matlab.html)

- MATLAB [Documentation](https://www.mathworks.com/help/matlab/)

## Academic
* Signals and Systems : UEC 404
	* Basic signals : [Unit Impulse](signalsAndSystem/unitImpulse.m), [Unit Step](signalsAndSystem/unitStep.m),
		[Unit Ramp](signalsAndSystem/unitRamp.m), [Ramp](signalsAndSystem/rampFunction.m), 
		[Sinc](signalsAndSystem/sincFunction.m)
	* Basic signal operations : [Decompose into Odd and Even parts](signalsAndSystem/decomposeFunction), 
		[Shifting](signalsAndSystem/shifting.m), [Scaling](signalsAndSystem/scaling.m)
	* [CTFT](/signalsAndSystem/CTFT.m) , [DTFT](signalsAndSystem/DTFT.m) of Rectangular Pulse, 
		[8 pt FFT](signalsAndSystem/fft_divideAndConquer.m)
	* [Convolution](signalsAndSystem/convolution.m), [Linear Convolution](linearConvolution.m)
	* [Z-transform](/signalsAndSystem/ztrans2.m) of given impulse response of system
#
* Numerical Analysis  : [UMA 007](https://sites.google.com/site/nummaths/)
	* Roots of non-linear equation : [Bisection](numericalAnalysis/bisectionMethod.m),
		[Fixed-point iteration](numericalAnalysis/fixedPointMethod.m),
		[Newton's](numericalAnalysis/newtonsMethod.m) and 
		[Secant](numericalAnalysis/secantMethod.m) methods
	* [LU factorisation](numericalAnalysis/LUfactorisation.m) using Gauss Elimination method
	* Solving System of Linear equations
		* [Gauss Elimination method](numericalAnalysis/gaussianElimination.m)
		* [Gauss-Seidel method](numericalAnalysis/gaussSeidel.m), [SOR iterative method](numericalAnalysis/SORmethod.m)
		* [Relaxation factor vs Iterations required](numericalAnalysis/relaxationFactor.m) for SOR
		* [Jacobi Iterative method](numericalAnalysis/jacobiMethod.m) for diagonally dominant system
	* Eigen Value and Eigen Vector using [Power method](numericalAnalysis/powerMethod.m)
	* [Lagrange interpolating polynomials](numericalAnalysis/lagrangeInterpolation.m) 
		and [Function Plot](numericalAnalysis/lagrangeInterpolation2.m)
	* [Newton's divided-difference interpolating polynomials](numericalAnalysis/newtonsDividedDifference.m)
	* Numerical Integration : Composite [Simpson](numericalAnalysis/compositeSimpson.m)
		and [Trapezoidal](numericalAnalysis/compositeTrapezoidal.m) methods
	* Solving Initial Value Problems
		* [Modified Euler's method](numericalAnalysis/modifiedEulersMethod.m)
		* [Runge-kutta method](numericalAnalysis/rungeKuttaMethod.m) (fourth-order)
#
* Digital Signal Processing : UEC 502
