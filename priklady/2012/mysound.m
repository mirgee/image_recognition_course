function y=mysound(note,duration,muteFlag)
%MYSOUND Play a single note on the C Major scale.
% MYSOUND plays a single note for a specified duration. MYSOUND recognizes
% traditional european notaion, e.g., C, G#, H, etc.
%
% Syntax:  y = nsound(note,duration,[muteFlag])
%
% Arguments:
% note - one of the strings
% {'C1','C#1','D1','D#1','E1','F1','F#1','G1','G#1','A1','A#1','H1',
% {'C2','C#2','D2','D#2','E2','F2','F#2','G2','G#2','A2','A#2','H2',
% or the character 'p' (pause).
% duration - a numeric scalar.
%
% Usage and output:
% The default behavior of MYSOUND is to create a vector y holding a sine
% wave with a frequency corresponding to note and length corresponding to
% duration, and then send it to MATLAB's SOUND function to produce the note
% on speakers. If 'p' is the pause. An optional input argument muteFlag
% can be used to supress the final stage, and just return the vector y
% to the caller.
%
% Examples:
%   mysound('A1',1)
%   plays chamber A one second.
%
% Called m-files: sound.m (MATLAB intrinsic).
%
% Author: Naor edited by Adam Novozamsky 2012
%

% --- Verify input ---
if nargin < 2, error('Too few input arguments.'); end

if ~isreal(duration)||~ischar(note)
    error('Wrong type of input argument.')
end
if ~isscalar(duration)||duration<=0
    error('Argument must be positive scalar.')
end

% --- Determine frequency ---
switch note
    case 'C1'
        f=261.63;
    case 'C#1'
        f=277.18;
    case 'D1'
        f=293.66;
    case 'D#1'
        f=311.13;
    case 'E1'
        f=329.63;
    case 'F1'
        f=349.23;
    case 'F#1'
        f=369.99;
    case 'G1'
        f=392.00;
    case 'G#1'
        f=415.30;
    case 'A1'
        f=440.00;
    case 'A#1'
        f=466.16;
    case 'H1'
        f=493.88;
    case 'C2'
        f=523.25;
    case 'C#2'
        f=554.37;
    case 'D2'
        f=587.33;
    case 'D#2'
        f=622.25;
    case 'E2'
        f=659.26;
    case 'F2'
        f=698.46;
    case 'F#2'
        f=739.99;
    case 'G2'
        f=783.99;
    case 'G#2'
        f=830.61;
    case 'A2'
        f=880.00;
    case 'A#2'
        f=932.33;
    case 'H2'
        f=987.77;
    case 'p'
        f=000.00;
    otherwise
        error('%s is not a recognized note.',note)
end

% --- Create a pitch vector ---
Fs=8192; % Sampling frequency.
t=0:1/Fs:duration;
y=sin(2*pi*f*t);
if muteFlag, return, end

% --- Sound off ---
sound(y,Fs)