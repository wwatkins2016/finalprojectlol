function [webPageStructure] = getWebPageTable(url)
%getWebPageTable gets the tables from a url with the launch data and
%returns a structure

mypage = urlread(url);

startind = regexpi(mypage, '<table');
endind = regexpi(mypage, '</table>');
endind = endind+7;
if length(startind)~=length(endind)
    disp('could not find start and end of tables');
end

%Setup the while loop
i = 1;
overIndex = false;
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
   else
       overIndex = true;
   end;
end;

for i = 1:length(startind)
    tableMat = mypage(startind(i):endind(i));
    rows = regexp(tableMat, '<tr.*?>(.*?)</tr>', 'tokens');
    rows = cell2table(rows);
    rows = table2array(rows);
    rows(1) = [];
    cols = regexp(rows, '<td.*?>(.*?)</td>', 'tokens');
    %Isolate the 4 things we really need
    yearStructure = createStructures(cols);
    webPageStructure(i) = struct(yearStructure);
end

end