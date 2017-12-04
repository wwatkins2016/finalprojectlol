%{
The Pace of the Space Race
William Watkins - Patricia King
Maciej Zagrodski
CSCI 1320
%}

function [syear,eyear,types] = userInputGUI()
%{
userInputGUI presents a GUI to the user to input the first year they would
like to see, the last year, and then checkboxes to select the types of
rockets they would like to include in the animation. It reports the start
and end year as individual integers, and the types as a vector.
%}
disp('Please input a start year after 1956 and an end year before 2010.');
disp('Please also select the Atlas rocket.');
% Create figure
h.f = figure('units','pixels','position',[500,500,415,100],...
             'toolbar','none','menu','none');
% Create yes/no checkboxes
h.c(1) = uicontrol('style','checkbox','units','pixels',...
                'position',[10,30,45,15],'string','Atlas');
%{
h.c(2) = uicontrol('style','checkbox','units','pixels',...
                'position',[180,30,65,15],'string','Falcon 9');
%h.c(2) = uicontrol('style','checkbox','units','pixels',...
                'position',[250,30,50,15],'string','Scout');
%h.c(2) = uicontrol('style','checkbox','units','pixels',...
                'position',[310,30,45,15],'string','Titan');
%h.c(2) = uicontrol('style','checkbox','units','pixels',...
                'position',[360,30,45,15],'string','Thor/Delta');
%}
% Create text boxes in order to enter years
h.y(1) = uicontrol('style','edit','position',[10,60,50,30],'Tag','starty');
h.y(2) = uicontrol('style','edit','position',[70,60,50,30],'Tag','endy');
% Create OK pushbutton   
h.p = uicontrol('style','pushbutton','units','pixels',...
                'position',[40,5,70,20],'string','OK',...
                'callback',@p_call);
finished = false;

    % Pushbutton callback
    function p_call(varargin)
        rockets = get(h.c,'Value');
        startyear = get(h.y(1),'String');
        startyear = str2num(startyear);
        endyear = get(h.y(2),'String');
        endyear = str2num(endyear);
        checkedr = find([rockets]);
        if isempty(checkedr)
            disp('No rockets selected. Please choose at least one!');
        end
        if (isempty(startyear) || (startyear > 2009) || (startyear < 1957))
            disp('Sorry, but your start year is wrong. Please enter a start year between 1957 and 2009.');
        end
        if (isempty(endyear) || (endyear > 2009) || (endyear < 1957))
            disp('Sorry, but your end year is wrong. Please enter a end year between 1957 and 2009.');
        end
        syear = startyear;
        eyear = endyear;
        types = checkedr;
        finished = true;
    end
waitfor(h.f);
end