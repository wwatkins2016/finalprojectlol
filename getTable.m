function [rocketStructure] = getTable(url,rocketTypes)
%getAtlasTable gets the tables from a url, and discerns which ones are actually
%useful information and which ones aren't. This function is specifically
%for the Atlas rockets, which have an error on the webpage

rocket = 1;
rocketStructure;

%Here we will start a loop to run through the urltable

mypage = urlread(url);

startind = regexpi(mypage, '<table');
endind = regexpi(mypage, '</table>');
endind = endind+7;
if length(startind)~=length(endind)
    disp('could not find start and end of tables');
end

%Setup the while loop
i = 1;
overIndex = false
%while loop to get rid of tables that aren't launch data
while (~overIndex)
   tableMat = mypage(startind(i):endind(i));
   %If it contains Date/Time, then we'll keep going through other tables
   if (contains(tableMat,'Date/Time') == true)
       i = i + 1;
   %If not, then we delete the index
   else
       startind(i) = [];
       endind(i) = [];
   end;
   %This checks to see where we are in the startind matrix
   if i > length(startind)
       overIndex = true;
   end;
end;

webPageStructure;

for i = 1:length(startind)
    rows = regexp(tableMat, '<tr.*?>(.*?)</tr>', 'tokens');
    rows(1) = [];
    cols = regexp(rows, '<td.*?>(.*?)</td>', 'tokens');
    for k = 1:length(cols)
        result{1} = cols{k}{1};
        result{2} = cols{k}{4};
        result{3} = cols{k}{7};
        result{4} = cols{k}{8};
        cols{k} = result;
    end
    yearStructure;
    
end

end

