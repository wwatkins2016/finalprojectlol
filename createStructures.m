%{
The Pace of the Space Race
William Watkins - Patricia King
Maciej Zagrodski
CSCI 1320
%}

function [rocketStructure] = createStructures(rocketInfo)
%{
createStructures takes in the year table from urlreadtable and creates a structure
with date, location, success and orbit information for each launch. 
%}

for i = 1:length(rocketInfo)
    rocketStructure.Date(i) = rocketInfo{i}{1};
    
    if contains(rocketInfo{i}{4},'CC')
        rocketStructure.Lat(i) = 28.3922;
        rocketStructure.Lon(i) = -80.6077;
    else
        rocketStructure.Lat(i) = 34.7420;
        rocketStructure.Lon(i) = -120.5724;
    end
    rocketStructure.Orbit(i) = rocketInfo{i}{7};
    
    if contains(rocketInfo{i}{8},'F')
        rocketStructure.Success(i) = false;
    else
        rocketStructure.Success(i) = true;
    end
end

end

