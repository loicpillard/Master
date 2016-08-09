#!/usr/bin/python

import os
import shutil
import collections
import math
import random

def rename_results(directory, name):
    #List all simulation directories
    simulation_list = os.listdir(directory)
    #Copy and rename in the main directory file.arp and stats file
    for i in range(len(simulation_list)):
        results = os.listdir(directory+"/"+simulation_list[i])
        for element in results:
            if "stats" in element:
                shutil.copyfile(directory+"/"+simulation_list[i]+"/"+element,
                                directory+"/stats_"+name+"-"+str(i+1)+".txt")
            elif ".arp" in element:
                shutil.copyfile(directory+"/"+simulation_list[i]+"/"+element,
                                directory+"/simulation_"+name+"-"+str(i+1)+".arp")
            elif ".dat" in element:
                shutil.copyfile(directory+"/"+simulation_list[i]+"/"+element,
                                directory+"/simulation_"+name+"-"+str(i+1)+".dat")
        i += 1

def fst_nbA(stats, pairwise, AA, coordinates, outfst, outnbA):
    #Open and read the stats file
    infile = open(stats, "r")
    l1 = infile.read().splitlines()
    infile.close()
    #Open and read the file containing all pairwise distances
    infile = open(pairwise, "r")
    distance_pairwise = infile.read().splitlines()
    infile.close()
    #Open and read the file containing distances from Addis Ababa
    infile = open(AA, "r")
    distance_from_AA = infile.read().splitlines()
    infile.close()
    #Open and read the file containing the coordinates
    infile = open(coordinates, "r")
    coordinates = infile.read().splitlines()
    infile.close()
    #Separate the strings
    l2 = l1[0].split("\t")
    l3 = l1[1].split("\t")
    #Remove useless characters
    del l2[0:2]
    del l3[0]
    #Create a list containing continents
    continents = list()
    for element in coordinates:
        w = element.split("\t")
        continents.append(w[-1])
    del continents[0]
    #Write fst and pairwise distances
    fst = open(outfst, "w")
    fst.write("n.adlt.fst.wc_p\tpairwise_fst\tpairwise_distances\n")
    for i in range(len(distance_pairwise)):
        fst.write(l2[i]+"\t"+l3[i]+"\t"+distance_pairwise[i]+"\n")
    fst.close()
    #Write nbA, distances from Addis Ababa and continents
    nbA = open(outnbA, "w")
    nbA.write("n.adlt.nbAll_p\tnb_alleles\tdistance_from_AA\tcontinents\n")
    i = 0
    while i < len(continents):
        nbA.write(l2[i+2415]+"\t"+l3[i+2415]+"\t"+distance_from_AA[i]+"\t"+continents[i]+"\n")
        i += 1
    nbA.close()

def individuals_populations (coordinates, AA, individuals_out, populations_out):
    infile = open(coordinates, "r")
    data = infile.read().splitlines()
    infile.close()
    #Open the file containing distances from Addis Ababa and put them in a list
    infile = open(AA, "r")
    distances = infile.read().splitlines()
    infile.close()
    #Create one list containing individuals and one containing continent
    individuals = list()
    continent = list()
    for element in data:
        s = element.split("\t")
        individuals.append(s[3])
        continent.append(s[4])
    #Remove headers
    individuals.pop(0)
    continent.pop(0)
    outfile = open(populations_out, "w")
    outfile.write("individuals\tcontinents\tdistances_from_AA\n")
    i = 0
    while i < len(individuals):
        outfile.write(individuals[i]+"\t"+continent[i]+"\t"+distances[i]+"\n")
        i += 1
    outfile.close()
    #Change the name of the continent (= into number)
    continent_number = list()
    for element in continent:
        if element == "Africa":
            continent_number.append('1')
        elif element == "Middle_East":
            continent_number.append('2')
        elif element == "Europe":
            continent_number.append('3')
        elif element == "Central_Asia":
            continent_number.append('4')
        elif element == "East_Asia":
            continent_number.append('5')
        elif element == "Oceania":
            continent_number.append('6')
        else:
            continent_number.append('7')
    #Write the individuals output file
    outfile = open(individuals_out, "w")
    for i in range(len(individuals)):
        outfile.write(int(individuals[i])*(continent_number[i]+"\n"))
    outfile.close()

def structure_arp(coordinates, genotypes, out_structure):
    #Open and read the file containing the coordinates of the 70 sampled populations
    infile = open(coordinates, "r")
    #Put each line as one element in the list
    coordinates = infile.read().splitlines()
    infile.close()
    #Split each element of the previous list
    N = list()
    for element in coordinates:
        N.append(element.split("\t"))
    #Create a list containing the continent of the 70 sampled places
    continents = list()
    for element in N:
        continents.append(element[4]+' ')
    continents.pop(0)
    #Create a list containing the number of individuals in each of the 70 sampled places
    individuals = list()
    for element in N:
        individuals.append(element[3])
    individuals.pop(0)
    #Import the genotypes from the file.arp
    infile = open(genotypes, "r")
    #Put each line as one element in the list
    data = infile.read().splitlines()
    infile.close()
    #Remove all non informative characters
    del data[:16]
    #Create a temporary file
    outfile = open("prestructure.txt", "w")
    #Write the genotypes
    for element in data:
        if "}" in element:
            continue
        elif "Sample" in element:
            continue
        elif element == '':
            continue
        #First strand
        elif "Ind" in element:
            d = element.split(' ')
            n = " ".join(d[8:])
            outfile.write(n+"\n")
        #Second strand
        else:
            d = element.split(' ')
            n = " ".join(d[14:])
            outfile.write(n+"\n")
    outfile.close()
    #Open and read the temporary file
    infile = open("prestructure.txt", "r")
    #Put each line as one element in the list
    genotypes = infile.read().splitlines()
    infile.close()
    #Create a list containing the continent of origin for each individual
    cont_ind = list()
    i = 0
    while i < len(continents):
        s = int(individuals[i])*2*continents[i]
        l = s.split(' ')
        cont_ind.extend(l[:-1])
        i += 1
    #Replace the continent name by a numerical code (America = 7)
    for i in range(len(cont_ind)):
        if cont_ind[i] == "Africa":
            cont_ind[i] = '1'
        elif cont_ind[i] == "Middle_East":
            cont_ind[i] = '2'
        elif cont_ind[i] == "Europe":
            cont_ind[i] = '3'
        elif cont_ind[i] == "Central_Asia":
            cont_ind[i] = '4'
        elif cont_ind[i] == "East_Asia":
            cont_ind[i] = '5'
        elif cont_ind[i] == "Oceania":
            cont_ind[i] = '6'
        else:
            cont_ind[i] = '7'
    #Write the genotype of each individual and the continent in an output file
    outfile = open(out_structure, "w")
    i = 0
    while i < len(genotypes):
        if i%2 == 0:
            outfile.write("ind_"+str(i)+' '+cont_ind[i]+' '+genotypes[i]+"\n")
            i += 1
        else:
            outfile.write("ind_"+str(i-1)+' '+cont_ind[i]+' '+genotypes[i]+"\n")
            i += 1
    outfile.close()
    infile = open(out_structure, "r")
    data = infile.read().splitlines()
    infile.close()
    outfile = open(out_structure, "w")
    i = 0
    while i < len(data):
        if i%2 == 0:
            outfile.write(data[i]+"\n")
            i += 1
        else:
            l = data[i].split()
            s = " ".join(l)
            outfile.write(s+"\n")
            i += 1
    outfile.close()
    #Remove the temporary file
    os.remove("prestructure.txt")
    #Rename the name of the individuals
    infile = open(out_structure, "r")
    data = infile.readlines()
    infile.close()
    outfile = open(out_structure, "w")
    i = 0
    j = 1
    while i < len(data):
        mini_list = data[i].split(' ')
        outfile.write(str(j)+" ")
        s = " ".join(mini_list[1:])
        outfile.write(s)
        mini_list = data[i+1].split(' ')
        outfile.write(str(j)+" ")
        s = " ".join(mini_list[1:])
        outfile.write(s)
        j += 1
        i += 2
    outfile.close()

def structure_dat(individuals, genotypes, out_structure):
    #Open and read the file containing the genotypes (file.dat)
    infile = open(genotypes, "r")
    #Each line as an element in the list
    data = infile.read().splitlines()
    infile.close()
    #Open and read the file containing the individuals
    infile = open(individuals, "r")
    individuals = infile.read().splitlines()
    infile.close()
    #Delete the first 501 item in the data list (=> 500 loci)
    del data[:501]
    #Create an output file
    outfile = open(out_structure, "w")
    for i in range(len(individuals)):
        mini_list = data[i].split(' ')
        mini_list.pop(0)
        mini_list.pop(len(mini_list)-1)
        first_loci = list()
        second_loci = list()
        for item in mini_list:
            first_loci.append(item[:3])
            second_loci.append(item[3:])
        loci_1 = " ".join(first_loci)
        loci_2 = " ".join(second_loci)
        outfile.write(str(i+1)+" "+individuals[i]+" "+loci_1+"\n")
        outfile.write(str(i+1)+" "+individuals[i]+" "+loci_2+"\n")
    outfile.close()

def admixture(structure, outname):
    #Each row as an element in list
    infile = open(structure, "r")
    data = infile.read().splitlines()
    infile.close()
    #Determine the number of sequences (= 2x number of individuals)
    nb_sequence = len(data)
    #Each element in the first list as a list
    L = list()
    for element in data:
        s = element.split(' ')
        L.append(s)
    #Convert row to column
    col = zip(*L)
    name = list(col[0])
    pop = list(col[1])
    nb_locus = len(col)-2
    #Create a file for each locus with 0 and 1
    z = 2
    while z < len(col):
        col2 = list(col[z])
        alleles = col2[:]
        i = 0
        while i < len(alleles):
            if alleles[i] in alleles[i+1:]:
                alleles.pop(i)
                i = 0
            else:
                i += 1
        outfile = open("loc_"+str(z-1)+".txt", "w")
        for element in alleles:
            s = ""
            i = 0
            while i < len(col2):
                if col2[i] == element:
                    s += "A"
                    i += 1
                elif element == "NA":
                    s += "0"
                    i += 1
                else:
                    s += "T"
                    i += 1
            outfile.write(s+"\n")
        outfile.close()
        z += 1
    #Put everything in the same file
    outfile = open("intermediaire1.txt", "w")
    z = 1
    while z < nb_locus+1:
        infile = open("loc_"+str(z)+".txt", "r")
        new = infile.read().splitlines()
        infile.close()
        i = 0
        while i < len(name):
            for element in new:
                outfile.write(element[i]+" ")
            outfile.write("\n")
            i += 1
        z += 1
    outfile.close()
    #Reorganize in the final file
    infile = open("intermediaire1.txt", "r")
    data = infile.read().splitlines()
    infile.close()
    outfile = open("intermediaire2.txt", "w")
    i = 0
    while i < len(name):
        outfile.write("pop_"+pop[i]+" "+name[i]+" ")
        outfile.write(data[i])
        a = 1
        while a < nb_locus:
            outfile.write(data[i+a*nb_sequence])
            a += 1
        outfile.write("\n")
        i += 1
    outfile.close()
    infile = open("intermediaire2.txt", "r")
    data = infile.read().splitlines()
    infile.close()
    #Write the ped file
    outfile = open(outname+".ped", "w")
    i = 0
    while i < len(data):
        j = i+1
        s1 = data[i].split(' ')
        s2 = data[j].split(' ')
        outfile.write(s1[0]+" "+s1[1]+ " 0 0 1 0 ")
        z = 2
        del s1[-1]
        del s2[-1]
        while z < len(s1)-1:
            outfile.write(s1[z]+ " ")
            outfile.write(s2[z]+ " ")
            z += 1
        outfile.write(s1[-1]+" ")
        outfile.write(s2[-1]+"\n")
        i += 2
    nb_snp = len(s1)-2
    outfile.close()
    #Write the map file
    outfile = open(outname+".map", "w")
    i = 0
    while i < nb_snp:
        outfile.write("0 loc_"+str(i+1)+" 0 0\n")
        i += 1
    outfile.close()
    #Delete all intermediary files
    os.remove("intermediaire1.txt")
    os.remove("intermediaire2.txt")
    i = 1
    while i < nb_locus+1:
        os.remove("loc_"+str(i)+".txt")
        i += 1

def admixture_rearrangement(populations, admixture_Q, output):
    #Open and read the populations file
    infile = open(populations, "r")
    #Each row as an element of the list
    data= infile.read().splitlines()
    infile.close()
    #Create 3 lists for individuals, continent and distances
    individuals = list()
    continent_data = list()
    distances = list()
    #Remove the first element of data list (= remove the header)
    data.pop(0)
    #Add each item in the right list
    for element in data:
        s = element.split('\t')
        individuals.append(s[0])
        continent_data.append(s[1])
        distances.append(s[2])
    #Create a new list for continent name
    continent = list()
    #Change the name of the continents into number
    for element in continent_data:
        if element == "Africa":
            continent.append('1')
        elif element == "Middle_East":
            continent.append('2')
        elif element == "Europe":
            continent.append('3')
        elif element == "Central_Asia":
            continent.append('4')
        elif element == "East_Asia":
            continent.append('5')
        elif element == "Oceania":
            continent.append('6')
        else:
            continent.append('7')
    #Create 2 new lists
    new_continent = list()
    new_distances = list()
    #Add the continent and the distance according to population size
    for i in range(len(individuals)):
        j = 0
        while j < int(individuals[i]):
            new_continent.append(continent[i])
            new_distances.append(int(distances[i]))
            j += 1
    #Open the ADMIXTURE results file
    infile = open(admixture_Q, "r")
    data = infile.read().splitlines()
    infile.close()
    #Create a list where each item is a tuple (distance, continent, admixtureQ)
    master_list = list()
    for i in range(len(data)):
        master_list.append((new_continent[i], new_distances[i], data[i]))
    #Sort the master_list according to continent, then to distance
    master_list.sort()
    #Create a list containing the sorted distances
    sorted_distances = list()
    for element in master_list:
        sorted_distances.append(element[1])
    i = 1
    #Remove all doublons
    while i < len(sorted_distances):
        if sorted_distances[i] == sorted_distances[i-1]:
            sorted_distances.pop(i)
            i = 1
        else:
            i += 1
    #Write the rearranged ADMIXTURE results in an outfile
    outfile = open(output, "w")
    i = 0
    j = 0
    while i < len(sorted_distances):
        mini_list = list()
        while j < len(master_list):
            if sorted_distances[i] == master_list[j][1]:
                mini_list.append(master_list[j])
                master_list.pop(j)
                j = 0
            else:
                break
        random.shuffle(mini_list)
        for element in mini_list:
            outfile.write(element[2]+"\n")
        i += 1
    outfile.close()

def admixture_bestK(bestK_input, output, nbK):
    #Open and read the file containing all CV errors
    infile = open(bestK_input, "r")
    #Each row as an element in a list
    data = infile.read().splitlines()
    infile.close()
    #Open an outfile
    outfile = open(output, "w")
    i = 0
    while i < len(data):
        run_list = list()
        #Add to run_list the CV errors for the first simulation
        run_list.extend(data[i:i+nbK])
        k_list = list()
        for element in run_list:
            #Split all elements
            a = element.split(' ')
            #Add to k_list the error and the number of K
            k_list.append((float(a[3]), a[2]))
        #Sort the k_list by CV errors
        k_list.sort()
        #Write the outfile like : (K=...): CV error
        outfile.write(str(k_list[0][1])+" "+str(k_list[0][0])+"\n")
        i += nbK
    outfile.close()

def cluster_nbK(kmeans_result, output):
    infile = open(kmeans_result, "r")
    data = infile.read().splitlines()
    infile.close()
    #List containing the cluster number
    clusters = data[1].split(', ')
    clusters.sort()
    j = 0
    while j < len(clusters)-1:
        if clusters[j] in clusters[j+1:]:
            clusters.pop(j)
            j = 0
        else:
            j += 1
    outfile = open(output, "a")
    #Write the maximal cluster number (which is the number of clusters)
    outfile.write(clusters[-1]+"\n")
    outfile.close()

def cluster_continent(kmeans_result, clusters_continent):
    infile = open(kmeans_result, "r")
    data = infile.read().splitlines()
    infile.close()
    #Split continents and cluster
    continents = data[0].split(', ')
    clusters = data[1].split(', ')
    tuple_list = list()
    for i in range(len(continents)):
        tuple_list.append((clusters[i], continents[i]))
    #Sort by cluster number
    tuple_list.sort()
    #Select the number of K
    k_max = tuple_list[-1][0]
    k = 1
    outfile = open(clusters_continent, "a")
    while k < int(k_max)+1:
        k_list = list()
        for element in tuple_list:
            if element[0] == str(k):
                k_list.append(element[1])
        c = collections.Counter(k_list)
        most = c.most_common(1)
        outfile.write(most[0][0]+"\n")
        k += 1
    outfile.close()

def cluster_good_clustering(kmeans_result, good_clustering_out):
    #Open and read the file containing the K-means clustering results
    infile = open(kmeans_result, "r")
    #Each row as an element in the list
    data = infile.read().splitlines()
    infile.close()
    #List of continents of origin
    continents = data[0].split(', ')
    #List of the cluster attribution
    clusters = data[1].split(', ')
    #Transform each element of the list (which are string) into integer
    i = 0
    while i < len(clusters):
        clusters[i] = int(clusters[i])
        i += 1
    #List of tuples (cluster, continent)
    tuples_list = list()
    #Create the tuples_list [(cluster, continent),...]
    i = 0
    while i < len(continents):
        tuples_list.append((clusters[i], continents[i]))
        i += 1
    #Sort the list by cluster (cluster 1, cluster 2, etc.)
    tuples_list.sort()
    #Open the output file
    outfile = open(good_clustering_out, "w")
    #Sort and select the number of K (= number of clusters)
    clusters.sort()
    nK = clusters[-1]
    k = 1
    while k < nK+1:
        k_list = list()
        for element in tuples_list:
            #Put element corresponding to the current k in k_list
            if k == element[0]:
                k_list.append(element)
        continent_list = list()
        #Put all continents of the k_list in continent_list
        for element in k_list:
            continent_list.append(element[1])
        #Count the number of time that each continent appears in continent_list
        c = collections.Counter(continent_list)
        #Select the most frequent continent
        most = c.most_common(1)
        #Calculate the percentage of the most frequent continent
        percentage = float(most[0][1])/len(continent_list)
        #Write the most frequent continent and the percentage in the outfile
        outfile.write("continent "+most[0][0]+"\t"+str(percentage)+"\n")
        k += 1
    outfile.close()

def cluster_good_clustering_summary(good_clustering_name, out_good_clustering_summary):
    #Create the dictionary containing all continents
    D = {"continent 1": ['0'], "continent 2": ['0'], "continent 3": ['0'], "continent 4": ['0'], "continent 5": ['0'],
         "continent 7": ['0']}
    i = 1
    #Open successively all good clustering file
    while i < 101:
        infile = open(good_clustering_name+"-"+str(i)+".txt", "r")
        #Each row as an element in the list
        data = infile.read().splitlines()
        infile.close()
        #Add in the dictionary the value of clustering for each continent
        for element in data:
            s = element.split('\t')
            D[s[0]].append(s[1])
        i += 1
    #Open the outfile
    outfile = open(out_good_clustering_summary, "w")
    #Get the list of keys in the dictionary (= list of continents)
    key_list = D.keys()
    for element in key_list:
        s = 0
        for item in D[element]:
            s += float(item)
        if s == 0:
            pass
        else:
            outfile.write(element+"\t"+str(s/(len(D[element])-1))+"\n")
    outfile.close()

def cluster_individuals_continent(kmeans_result_name, good_clustering_name, out_cluster_individuals):
    #In order to know the number of individuals
    infile = open(kmeans_result_name+"-1.txt", "r")
    data = infile.read().splitlines()
    infile.close()
    #Convert the string of individuals into a list
    I = data[1].split(', ')
    #The length of the list is the number of individuals
    nb_individuals = len(I)
    #The individual ID
    ID = 1
    while ID < nb_individuals+1:
        individual = list()
        i = 1
        while i < 101:
            #Open and read as list the K-means clustering results
            infile = open(kmeans_result_name+"-"+str(i)+".txt", "r")
            #Each row as an element of the list
            data = infile.read().splitlines()
            infile.close()
            #data[0] : continent
            #data[1] : cluster number (= I)
            I = data[1].split(', ')
            #Append to individual list the cluster number for each individual (among 100 simulations)
            individual.append(I[ID-1])
            i += 1
        continent_cluster = list()
        i = 1
        while i < 101:
            #Open and read as a list the results of good clustering
            infile = open(good_clustering_name+"-"+str(i)+".txt", "r")
            data = infile.read().splitlines()
            infile.close()
            #Select the cluster number in individual list (position of the item)
            position = int(individual[i-1])
            #Append to continent_cluster list the continent-type of the cluster (African, European, etc.)
            continent_cluster.append(data[position-1])
            i += 1
        continent_name = list()
        #Add to the list continent_name the continent (represented as a number)
        for element in continent_cluster:
            continent_name.append(element[10])
        #Count the number of time that each continent appear
        proportions = collections.Counter(continent_name)
        #Get the list of key (= list of continent)
        list_of_keys = proportions.keys()
        #Open the temporary outfile (one for each individual)
        outfile = open("outfile_"+str(ID)+".txt", "w")
        #The continent doesn't have the Oceania (= '6')
        continent_list = ['1', '2', '3', '4', '5', '7']
        #Write in the outfile the proportions for each continent
        for element in continent_list:
            outfile.write(str(proportions[element]/100.)+" ")
        outfile.write("\n")
        outfile.close()
        ID += 1
    #Open the final outfile
    outfile = open(out_cluster_individuals, "w")
    ID = 1
    #Open successively the temporary files and write their content in the final outfile
    while ID < nb_individuals+1:
        infile = open("outfile_"+str(ID)+".txt", "r")
        data = infile.read()
        infile.close()
        outfile.write(data)
        os.remove("outfile_"+str(ID)+".txt")
        ID += 1
    outfile.close()

def procrustes(gps_coordinates, out_gps_coordinates_rad):
    #Open and read the file containing the coordinates (in degrees)
    infile = open(gps_coordinates, "r")
    #Each row as an element of the list
    data = infile.readlines()
    infile.close()
    #Open the outfile
    outfile = open(out_gps_coordinates_rad, "w")
    i = 0
    while i < len(data):
        #For the header line
        if i == 0:
            s = data[i].split('\t')
            #Write the header line
            outfile.write("\t".join(s[4:]))
        else:
            line = data[i].split('\t')
            if float(line[5]) < -20:
                #Change the longitude of +180 degrees for American populations
                line[5] = str(float(line[5])+180)
            else:
                #Change the longitude of -180 degrees for other populations
                line[5] = str(float(line[5])-180)
            #Schift all longitudes of +20 degrees
            line[5] = str(float(line[5])+20)
            #Convert the longitude and the latitude in radians
            line[5] = str(float(line[5])/(180/math.pi))
            line[6] = str(float(line[6])/(180/math.pi))+"\n"
            #Change the name of the continents (abbreviation)
            if line[4] == "Africa":
                line[4] = "AF"
            elif line[4] == "Middle_East":
                line[4] = "ME"
            elif line[4] == "Europe":
                line[4] = "EU"
            elif line[4] == "Central_Asia":
                line[4] = "CA"
            elif line[4] == "East_Asia":
                line[4] = "EA"
            elif line[4] == "America":
                line[4] = "AM"
            else:
                line[4] = "OC"
            s = "\t".join(line[4:])
            #Write in the outfile
            outfile.write(int(line[3])*s)
        i += 1
    outfile.close()

def procrustes_summary(procrustes_results_name, procrustes_summary_angle_out, procrustes_summary_score_out):
    i = 1
    while i < 101:
        infile = open(procrustes_results_name+"-"+str(i)+".txt", "r")
        data = infile.read().splitlines()
        infile.close()
        angle = (180/math.pi) * float(data[1])
        if angle < 90:
            new_angle = angle
        else:
            new_angle = 180-angle
        outfile = open(procrustes_summary_angle_out, "a")
        outfile.write(str(new_angle)+"\n")
        outfile.close()
        outfile = open(procrustes_summary_score_out, "a")
        outfile.write(data[0]+"\n")
        outfile.close()
        i += 1

def eHGDP(eHGDP_loc, eHGDP_tab, eHGDP_other, eHGDP_pop, eHGDP_out):
    #Open and read the file eHGDP_loc containing the loci names
    infile = open(eHGDP_loc, "r")
    #Each line as an element of the list
    data = infile.read().splitlines()
    infile.close()
    #Delete first element (= header)
    data.pop(0)
    locus = list()
    for element in data:
        s = element.split('-')
        #[:-1] for removing extra quotation marks at the end
        locus.append(s[1][:-1])
    #Open and read the file eHGDP_tab containing the data
    infile = open(eHGDP_tab, "r")
    data = infile.read().splitlines()
    infile.close()
    locus_alleles = data[0].split(" ")
    data.pop(0)
    #Create a list new_data
    new_data = list()
    #Replace "NA" by "N"
    for element in data:
        s = element.split(' ')
        s.pop(0)
        i = 0
        while i < len(s):
            if s[i] == "NA":
                s[i] = "N"
                i += 1
            else:
                i += 1
        new = " ".join(s)
        new_data.append(new)
    #Switch line to column
    tab = zip(*new_data)
    i = 0
    while i < len(tab):
        if "0" in tab[i]:
            i += 1
        else:
            tab.pop(i)
            i = 0
    #Create a list containing all locus name
    locus_name = list()
    for i in range(len(locus)):
        if locus[i] not in locus_name:
            locus_name.append(locus[i])
    #Create a list for all alleles
    alleles = list()
    for element in locus_alleles:
        s = element.split(".")
        alleles.append(s[1][:-1])
    #Create locus file, one file per locus
    i = 0
    for element in locus_name:
        outfile = open("locus_"+element+".txt", "w")
        while i < len(locus):
            if element == locus[i]:
                s = " ".join(tab[i])
                outfile.write(alleles[i]+" "+s+"\n")
                i += 1
            else:
                outfile.close()
                break
    #Convert the SNP in locus file into microsatellites
    i = 1
    while i <= int(locus_name[-1]):
        infile = open("locus_"+str(i)+".txt", "r")
        data = infile.read().splitlines()
        infile.close()
        outfile = open("locus_"+str(i)+".txt", "w")
        for element in data:
            s = element.split(' ')
            allele = s[0]
            s.pop(0)
            for j in range(len(s)):
                if s[j] == '1':
                    s[j] = allele
                elif s[j] == '2':
                    s[j] = allele+"*"
            new = " ".join(s)
            outfile.write(new+"\n")
        outfile.close()
        i += 1
    #Write a file containing all genetic data for each individual
    j = 0
    while j < 1350:
        individual = list()
        i = 1
        while i <= int(locus_name[-1]):
            infile = open("locus_"+str(i)+".txt", "r")
            data = infile.read().splitlines()
            infile.close()
            for element in data:
                s = element.split(' ')
                if s[j] == '0':
                    continue
                elif s[j] == 'N':
                    individual.append(s[j])
                elif "*" in s[j]:
                    individual.extend([s[j][:-1], s[j][:-1]])
                else:
                    individual.append(s[j])
                    continue
            individual.append("\n")
            i += 1
        outfile = open("individual_"+str(j+1)+".txt", "w")
        new = "".join(individual)
        outfile.write(new)
        outfile.close()
        j += 1
    #Remove all temporary locus files
    i = 1
    while i <= 678:
        os.remove("locus_"+str(i)+".txt")
        i += 1
    #Open and read the file eHGDP_other
    infile = open(eHGDP_other, "r")
    data = infile.read().splitlines()
    infile.close()
    data.pop(0)
    #Create a list of continents (names replaced by numbers)
    continent = list()
    for element in data:
        s = element.split(' ')
        if s[2][1:-1] == 'AFRICA':
            continent.append('1')
        elif s[2][1:-1] == "MIDDLE_EAST":
            continent.append('2')
        elif s[2][1:-1] == "EUROPE":
            continent.append('3')
        elif s[2][1:-1] == "CENTRAL_SOUTH_ASIA":
            continent.append('4')
        elif s[2][1:-1] == "EAST_ASIA":
            continent.append('5')
        elif s[2][1:-1] == "OCEANIA":
            continent.append('6')
        else:
            continent.append('7')
    #Open and read the file eHGDP_pop
    infile = open(eHGDP_pop, "r")
    data = infile.read().splitlines()
    infile.close()
    data.pop(0)
    #Create a list of all populations
    pop = list()
    for element in data:
        s = element.split(' ')
        pop.append(s[1][1:-1])
    #Create a list for continent of origin of each individual
    individuals = list()
    i = 0
    for j in range(len(pop)-1):
        if pop[j] == pop[j+1]:
            individuals.append(continent[i])
        else:
            individuals.append(continent[i])
            i += 1
    individuals.append(continent[i])
    outfile = open("eHGDP_individuals.txt", "w")
    for element in individuals:
        outfile.write(element+"\n")
    outfile.close()
    #Open the output file
    outfile = open(eHGDP_out, "w")
    i = 0
    while i < 1350:
        #Read the individual files
        infile = open("individual_"+str(i+1)+".txt", "r")
        data = infile.read().splitlines()
        infile.close()
        for j in range(len(data)):
            #Replace element containing 'N' by 'NA NA '
            if 'N' in data[j]:
                data[j] = "NA NA "
        #Write the first allele in output file
        outfile.write(str(i+1)+" "+individuals[i]+" ")
        for element in data:
            outfile.write(element[:3]+" ")
        outfile.write("\n"+str(i+1)+" "+individuals[i]+" ")
        #Write the second allele in output file
        for element in data:
            outfile.write(element[3:]+" ")
        outfile.write("\n")
        i += 1
    outfile.close()
    #Remove all temporary individual files
    i = 1
    while i <= 1350:
        os.remove("individual_"+str(i)+".txt")
        i += 1

def eHGDP_admixture_rearrangement(eHGDP_individuals, eHGDP_admixtureQ_name):
    infile = open(eHGDP_individuals, "r")
    individuals = infile.read().splitlines()
    infile.close()
    i = 1
    while i < 11:
        infile = open(eHGDP_admixtureQ_name+"."+str(i)+".Q", "r")
        data = infile.read().splitlines()
        infile.close()
        master_list = list()
        for j in range(len(data)):
            master_list.append((individuals[j], data[j]))
        outfile = open(eHGDP_admixtureQ_name+"."+str(i)+".txt", "w")
        master_list.sort()
        k = 1
        while k < 8:
            temporary = list()
            for element in master_list:
                if element[0] == str(k):
                    temporary.append(element)
            random.shuffle(temporary)
            for item in temporary:
                outfile.write(item[1]+"\n")
            k += 1
        outfile.close()
        i += 1

def eHGDP_procrustes(eHGD_other, eHGDP_pop, out_coordinates):
    infile = open(eHGD_other, "r")
    data = infile.read().splitlines()
    infile.close()
    data.pop(0)

    coordinates = list()
    continents = list()
    for element in data:
        s = element.split(' ')
        continents.append(s[2][1:-1])
        coordinates.append((s[4], s[5]))

    infile = open(eHGDP_pop, "r")
    data = infile.read().splitlines()
    infile.close()
    data.pop(0)

    pop = list()
    for element in data:
        s = element.split(' ')
        pop.append(s[1][1:-1])

    outfile = open(out_coordinates, "w")
    j = 0
    for i in range(len(pop)-1):
        if pop[i] == pop[i+1]:
            outfile.write(pop[i]+" "+continents[j]+" "+coordinates[j][0]+" "+coordinates[j][1]+"\n")
        else:
            outfile.write(pop[i]+" "+continents[j]+" "+coordinates[j][0]+" "+coordinates[j][1]+"\n")
            j += 1
    outfile.write(pop[i]+" "+continents[j]+" "+coordinates[j][0]+" "+coordinates[j][1]+"\n")
    outfile.close()

    infile = open(out_coordinates, "r")
    data = infile.read().splitlines()
    infile.close()
    outfile = open("eHGDP_coordinates.txt", "w")
    outfile.write("population continents latitude longitude\n")
    for element in data:
        line = element.split(' ')
        if 'AMERICA' in  line:
            line[3] = str(float(line[3])+180)
        else:
            line[3] = str(float(line[3])-180)
        line[3] = str(float(line[3])+20)
        line[2] = str(float(line[2])/(180/math.pi))
        line[3] = str(float(line[3])/(180/math.pi))+"\n"
        if line[1] == "AFRICA":
            line[1] = "AF"
        elif line[1] == "MIDDLE_EAST":
            line[1] = "ME"
        elif line[1] == "EUROPE":
            line[1] = "EU"
        elif line[1] == "CENTRAL_SOUTH_ASIA":
            line[1] = "CA"
        elif line[1] == "EAST_ASIA":
            line[1] = "EA"
        elif line[1] == "AMERICA":
            line[1] = "AM"
        else:
            line[1] = "OC"
        new_line = " ".join(line)
        outfile.write(new_line)
    outfile.close()