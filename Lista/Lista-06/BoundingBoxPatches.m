function figs = BoundingBoxPatches(img, deslocamento)
% newCoord: vetor de bounding boxes
if nargin < 2
    deslocamento = 10;
end
% se a imagem é colorida transforma a escala de cinza
if size(img, 3) == 3
    img = rgb2gray(img);
end
% binariza a imagem
A = im2bw(img);
% cada grupo de pixels que fazem parte de um grupo recebem o mesmo label
labeledImage = bwlabel(A);
% gera os bounding box ao redor de cada objeto
measurements = regionprops(labeledImage, 'BoundingBox', 'Area');

newCoord = zeros(max(max(labeledImage)), 4);
figs = cell(length(measurements), 1);
for k = 1 : length(measurements)
  thisBB = measurements(k).BoundingBox;
  X = thisBB(1) - deslocamento;
  Y = thisBB(2) - deslocamento;
  width = thisBB(3) + 2* deslocamento;
  height = thisBB(4) + 2* deslocamento;
  newCoord = [X Y width height];
  figs{k} = imcrop(img, newCoord);
  %rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
  %'EdgeColor','r','LineWidth',2 )
  %rectangle('Position', [X, Y, width, height],...
  %'EdgeColor','r','LineWidth',2 )
end