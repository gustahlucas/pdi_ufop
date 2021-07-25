function [train, test] = amostra(labels, porc)
if size(labels,1) ~= 1 && size(labels,2) ~= 1
    error('labels must be a vector');
end

et = unique(labels);

train = false(length(labels),1);
test = train;
for i = 1 : length(et)
    label = unique(i);
    ind = find(labels == label);
    aleatorio = randperm(length(ind));
    limite = floor(length(aleatorio) * porc);
    train(ind(aleatorio(1:limite))) = true;
    test(ind(aleatorio(limite+1:end))) = true;
end