function myplay(music)
%MYPLAY  Play music.
% MYPLAY plays the tune represented by the specially formatted music
% array.
%
% Syntax: MYPLAY(music)
%
% Arguments:
% music - n-by-2 cell array, music{:,1} contains strings and music{:,2}
% numeric scalars.
%
% Usage and output:
% MYPLAY(music) plays a tune on the speakers using the nsound function to
% create pitch vectors for each note and MATLAB's sound function to play
% the note on the speakers. Each row of the cell array music represents one
% note to be played, and the duration to play it. The suported notes are
% those recognized by nsound. The character 'p' can appear instead of a
% note to produce silence for the specified duration. See mysound.m for more
% information on supported notes and their string representation.
%
% Examples:
% myplay({'C1',0.5;'D1',0.5;'E1',0.5})
% plays the short tune 'do-re-mi'.
%
% music={'A1',0.20;'p',0.05;'A1',0.20;'p',0.05;...
%        'G1',0.20;'p',0.05;'A1',0.20;'p',0.3;...
%        'E1',0.20;'p',0.25;...
%        'E1',0.20;'p',0.05;'A1',0.20;'p',0.05;...
%        'D2',0.20;'p',0.05;'C#2',0.20;'p',0.05;...
%        'A1',0.30};
% myplay(music)
% Plays the first few notes of Funky Town.
%
% Called m-files: mysound.m
%
% Author: Naor edited by Adam Novozamsky 2012

% Verify input
if (~iscell(music))||(ndims(music)>2)||(size(music,2)~=2)
    error('Argument must be an n-by-2 cell array.')
end
notes=music(:,1);
duration=[music{:,2}]';
if ~isreal(duration)
    error('Argument must be real numeric.')
end
if any(duration>4)
    error('Longest note must not exceed 4 seconds.')
end
if sum(duration)>60
    error('Music must be under one minute.')
end
if length(notes)~=length(duration)
    error('Arguments must be of same length.')
end

% Play the tunes
y=[];
for k=1:length(notes)
    y=[y mysound(notes{k},duration(k),true)];
end
sound(y)
pause(0.5) % Safety feature: during playback calling sound.m again will crash MATLAB
