%create a function for us to show a movie of the
%rocket launches month by month 

function [output] = createMovie(startYear,endYear,rocketInfo) 

%use a for loop to go through all the frames 
for k = 1:(endYear-startYear)+1
    im = frame2im(createFrame(startYear,rocketInfo,k));
    [A,map] = rgb2ind(im,256);
    if k == 1
        imwrite(A,map,'Animated_Launches.gif','gif','LoopCount',Inf,'DelayTime',1);
    else
        imwrite(A,map,'Animated_Launches.gif','gif','WriteMode','append','DelayTime',1);
    end
   %output(:,:,:,k) = createFrame(startYear,rocketInfo,k); 
end


end 
