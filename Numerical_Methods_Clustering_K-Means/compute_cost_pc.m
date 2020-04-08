function [cost] = compute_cost_pc(points, centroids)
	cost = 0; 
	distante_de_la_centroizi= []; %un vector care va avea pentru fiecare punct distanta dintre el si fiecare centriod
  CostperCentroid = []; 
	CostperCentroid=zeros(rows(centroids),2);% matrice ce va avea 2 coloane si nr de centroizi ca nr de linii
	CostperCentroid(:,1)=1:rows(centroids);%prima coloana va avea numerele de ordine ale centroizilor
	for i=1:rows(points)
		for j=1:rows(centroids) 
			distante_de_la_centroizi(j)=norm((centroids(j,:)-points(i,:)),2); % pentru fiecare punct sunt realizate distantele pana la centroizi si introduse in vector
		endfor
		[distanta iter]=min(distante_de_la_centroizi);%se afla minumul dintre aceste distante,deoarece punctul apartine clusterului daca distanta dintre el si centroidul respectiv este mai mica decat distantele fata de ceilalti centroizi
    CostperCentroid(iter,2)=CostperCentroid(iter,2) + distanta;%distanta obtinuta este introdusa in matrice,pe aceeasi linie ca numarul clusterului respectiv
	endfor
	cost=sum(CostperCentroid(:,2));%calcularea costului total
endfunction
