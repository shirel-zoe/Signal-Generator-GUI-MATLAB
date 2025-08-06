%the base plate of  the app:
% mini project:GUI = Graphical User Interface
% A small app that creates signal graphs with a push of a button.

function signal_generator_gui() %this is the main function it builds the entier gui.

%lets create the base window.the page that opens when we click on the app.
%Create a window named “Signal Generator”

f = figure('Name', 'signal generator','Position',[400, 300, 600, 400]);


%the area to plot the graph:
%creating a plot area called ax.

ax = axes('Parent', f, 'Units','pixels','Position', [80, 150, 450, 200]);
Instead of manually typing a frequency (like "5") into a box, we’re giving the user a slider to easily adjust:
How fast the wave is (🎚️ Frequency)
How tall the wave is (🎚️ Amplitude)
So now the user can simply slide to choose a value, then click a waveform button — and MATLAB will generate that wave with the chosen settings.
% 🎚️ Frequency Slider
freqSlider = uicontrol('Style', 'slider', ...
    'Min', 1, 'Max', 20, 'Value', 5, ...
    'Position', [100, 90, 120, 20]);

% 🧾 Frequency Value Text (under the slider)
freqText = uicontrol('Style', 'text', ...
    'String', '5.00 Hz', ...
    'Position', [100, 65, 120, 20]);  % Same x, slightly lower y

% 🔁 Update Frequency Label on Slide
set(freqSlider, 'Callback', @(src, ~) ...
    set(freqText, 'String', [num2str(get(src, 'Value'), '%.2f') ' Hz']));
 now we do the same for the amplitude:
% 🎚️ Amplitude Slider
ampSlider = uicontrol('Style', 'slider', ...
    'Min', 0.1, 'Max', 5, 'Value', 1, ...
    'Position', [350, 90, 120, 20]);

% 🧾 Amplitude Value Text
ampText = uicontrol('Style', 'text', ...
    'String', '1.00', ...
    'Position', [350, 65, 120, 20]);

% 🔁 Update Amplitude Label on Slide
set(ampSlider, 'Callback', @(src, ~) ...
    set(ampText, 'String', num2str(get(src, 'Value'), '%.2f')));
             % we have interduced two sliders so that the user can chose
             % there own amplitude and frequency.






creating the button that forms the waves:
% add buttons using the function uicontrol()

% a pushbutton for sine signal
uicontrol('Style', 'pushbutton', 'String', 'Sine', ...
          'Position', [100, 20, 100, 30], ...
          'Callback', @(~,~) plot_wave(ax, 'sine', get(freqSlider, 'Value'), get(ampSlider, 'Value')));

%a pushbutton for square signal:
uicontrol('Style', 'pushbutton', 'String', 'square', ...
          'Position', [250, 20, 100, 30], ...
         'Callback', @(~,~) plot_wave(ax, 'square', get(freqSlider, 'Value'), get(ampSlider, 'Value')));

% pushbutton for triangle signal:
uicontrol('Style', 'pushbutton', 'String', 'triangle', ...
          'Position', [400, 20, 100, 30], ...
          'Callback', @(~,~) plot_wave(ax, 'triangle', get(freqSlider, 'Value'), get(ampSlider, 'Value')));


end


call the fuction:
function plot_wave(ax, type, f , A)
    % Step 1: Create time vector
    t = linspace(0, 1, 1000);  % 1000 points between 0 and 1 second
    
    % Step 2: Generate the selected waveform
    switch type
        case 'sine'
            y = A * sin(2*pi*f*t);
        case 'square'
            y = A * square(2*pi*f*t);
        case 'triangle'
            y = A * sawtooth(2*pi*f*t, 0.5);  % triangle wave
    end

    % Step 3: Plot it
     plot(ax, t, y, 'LineWidth', 2);
    title(ax, [type ' wave: ' num2str(f) ' Hz, Amp: ' num2str(A)]);
    xlabel(ax, 'Time (s)');
    ylabel(ax, 'Amplitude');
    grid(ax, 'on');
end


