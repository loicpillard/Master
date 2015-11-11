PYTHON MODULE : geography

patch_matrix
- Function creating a file.ini for quantiNemo with random sampling
- Input files (3) : capacity (map), populations, parameters file without sampling
- Output files (2) : setting file (.ini), sampling map

coordinates
- Function creating a file containing the coordinates and the continent of each sampled point
- Input file (1) : sampling file
- Output file (1) : file containing the coordinates, the number of sampled individuals and the continent of each sampled point

distances_pairwise
- Function calculating all pairwise distances between sampled points
- Input file (1) : file with coordinates and continents 
- Output file (1) : file containing all pairwise distances between sampled points

distances_from_AA
- Function calculating distances between Addis Ababa and sampled points
- Input file (1) : file with coordinates and continents
- Output file (1) : file containing distances between Addis Ababa and sampled points

patch_capacity
- Function modifying the patch capacity of each habitable deme
- Input file (1) : patch capacity file
- Input parameter (1) : the new capacity of the deme
- Output file (1) : new patch capacity file instead of the old one (overwritting) 


PYTHON MODULE : stats

rename_results
- Function copying and renaming the output files from simulations with quantiNemo
- Input file (0) : name of the directory where the simulation directories are stored, name of the type of simulation
- Output files (2+) : genotypes.arp and stats.txt

structure
- Function creating a file containing the genotypes for STRUCTURE
- Input files (2) : file containing the coordinates with continents, genotypes.arp
- Output file (1) : file containing the genotypes and the continents for STRUCTURE

pca_pop
- Function creating a file containing the genotypes, the continents and the populations for PCA per population
- Input files (2) : file containing the coordinates with continents, genotypes for STRUCTURE (from previous function)
- Output file (1) : file containing the genotypes, the continents and the populations for PCA per population

fst_nbA
- Function creating two files, one containing pairwise fst and pairwise distances, one containing number of alleles and distance from Addis Ababa
- Input files (4) : stats file, pairwise distances file, distances from Addis Ababa file, coordinates with continents file
- Output files (2) : file containing pairwise fst and pairwise distances, file containing number of alleles and distance from Addis Ababa

