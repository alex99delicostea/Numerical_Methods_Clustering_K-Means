function view_cost_vs_nc(file_points)
   load(file_points);%incarcarea punctelor
   nrClusters=[1 2 3 4 5 6 7 8 9 10];
   costs=[]; 
   for i=1:10
    [centers] = clustering_pc(points, i);%obtinerea centroizilor prin clustering_pc
    [cost] = compute_cost_pc(points, centers);%obtinerea costlui total 
    costs(i,:)=cost;%costul obtinut este introdus in vectorul costs
   endfor
  plot(nrClusters,costs)%afisarea graficului
  
endfunction

