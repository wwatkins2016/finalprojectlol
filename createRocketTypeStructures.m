function [rocketStructure] = createRocketTypeStructures(col)
%createRocketTypeStructures calls getWebPageTable, then puts together a
%structure for all the launch dates of the Specific rocket type

[nums,text,raw] = xlsread('URLtable.xlsx');

urls = text(:,col);
urls = urls((~cellfun('isempty',urls)));
rocketStructure = [];
for p = 1:length(urls)
    string = char(urls(p));
    temp = getWebPageTable(string);
    rocketStructure = struct([rocketStructure,temp]);
end

end

