function [rocketStruc] = getTable(url,rocketTypes)
%getAtlasTable gets the tables from a url, and discerns which ones are actually
%useful information and which ones aren't. This function is specifically
%for the Atlas rockets, which have an error on the webpage

mypage = urlread(url);

startind = regexpi(mypage, '<table');
endind = regexpi(mypage, '</table>');
endind = endind+7;
if length(startind)~=length(endind)
    disp('could not find start and end of tables');
end

i = 1;
overIndex = false
while (~overIndex)
   tableMat = mypage(startind(i):endind(i));
   if (contains(tableMat,'Date/Time') == true)
       i = i + 1;
   else
       startind(i) = [];
       endind(i) = [];
   end;
   if i > length(startind)
       overIndex = true;
   end;
end;



end

