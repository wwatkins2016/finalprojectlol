%{
The Pace of the Space Race
William Watkins - Patricia King
Maciej Zagrodski
CSCI 1320
%}

%Now that we've got our cell array of structures, we need to get two inputs
%from the user - the year range they want, and what rockets they want to
%see
[startYear,endYear,rocketTypes] = userInputGUI();
rocketVec = ["Atlas","Delta","Falcon 9","Scout","Titan","Thor"];

rocketTypes = rocketVec(rocketTypes);

%First thing we'll do is read in the file!
rocketArray = createStructures('Rocket.xlsx',rocketTypes);

%Next, we will create a cell array of all of the frames we are going to
%create. 
%We're also going to preallocate movieFrames
movieFrames = cell(1,12*(endYear-startYear));
movieFrames = createFrames(rocketArray,startYear,endYear,rocketTypes);

%Concatenate all of our frames along the 4th dimension (time) so that we
%can start making an actual animation
almostMovie = cat(4,movieFrames{:});

%Turn our movie into an actual movie and display it!
displayMovie(almostMovie);

