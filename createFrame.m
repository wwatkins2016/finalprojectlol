%{
The Pace of the Space Race
William Watkins - Patricia King
Maciej Zagrodski
CSCI 1320
%}

function [mapFrame] = createFrame(startYear,rocketStruc,num)
%{
createFrames takes in the start year, the number of years, and the
cell array of the rocket information, and plots the locations on a map of
the USA. It goes month by month (12 frames per year, regardless of if there
were launches) and stores each frame in a cell array.
%}

%Create figure for plotting
figure; 
%title(startYear);
%load a map of CONUS
ax = usamap('conus');
%select only states within CONUS
states = shaperead('usastatelo', 'UseGeoCoords', true,...
  'Selector',...
  {@(name) ~any(strcmp(name,{'Alaska','Hawaii'})), 'Name'});
%Show the state borders on the map with a white face
geoshow(ax, states, 'Facecolor',[1 1 1])
%Keep the axis on for reference along with labels
framem on; gridm on; mlabel on; plabel on

launches = rocketStruc(num).Date;
cc = 0;
va = 0;
for i = 1:length(launches)
    LAT = rocketStruc(num).Lat(i);
    LON = rocketStruc(num).Lon(i);
    if LAT == 28.3922
        cc = cc + 1;
    else
        va = va + 1;
    end
    h = geoshow(LAT, LON, 'DisplayType', 'Point', 'Marker', '*', 'Color', 'red');
end

if cc > 0
    h = textm(28.3922,-80.6077+.5,num2str(cc));
else
    h = textm(28.3922,-80.6077+.5,'None');
end

if va > 0
    h = textm(34.7420,-120.5724+.5,num2str(va));
else
    h = textm(34.7420,-120.5724+.5,'None');
end

mapFrame = getframe;
close;
end

