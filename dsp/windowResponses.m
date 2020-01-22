%% Time and Frequency domain responses of various Window Functions.
%%% Requires Signal Processing Toolbox
clc; clear all;
N = 25; M = N-1;
w = zeros(N,1);

%% Rectangular window
% for n = 0:M
%     w(n+1) = 1;
% end
% w_ = rectwin(N);

%% Triangular/Bartlett window
%   are almost similar
% for n = 0:M
%     w(n+1) = 1-(2*abs(n-M/2)/M);
% end
% w_ = triang(N);
% w_ = bartlett(N);

%% Hanning window
% for n = 0:M
%     w(n+1) = 0.5 - 0.5*cos(2*pi*n/M);
% end
% w_ = hann(N);

%% Hamming window
% for n = 0:M
%     w(n+1) = 0.54 - 0.46*cos(2*pi*n/M);
% end
% w_ = hamming(N);

%% Modified Bartlett-Hanning window
% for n = 0:M
%     w(n+1) = 0.62 - 0.48*abs(n/M-0.5) + 0.38*cos(2*pi*(n/M-0.5));
% end
% w_ = barthannwin(N);

%% Blackman window
% if mod(N,2) == 0
%     M_ = N/2 - 1;
% else
%     M_ = (N-1)/2;
% end
% for n = 0:M_
%     w(n+1) = 0.42 - 0.5*cos(2*pi*n/M) + 0.08*cos(4*pi*n/M);
%     w(M-n+1) = w(n+1); % flip half around mid-point, symmetric
% end
% w_ = blackman(N);

%% Parzen window
% n = -M/2:M/2;
% w (abs(n) <= M/4) = 1 - 6*(2*abs(n(abs(n) <= M/4))/N).^2 ...
%                       + 6*(2*abs(n(abs(n) <= M/4))/N).^3;
% w (abs(n) > M/4) = 2*(1-2*abs(n(abs(n) > M/4))/N).^3;
% w_ = parzenwin(N);

%% Tukey (tapered cosine) window
% x = linspace(0,1,N);
% r = 0.4; % ratio of cosine-tapered section to the entire window, default = 0.5
% w = ones(N,1);
% w (x < r/2) = 0.5*(1 + cos(2*pi*(x(x < r/2)-r/2)/r));
% w (x >= 1-r/2) = 0.5*(1 + cos(2*pi*(x(x >= 1-r/2)-1+r/2)/r));
% w_ = tukeywin(N,r);

%% 4-term Blackman-Harris window
% a0 = 0.35875; a1 = 0.48829; a2 = 0.14128; a3 = 0.01168;
% for n = 0:M
%     w(n+1) = a0 - a1*cos(2*pi*n/M) + a2*cos(4*pi*n/M) - a3*cos(6*pi*n/M);
% end
% w_ = blackmanharris(N);

%% Nuttall-defined, 4-term Blackman-Harris window
% maximim sidelobes are minimized, produces slightly lower sidelobes
% a0 = 0.3635819; a1 = 0.4891775; a2 = 0.1365995; a3 = 0.0106411;
% for n = 0:M
%     w(n+1) = a0 - a1*cos(2*pi*n/M) + a2*cos(4*pi*n/M) - a3*cos(6*pi*n/M);
% end
% w_ = nuttallwin(N);

%% Bohman window
% lvector = linspace(-1,1,N);
% for n = 0:M
%     abs_x = abs(lvector(n+1));
%     w(n+1) = (1 - abs_x)*cos(pi*abs_x) + sin(pi*abs_x)/pi;
% end
% w_ = bohmanwin(N);

%% Chebyshev window
% r = 80; % dB : relative sidelobe atteneuation, default = 100.0 dB
% w  = chebwin(N);
% w_ = chebwin(N,r);

%% Flat-top weighted window
% a0 = 0.21557895; a1 = 0.41663158; a2 = 0.277263158;
% a3 = 0.083578947; a4 = 0.006947368;
% for n = 0:M
%     w(n+1) = a0 - a1*cos(2*pi*n/M) + a2*cos(4*pi*n/M)...
%                 - a3*cos(6*pi*n/M) + a4*cos(8*pi*n/M);
% end
% w_ = flattopwin(N);

%% Gaussian window
% Alpha = 3.7; % default = 2.5
% n = -M/2:M/2;
% w = exp(-0.5*(2*Alpha*n/M).^2);
% w_ = gausswin(N,Alpha);

%% Kaiser window
% aplha = 80; % dB : sidelobe atteneuation
% if aplha < 21
%     beta = 0;
% elseif aplha > 50
%     beta = 0.1102*(aplha - 8.7);
% else
%     beta = 0.5842*(alpha-21)^0.4 + 0.07886*(alpha-21);
% end
% n = 0:M;
% order = 0; % zeroth-order modified Bessel function of the first kind
% w = besseli(order,beta*sqrt(1-(2*(n-M/2)/M).^2)) / besseli(order,beta);
% w_ = kaiser(N,beta); % beta defaults to 0.5, & corresponds to 13.6 dB sidelobe atteneuation

%% Taylor window
nbar = 6; % number of `nearly constant-level` sidelobes adjacent to mainlobe, default = 4
sll = -60; % dB sidelobe level, default = -30 dB
w  = taylorwin(N);
w_ = taylorwin(N,nbar,sll);

%% Window Visualization
wvtool(w)
wvtool(w_)