#!/usr/bin/python

L = ["E", "G0", "G1", "G2", "G3", "G4", "G4bis", "O", "R1", "R2", "R3", "R4", "R5", "R6", "R7", "R8", "R9", "SE", "SG0",
     "SG1", "SG2", "SG3", "SG4", "SG4bis", "SO", "SR1", "SR2", "SR3", "SR4", "SR5", "SR6", "SR7", "SR8", "SR9"]

import stats

#for element in L:
    #i = 1
    #while i < 101:
        #stats.fst_nbA(element+"/stats_"+element+"-"+str(i)+".txt", element+"/astar4_distances_pairwise_"+element+".txt",
                      #element+"/astar4_distances_from_AA_"+element+".txt", element+"/coordinates_"+element+".txt",
                      #element+"/fst_"+element+"-"+str(i)+".txt", element+"/nbA_"+element+"-"+str(i)+".txt")
        #i += 1


#for element in L:
    #i = 1
    #while i < 101:
        #stats.cluster_nbK(element+"/kmeans_ind_"+element+"-"+str(i)+".txt", element+"/kmeans_nbK_"+element+".txt")
        #stats.cluster_continent(element+"/kmeans_ind_"+element+"-"+str(i)+".txt",
                                # element+"/kmeans_continent_"+element+".txt")
        #stats.cluster_good(element+"/kmeans_ind_"+element+"-"+str(i)+".txt",
                           #element+"/kmeans_goodcluster_"+element+"-"+str(i)+".txt")
        #i += 1
    #stats.cluster_good_summary(element+"/kmeans_goodcluster_"+element,
                               #element+"/kmeans_goodcluster_summary_"+element+".txt")
#for element in L:
    #stats.cluster_individuals_continent(element+"/kmeans_ind_"+element, element+"/kmeans_goodcluster_"+element,
                                        #element+"/kmeans_continent_individuals_"+element+".txt")

#for element in L:
    #i = 1
    #while i < 101:
        #stats.admixture(element+"/structure_"+element+"-"+str(i)+".txt", element+"/admixture"+element+"-"+str(i))
        #i += 1

#for element in L:
    #j = 1
    #while j < 101:
        #i = 1
        #while i < 11:
            #stats.admixture_rearrangement("populations/populations_"+element+".txt",
                                          #element+"/admixture_"+element+"-"+str(j)+"."+str(i)+".Q",
                                          #element+"/admixture_"+element+"-"+str(j)+"."+str(i)+".txt")
            #i += 1
        #j += 1

#for element in L:
    #stats.admixture_bestK("admixtureK_"+element+".txt", "admixture_bestK_"+element+".txt", 10)

for element in L:
    stats.procrustes_summary(element+"/procrustes_"+element, element+"/procrustes_summary_angle_"+element+".txt",
                             element+"/procrustes_summary_score_"+element+".txt")

#for element in L:
    #stats.admixture_rearrangement("populations/populations_"+element+".txt",
                                  #"kmeans_continent_individuals_"+element+".txt",
                                  #"continent_individuals_"+element+".txt")
