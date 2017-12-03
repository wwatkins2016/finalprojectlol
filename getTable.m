function [rockettable] = getAtlasTable(url,years)
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

if years == 3
    startind = startind(2:end);
    endind = endind(2:end);
end



end

