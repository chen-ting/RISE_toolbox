function eqtns=burry_probabilities(eqtns,myifelseif,only_forward)
if nargin<3
    only_forward=false;
end

if ischar(eqtns)
    eqtns=cellstr(eqtns);
end
if ischar(myifelseif)
    myifelseif=cellstr(myifelseif);
end

% pattern for forward-looking variables
%--------------------------------------
% one or more letters, optionally followed by +, followed by a digit between 1 and 9 
pattern='\w+{?\+[1-9]'; 

for ieq=1:numel(eqtns)
    if only_forward
        xout=regexp(eqtns{ieq},pattern,'once');
    else
        xout=1;
    end
    if ~isempty(xout)
        eqtns{ieq}=parser.string_mult(myifelseif,eqtns{ieq});
    end
end

