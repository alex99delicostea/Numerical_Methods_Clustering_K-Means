function view_clusters(points, centroids)
  y = [];
  [centroids,assignements] = clustering_pc(points, length(centroids(:,1)) );
for i=1:length(centroids(:,1)) 
    x=rand(1,3); %atribuirea unei culori random pentru fiecare cluster
   for iter=1:length(points(:,1)) 
    if (assignements(iter,:) == i)
      y(iter,:)=x;% fiecare punct ce apartine clusterului i va avea culoarea random alocata
    endif
   endfor
endfor
  scatter3(points(:,3),points(:,2),points(:,1),[],y);%afisarea punctelor
endfunction

