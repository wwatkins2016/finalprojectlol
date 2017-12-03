%create a function that plots the coordinates of the launches on a map of
%the united states 

function [] = displayPlot(LAT,LON)

%from twitter US plot 
%Create figure for plotting
figure; 
%load a map of the CONUS
ax = usamap('conus');
%select only states within CONUS
states = shaperead('usastatelo', 'UseGeoCoords', true,...
  'Selector',...
  {@(name) ~any(strcmp(name,{'Alaska','Hawaii'})), 'Name'});
%Show the state borders on the map with a white face
geoshow(ax, states, 'Facecolor',[1 1 1])
%Keep the axis on for refrence along with labels
framem on; gridm on; mlabel on; plabel on

%now show the points that are plotted 
h = geoshow(LAT, LON, 'DisplayType', 'Point', 'Marker', '*', 'Color', 'red');

end 



