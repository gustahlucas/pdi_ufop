function myimg = power_law(img, c, lambda)
    [lin,col,~] = size(img);
    myimg = zeros(lin, col);
    img = double(img);
    for i = 1:lin
        for j = 1:col
            r = img(i,j);
            myimg(i,j) = c * (r^lambda);
        end
    end
    nimgAux = double(myimg);
    mmin = min(nimgAux(:));
    nimgAux = nimgAux - mmin;
    mmax = max(nimgAux(:));
    nimgAux = (255 * nimgAux) / mmax;
    myimg = uint8(nimgAux);
endfunction