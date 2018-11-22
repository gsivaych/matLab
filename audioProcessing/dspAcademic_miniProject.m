% Program to design & apply `low-pass` digital filters on input audio file
%    given : passBand edges   -  5.5 kHz,    4.0 kHz,  3.2 kHz
clc; clear all;

global passBand_ripple
passBand_ripple = 0.5; % dB allowed maximum variataion in passband
global stopBand_atteneuation
stopBand_atteneuation = 80; % dB (effectively stop 99.99 %, i.e 0.01 % leakage)

fileName = input('Input audio file name (Str) : ');
% check if file exists
if exist(fileName, 'file')
    % file exists
    [y,Fs] = audioread(fileName); % read file
    t = (0:length(y)-1)/Fs; % duartion of audio
    track = audioplayer(y,Fs);
    disp('Original file.. playing..')
%     playblocking(track)
    
    y1 = lowpassFIR(y,Fs,5.5e3); % 5.5 kHz
    track1 = audioplayer(y1,Fs);
    disp('Filtered with 5.5 kHz.. plyaing..')
%     playblocking(track1);
    
    y2 = lowpassFIR(y,Fs,4e3); % 4.0 kHz
    track2 = audioplayer(y2,Fs);
    disp('Filtered with 4.0 kHz.. plyaing..')
%     playblocking(track2);
    
    y3 = lowpassFIR(y,Fs,3.2e3); % 3.2 kHz
    track3 = audioplayer(y3,Fs);
    disp('Filtered with 3.2 kHz.. plyaing..')
%     playblocking(track3);
    
    subplot(2,1,1); plot(t,y), grid on, grid minor
    title('Original'); xlabel('Time'); ylabel('Amplitude')
    subplot(2,1,2); plot(t,y3), grid on, grid minor
    title('Filtered, Lowpass, 3.2 kHz'); xlabel('Time'); ylabel('Amplitude')
else
    % file not found
    fprintf(['File named `',fileName,'` not found.',...
            '\n Make sure :',...
            '\n 1. File is present in same folder or at path provided.',...
            '\n 2. File name is correct.\n']);
end

function filtered_x = lowpassFIR (x,Fs,Fp)
    global passBand_ripple
    global stopBand_atteneuation
    lowpassFIR_filter = dsp.LowpassFilter('DesignForMinimumOrder',true, ...
        'PassbandFrequency',Fp,'SampleRate',Fs,...
        'PassbandRipple',passBand_ripple, 'StopbandAttenuation',stopBand_atteneuation);
    filterDetails = measure(lowpassFIR_filter)
    filterOrder = order(lowpassFIR_filter)
    filtered_x = lowpassFIR_filter(x);
    fvtool(lowpassFIR_filter,'Fs',Fs,'Color','White'), grid on, grid minor
end