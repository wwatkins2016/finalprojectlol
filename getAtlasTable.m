function [rockettable] = getAtlasTable(url,years)
%getAtlasTable gets the tables from a url, and discerns which ones are actually
%useful information and which ones aren't. This function is specifically
%for the Atlas rockets, which have an error on the webpage

mypage = urlread(url);

startind = regexpi(mypage, '<table')
endind = regexpi(mypage, '</table>');
endind = endind+7;
if length(startind)~=length(endind)
    disp('could not find start and end of tables');
end

if (years == 3)
    startind = startind(2:end);
    endind = endind(2:end);
end

for tabRow = 1:years
    %Create an empty cell at tabRow in the cell array myTable
    myTable{tabRow} = table;
    %Get the first table from the page
    htmlTable = mypage(startind(tabRow):endind(tabRow));
    %Try and catch, in case there is an error
    try
        %The resulting table will have 5 columns, and as many rows as there
        %are launches. The heading row will be deleted.
        rows = transpose(regexpi(htmlTable, '<tr.*?>(.*?)</tr>','tokens'));
        for i = 1:length(rows)
             
        end
        
    catch
        disp('Could not access this table.');
    end
    rockettable = rows
end

end

