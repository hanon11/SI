function Pob = GenPob(NQ, NPob)
    rng(0);
    Pob = zeros (NPob, NQ+1);
    for i=1:NPob
        Pob(i,1:end-1) = randperm(NQ);
        Pob(i,end) = fEval(Pob(i,1:end-1));
    end
end