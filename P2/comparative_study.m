N = 12;
mat = zeros(3, 3);


tStart = tic;    
mean_itera = 0;
n_times = 0;
for i=1:1:1000
    rng(i);
    [C, itera] = localSearch(N);
    
    if(C == 0)
        n_times=n_times+1;
        mean_itera = mean_itera+itera;
    end
end
mat(2,1) = toc(tStart)/1000;
mat(1,1) = n_times;
mat(3,1) = mean_itera/1000;

tStart = tic; 
mean_itera = 0;
n_times = 0;
for i=1:1:1000
    rng(i);
    [sol, C, itera] = SA(N);
    
    if(C == 0)
        n_times=n_times+1;
        mean_itera = mean_itera+itera;
    end
end
mat(2,2) = toc(tStart)/1000;
mat(1,2) = n_times;
mat(3,2) = mean_itera/1000;

tStart = tic; 
mean_itera = 0;
n_times = 0;
for i=1:1:1000
    rng(i);
    [sol, C, itera] = taboo(N);
    
    if(C == 0)
        n_times=n_times+1;
        mean_itera = mean_itera+itera;
    end
end
mat(2,3) = toc(tStart)/1000;
mat(1,3) = n_times;
mat(3,3) = mean_itera/1000;

N = 24;
mat2 = zeros(3, 3);
mean_itera = 0;
n_times = 0;

tStart = tic;    
mean_itera = 0;
n_times = 0;
for i=1:1:1000
    rng(i);
    [C, itera] = localSearch(N);
    
    if(C == 0)
        n_times=n_times+1;
        mean_itera = mean_itera+itera;
    end
end
mat2(2,1) = toc(tStart)/1000;
mat2(1,1) = n_times;
mat2(3,1) = mean_itera/1000;

tStart = tic; 
mean_itera = 0;
n_times = 0;
for i=1:1:1000
    rng(i);
    [sol, C, itera] = SA(N);
    
    if(C == 0)
        n_times=n_times+1;
        mean_itera = mean_itera+itera;
    end
end
mat2(2,2) = toc(tStart)/1000;
mat2(1,2) = n_times;
mat2(3,2) = mean_itera/1000;

tStart = tic; 
mean_itera = 0;
n_times = 0;
for i=1:1:1000
    rng(i);
    [sol, C, itera] = taboo(N);
    
    if(C == 0)
        n_times=n_times+1;
        mean_itera = mean_itera+itera;
    end
end
mat2(2,3) = toc(tStart)/1000;
mat2(1,3) = n_times;
mat2(3,3) = mean_itera/1000;





