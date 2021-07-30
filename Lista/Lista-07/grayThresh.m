function grayThresh()
  img = imread('lennagray.png');
  
  otsu = graythresh(img);
  
  imwrite(img > 255*otsu, 'otsu.png'); 

endfunction  
  