%% 
% the base plate of  the app:

% mini project:GUI = Graphical User Interface
% A small app that creates signal graphs with a push of a button.

function signal_generator_gui() %this is the main function it builds the entier gui.

%lets create the base window.the page that opens when we click on the app.
%Create a window named “Signal Generator”
f = figure('Name', 'signal generator', 'numberTitle', 'off','Position',[400, 300, 600, 400]);

%% 
% the area to plot the graph:

%creating a plot area called ax.

ax = axes('Parent', f, 'Units','pixels','Position', [80, 150, 450, 200]);
