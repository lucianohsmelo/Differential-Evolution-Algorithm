function g = avalia(pop)

    for i = 1:size(pop,1)
        g(i) = (pop(i,1)-5)^2+(pop(i,2)+15)^2;
    end
end