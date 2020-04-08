% reads cluster count and points from input files 
function [NC points] = read_input_data(file_params,file_points)
	NC = 0;
  points = [];
  NC=importdata(file_params);%importarea numarului de clustere in NC
  load(file_points);%incarcarea punctelor din fisierul precizat
endfunction

