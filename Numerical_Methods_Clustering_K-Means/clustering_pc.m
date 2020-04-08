function  [centers,vector_asignatii] = clustering_pc(points, NC)
   
  numar_maxim_iteratii = 500;
  %creerea aleatorie a primilor centroizi
	linii_pentru_centroizi = randperm(size(points)(1));
	centers = points(linii_pentru_centroizi(1:NC), :);
	
	numar_puncte = length(points(:,1));
	numar_coordonate = length(points(1,:));
	vector_asignatii = ones(1, numar_puncte);

	for k = 1:numar_maxim_iteratii
		suma_totala_puncte = zeros(NC, numar_coordonate);%suma totala a punctelor necesara pentru determinarea urmatorilor centroizi
		numar_puncte_in_cluster = zeros(NC, 1);%numarul de puncte in fiecare cluster necesar pentru determinarea urmatorilor centroizi
		for i = 1:numar_puncte
			minDistanta = realmax;%distanta minima initializata cu realmax
			numar_cluster_asignat = 0;
			for j = 1:NC 
				% calcularea distantei euclidiene pentru fiecare punct
				distanta = sqrt(sum((points(i, : ) - centers(j, :)).^2));
				if distanta < minDistanta
					minDistanta = distanta;%daca distanta este cea mai mica fata de centroidul clusterului j
					numar_cluster_asignat = j;%atunci acesta va apartine clusterului j
				endif
			endfor
			vector_asignatii(i) = numar_cluster_asignat;%vectorul de asignatii va primi nr clusterului pe aceeasi pozitie i pe care punctul respectiv o are in points

			
			suma_totala_puncte(numar_cluster_asignat, :) += points(i, :);%se aduna punctul pe linia corespunzatoare clusterului
			numar_puncte_in_cluster(numar_cluster_asignat)++;%si numarul de puncte creste
		endfor

		newCenters = zeros(NC, numar_coordonate);%initializare noi centroizi
		for i = 1:NC 
			newCenters(i, :) = suma_totala_puncte(i, : ) / numar_puncte_in_cluster(i);%formuala pentru noii centroizi
		endfor
	
		diff = norm(newCenters - centers);%diferenta dintre centrii noi si cei anteriori
	
		if diff < eps
			%daca diferenta e mai mica ca eps centrii noi au convers deja,inainte terminarii numarului de iteratii
			break;
		endif
	
		centers = newCenters;%centrii noi devin centrii
	endfor	
	vector_asignatii = vector_asignatii';
endfunction