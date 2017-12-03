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

for i = 1:size(rocketInfo) - 1
    rocketStructure.date(i) = rocketInfo(i+1,1);
    rocketStructure.location(i) = rocketInfo(i+1,2);
    rocketStructure.success(i) = rocketInfo(i+1,3);
    rocketStructure.orbit(i) = rocketInfo(i+1,4);
end

end

