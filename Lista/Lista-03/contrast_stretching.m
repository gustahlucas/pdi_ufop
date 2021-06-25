function myimg = contrast_stretching(img, m, e)
    [lin,col,~] = size(img);
    myimg = zeros(lin, col);
    img = double(img);
    for i = 1:lin
        for j = 1:col
            r = img(i,j);
            myimg(i,j) = 1/(1+(m/r)^e);
        end
    end
    nimgAux = double(myimg);
    mmin = min(nimgAux(:));
    nimgAux = nimgAux - mmin;
    mmax = max(nimgAux(:));
    nimgAux = (255 * nimgAux) / mmax;
    myimg = uint8(nimgAux);
endfunction