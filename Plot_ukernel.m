%% Load timing data

output_ukernel
%% Make sure you are getting the right answer
% In output_IJP.m, for different matrix sizes, timing data is collected as well 
% as how close the answer is to the answer attained by the reference implementation.  
% Here we look at the maximum difference over all experiments.  This should be 
% somewhere on the order of  $10^{-11}$  or smaller.  You can expect some difference 
% between the two implementations, due to round-off error and the order in which 
% computations are performed.

assert( max(abs(data(:,6))) < 1.0e-10, 'Hmmm, better check if there is an accuracy problem');
%% Plot the timing data.
% A first graph shows the execution time of the implementation in Gemm_IJP.m 
% for various matrix sizes $m = n = k$.

% Close all existing figures. (This is important for the ".m" version of this file.)
close all

%% Plotting performance (rate of computation)
% We will often examine the rate at which Gemm_IJP.c  compute rather than the 
% time required for completing the computation.
% 
% * When all matrices are $n \times n$, we know that a matrix-matrix  multiplication$ 
% A B + C$ requires $2n^3$ floating point operations (flops).  
% * This means that the number of operations performed per second is given by 
% ${2 n^3}/{t}$ flops, where $t$ is the time, in seconds, for computing the multiplication.  
% * Now, a typical current core can perform billions of flops per second, so 
% instead we report performance in GFLOPS. (billions of flops per second): ${2 
% n^3}/{t} \times 10^{-9}$.  This is reported computed in the third (for the reference 
% implementation) and fifth colum (for IJP) of the data file. 

% Create figure
figure2 = figure('Name','GFLOPS','visible','off');

% Create axes, labels, legends.  In future routines for plotting performance, 
% the next few lines will be hidden in the script.
axes2 = axes('Parent',figure2);
hold(axes2,'on');
ylabel( 'GFLOPS', 'FontName', 'Helvetica Neue' );
xlabel( 'matrix dimension m=n=k', 'FontName', 'Helvetica Neue' );
box(axes2,'on');
set( axes2, 'FontName', 'Helvetica Neue', 'FontSize', 18);
             
% Plot time data for IJP  
% Important: the myplot routine is a wrapper to plot that gets around 
% a incompatibility between MATLAB and Octave regarding the 'DisplayName'
% parameter.  It is important to keep the list of parameters exactly as is,
% with the exact some number of parameters.
plot( data(:,1), data(:,5), 'DisplayName', 'ukernel', 'MarkerSize', 8, 'LineWidth', 2, ...
      'Marker', 'o', 'LineStyle', '-.', 'Color', [0 0 1] );

% Optionally show the reference implementation performance data
if ( 1 )
  plot( data(:,1), data(:,3), 'MarkerSize', 8, 'LineWidth', 2, ...
        'DisplayName', 'Ref', 'Color', [0 0 0] );
end

% Adjust the x-axis and y-axis range to start at 0
v = axis;                   % extract the current ranges
axis( [ 0 v(2) 0 v(4) ] )   % start the x axis and y axis at zero

% Optionally change the top of the graph to capture the theoretical peak
if ( 1 )
    turbo_clock_rate = 2.6;
    flops_per_cycle = 16;
    peak_gflops = turbo_clock_rate * flops_per_cycle;

    axis( [ 0 v(2) 0 peak_gflops ] )  
end

legend2 = legend( axes2, 'show' );
set( legend2, 'Location', 'northwest', 'FontSize', 18) ;

% Uncomment if you want to create a pdf for the graph
print( 'Plot_ukernel_GFLOPS.pdf', '-dpdf' );
%%
