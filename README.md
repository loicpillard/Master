PYTHON MODULE : geography

patch_matrix(capacity, pop, parameters, out_settings, out_sampling)
- Function creating a file.ini for quantiNemo with a random sampling
- Input files (3) : capacity (map), file containing the size of each population, parameters file for qN without sampling
- Output files (2) : complete setting file (.ini), sampling map file

coordinates(sampling, coordinates)
- Function creating a file containing the coordinates and the continent of each sampled point
- Input file (1) : sampling map file
- Output file (1) : file containing the coordinates, the number of sampled individuals and the continent of each sampled point

patch_capacity(capacity, number)
- Function modifying the patch capacity of each habitable deme
- Input file (1) : patch capacity file
- Input parameter (1) : the new capacity of the deme
- Output file (*1) : new patch capacity file instead of the old one (overwritting) 

the_map(capacity, outmap)
- Function creating the map for the distances calculation with A* algorithm
- Input file (1) : patch capacity file
- Output file (1) : map file for the A* algorithm 


PYTHON MODULE : stats

rename_results(directory, name)
- Function copying and renaming the output files from simulations with quantiNemo
- Input file (0) : name of the directory where the simulation directories are stored, name of the type of simulation (= name of the sampling scheme)
- Output files (2+) : genotypes.arp (or genotypes.dat) and stats.txt

fst_nbA(stats, pairwise, AA, coordinates, outfst, outnbA)
- Function creating two files, one containing pairwise fst and pairwise distances, one containing number of alleles and distance from Addis Ababa
- Input files (4) : stats file, pairwise distances file, distances from Addis Ababa file, coordinates with continents file
- Output files (2) : file containing pairwise fst and pairwise distances, file containing number of alleles and distance from Addis Ababa

structure_arp(coordinates, genotypes, out_structure)
- Function creating a file containing the genotypes for STRUCTURE from arp format
- Input files (2) : file containing the coordinates with continents, genotypes.arp
- Output file (1) : file containing the genotypes and the continents for STRUCTURE

structure_dat(individuals, genotypes, out_structure)
- Function creating a file containing the genotypes for STRUCTURE from dat format
- Input files (2) : file containing the individuals with continents, genotypes.dat
- Output file (1) : file containing the genotypes and the continents for STRUCTURE	

structure_individuals(structure, out_individuals)
- Function creating a file containing the continent of origin of each individual
- Input file (1) : file containing the genotypes for STRUCTURE
- Output file (1) : file containing the continent of origin of each individual

admixture(structure, outname)
- Function transforming the microsatellites data into SNP data
- Input file (1) : file containing microsatellites data for STRUCTURE
- Output files (2) : need to specify the name without extension ; two files are created, one containing SNP data (.ped) and one for the loci map (.map)

admixture_rearrangement(individuals, admixture_Q, output)
- Function rearranging the results of ADMIXTURE according to the continent of origin
- Input files (2) : file containing the continent of origin of all individuals and the ADMIXTURE.Q results file
- Output file (1) : file containing the rearranged ADMIXTURE.Q results
 
admixture_bestK(bestK_input, output)
- Function selecting the best K from ADMIXTURE results (need to select the CV error from log.out -> cf manual)
- Input file (1) : file containing all CV error with K for one sampling
- Output file (1) : file containing the best K for each run

cluster_nbK(kmeans_result, output)
- Function creating a file containing the number of clusters in the simulation
- Input file (1) : K-means clustering result file (from R)
- Output file (1) : file containing the number of clusters in the simulation (one file for all simulations !)

cluster_continent(kmeans_result, clusters_continent)
- Function creating a file containing the number of clusters for each continent 
- Input file (1) : K-means clustering result file (from R)
- Output file (1) : file containing the number of clusters for each continent (one file for all simulations !)

cluster_good(kmeans_result, good_clustering_out)
- Function creating a file containing the proportion of good clustering 
- Input file (1) : K-means clustering result file (from R)
- Output file (1) : file containing the proportion of good clustering for each cluster with corresponding continent

cluster_good_summary(good_clustering_name, out_good_clustering_summary)
- Function creating a file containing the average proportion of good clustering for each continent
- Input parameters (1) : name of the files good_clustering (without extension and number)
- Output file (1) : summary file

cluster_individuals_continent(kmeans_result_name, good_clustering_name, out_cluster_individuals):
- Function creating a file like "ADMIXTURE.Q" from K-means clustering
- Input parameters (2) : name of the files kmeans_results (without extension and number) and name of good_clustering file
- Output file (1) : file like "ADMIXTURE.Q" for a the current sampling

procrustes(gps_coordinates, out_gps_coordinates_rad)
- Function creating a file containing the GPS coordinates in radian
- Input file (1) : file containing GPS coordinates in degrees with patch ID, continent and number of individuals for each population
- Output file (1) : file containing the GPS coordinates in radians and continent abbreviation

procrustes_summary(procrustes_results_name, procrustes_summary_angle_out, procrustes_summary_score_out)
- Function summarizing the results of Procrustes analysis
- Input parameter (1) : name of the files procrustes_results (without extension and number)
- Output files (2) : file containing a summary of rotation angle and file containing summary of score 



