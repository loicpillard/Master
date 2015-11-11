Python module : geography

patch_matrix
	Function creating a file.ini for quantiNemo with random sampling
	Input files (3) : capacity (map), populations, parameters file without sampling
	Output files (2) : setting file (.ini), sampling map

coordinates
	Function creating a file containing the coordinates and the continent of each sampled point
	Input file (1) : sampling file
	Output file (1) : file containing the coordinates, the number of sampled individuals and the continent of each sampled point

distances_pairwise
	Function calculating all pairwise distances between sampled points
	Input file (1) : file with coordinates and continents 
	Output file (1) : file containing all pairwise distances between sampled points

distances_from_AA
	Function calculating distances between Addis Ababa and sampled points
	Input file (1) : file with coordinates and continents
	Output file (1) : file containing distances between Addis Ababa and sampled points

patch_capacity
	Function modifying the patch capacity of each habitable deme
	Input file (1) : patch capacity file
	Input parameter (1) : the new capacity of the deme
	Output file (1) : new patch capacity file instead of the old one (overwritting) 
