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

for c = 1:length(rocketTypes)
    atlasStructure = createRocketTypeStructures(rocketTypes(c));
end

s = startYear - 1957;
e = 2009 - endYear;

struc = atlasStructure(1+s:53-e);

createMovie(startYear,endYear,struc);

movies = imread('Animated_Launches.gif');

%movie(movies);

displayMovie('Animated_Launches.gif');

%{
rocketVec = ["Atlas","Delta","Falcon 9","Scout","Titan","Thor"];

rocketTypes = rocketVec(rocketTypes);



%First thing we'll do is read in the file!
rocketArray = createStructures('Rocket.xlsx',rocketTypes);

%Next, we will create a cell array of all of the frames we are going to
%create. 
%We're also going to preallocate movieFrames
movie = createMovie(

%Concatenate all of our frames along the 4th dimension (time) so that we
%can start making an actual animation
almostMovie = cat(4,movieFrames{:});

%Turn our movie into an actual movie and display it!
displayMovie(almostMovie);
%}

