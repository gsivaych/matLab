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
	* Basic signal operations : [Decompose into Odd and Even parts](signalsAndSystem/decomposeFunction.m), 
		[Shifting](signalsAndSystem/shifting.m), [Scaling](signalsAndSystem/scaling.m)
	* [CTFT](/signalsAndSystem/CTFT.m) , [DTFT](signalsAndSystem/DTFT.m) of Rectangular Pulse, 
		[8 pt FFT](signalsAndSystem/fft_divideAndConquer.m)
	* [Convolution](signalsAndSystem/convolution.m), [Linear Convolution](signalsAndSystem/linearConvolution.m)
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
* Advanced Numerical Methods : UMA 061
	* Differentiation & Integration
		* Romberg Integration
#
* Digital Signal Processing : UEC 502
	* Basics : 
		* [Ramp Signal](dsp/ramp.m), [Signum function](dsp/signum.m),
			[Decomposing a function into Even & Odd parts](dsp/decomposeFunction.m) 
		* [Frequenecy & phase](dsp/sineWave.m) - Sine wave **,** [Duty cycle](dsp/squareWave.m) - Square wave
	* [DFT IDFT](dsp/dft_IDFT.m)
	* [Convolution](dsp/convolution.m)
		* [Circular Convolution](dsp/circularConv.m)
		* [Circular Convolution using DFT IDFT](dsp/circularConv_using_dftIDFT.m)
		* [Circular Convolution using Linear Convolution](dsp/circularConv_using_linearConv.m)
		* [Linear Convolution using Circular Convolution](dsp/linearConv_using_circularConv.m)
	* FFTs (Fast Fourier Transforms)
		* [Cooley–tukey algorithm](dsp/fft_divideAndConquer.m) (divide and conquer)
		* [Decimation in Time](dsp/fft_dit.m)
			* [Radix 2](dsp/fft_radix2_dit.m)
			* [Split Radix](dsp/fft_splitRadix.m)
		* [Decimation in Frequency](dsp/fft_dif.m)
			* [Radix 2](dsp/fft_radix2_dif.m)
	* [Frequency Response of Window functions](dsp/windowResponses.m)
	* Digital Filter Design
		* [FIR LowPass using Hanning Window](dsp/FIR_lowpass_Windowing.m)
		* [FIR BandPass using Kaiser Window](dsp/FIR_bandpass_Kaiser.m)
		* [Butterworth HighPass](dsp/FIR_highpass_Butterworth.m)
		* [Chebyshev LowPass](dsp/FIR_lowpass_Chebyshev.m)
