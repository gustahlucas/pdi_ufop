function threshold = thresholdGlobal(image)
  threshold    = 127;
  thresholdOld = 0;
  
  while abs (threshold - thresholdOld) > 0.1
    grup1 = image(image <= threshold);
    grup2 = image(image > threshold);
    
    average1 = mean(grup1);
    average2 = mean(grup2);
    
    thresholdOld = threshold;
   
    threshold = (average1 + average2)/2; 
  endwhile
  
 endfunction
