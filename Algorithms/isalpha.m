function out = isalpha(s)
out = false;
if ~ischar(s)
    s = char(s);
end
s = upper(s);
n = length(s);
for i = 1:n
    c = s(i);
    if (uint8(c) < 65) || (uint8(c) > 90)
        return
    end
end
out = true;
end

function out = isnotalpha(s)
out = ~isalpha(s);
end