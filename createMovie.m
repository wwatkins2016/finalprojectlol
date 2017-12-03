%create a function for us to show a movie of the
%rocket launches month by month 

function [output] = createMovie(startYear,endYear,rocketInfo) 
%use the different of the years so we can label the frames 
output = zeros(256,256,3,(endYear-startYear)*12); 
%use a for loop to go through all the frames 
for k = 1:(endYear-startYear)*12
  output(:,:,:,k) = createFrame(startYear,rocketInfo,k); 
end


end 
