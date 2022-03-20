function e = fEval(x)
    %x is	a	complete	assignment 
    %e is	 the	 total	 number	 of	 conflicts	 among	 all	 the	 queens	 in	 the	 board	 x (as	 row	
    % constraints	have	been	eliminated,	we	can	focus	on	diagonal	constraints) 
    e = 0;
    for i=1:1:length(x)
        for j=i+1:1:length(x)
            if(abs(i-j) == abs(x(i) - x(j)))
                e = e + 1;
            end
        end
    end  
end