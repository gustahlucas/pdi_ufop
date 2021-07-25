function [modelo, accuracy] = central()
  pkg load nan

  [data, labels, length_generatedImages] = geradorImgHuMoments();
  
  [train, test] = amostra(labels, 0.75);
  
  A_train  = data(train, :);
  b_train  = labels(train);
  A_test   = data(test, :);
  b_test   = labels(test);
  
  modelo = train_sc(A_train, b_train);
  pred  = test_sc(modelo, A_test);
 
  %Acuracia do numero 
  trues  = zeros(10,1);
  falses = zeros(10,1);

  for i = 1 : columns(pred.classlabel)
    
    if pred.classlabel(1,i) == b_test(i)
      trues(b_test(i)+1) = trues(b_test(i)+1) + 1;
    else
      falses(b_test(i)+1) = falses(b_test(i)+1) + 1;
    endif
  endfor

  accuracy = zeros(10,1);
  for j = 1 : 10
    accuracy(j) = (trues(j)*100)/(trues(j)+falses(j));
  endfor
  
endfunction