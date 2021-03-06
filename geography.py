#!/usr/bin/python

import random
import os

def patch_matrix(capacity, pop, parameters, out_settings, out_sampling):
    #Open and read the file containing the patch capacities
    patch_file = open(capacity, "r")
    #Put each patch as one element in the list
    patch_capacity = patch_file.read().split(' ')
    patch_file.close()
    del patch_capacity[-1]
    #Open and read the file containing the number of individuals in each population
    population_file = open(pop, "r")
    #Put each number of individuals per population as one element in the list
    population = population_file.read().splitlines()
    population_file.close()
    #Create a list containing only 0 and with length of 20384, which is the total number of patches in the matrix
    patch_sample_size = list()
    for element in patch_capacity:
        patch_sample_size.append(0)
    #Create a list containing the position of all habitable demes
    p_habitable = list()
    for i in range(len(patch_capacity)):
        if patch_capacity[i] != '0':
            p_habitable.append(i)
    #Select randomly 70 habitable demes
    p_selected = random.sample(p_habitable, 70)
    #Place the sampled population in the patch_sample_size list
    #This list contains the location and the number of indivduals of the 70 sampled populations
    for i in range(len(p_selected)):
        selpop = random.randrange(len(population))
        patch_sample_size[p_selected[i]] = int(population[selpop])
        population.pop(selpop)
    #Write the patch_sample_list in a file.
    sample = open(out_sampling, "w")
    for element in patch_sample_size:
        sample.write(str(element)+" ")
    sample.close()
    #Import the parameters for the qN simulation and write them in a setting.ini file
    parameters_file = open(parameters, "r")
    s = parameters_file.read()
    parameters_file.close()
    settings_file = open(out_settings, "w")
    settings_file.write(s)
    settings_file.write("{")
    for element in patch_sample_size:
        settings_file.write(str(element)+" ")
    settings_file.write("}")
    settings_file.close()

def coordinates(sampling, coordinates):
    #Open and read the file containing the 70 sampled populations
    infile = open(sampling, "r")
    #Put each patch as one element in the list
    patch_sample_size = infile.read().split(' ')
    infile.close()
    patch_sample_size.pop(len(patch_sample_size)-1)
    #Create an output file
    outfile = open("only_coordinates.txt", "w")
    #Write the header
    outfile.write("patch\tline\tcolumn\tindividuals\n")
    #Write the coordinates of the sampled population and the number of individuals per population
    for i in range(len(patch_sample_size)):
        if patch_sample_size[i] != '0':
            outfile.write(str(i+1)+"\t")
            line = i/182+1
            column = (i+1)-((line-1)*182)
            outfile.write(str(line)+"\t")
            outfile.write(str(column)+"\t")
            outfile.write(str(patch_sample_size[i])+"\n")
    outfile.close()
    #Open and read the file containing the coordinates of the 70 sampled populations
    infile = open("only_coordinates.txt", "r")
    #Put each line as one element in the list
    data = infile.read().splitlines()
    infile.close()
    #Create a list containing all coordinates
    list_coord = list()
    for element in data:
        a = element.split('\t')
        list_coord.append(a)
    a = list_coord.pop(0)
    #Give the corresponding continent to the coordinates
    for element in list_coord:
        if int(element[1]) >= 94:
            element.append("Oceania")
        elif 63 <= int(element[1]) <= 93 and 18 <= int(element[2]) <= 87:
            element.append("East_Asia")
        elif int(element[2]) >= 88:
            element.append("America")
        elif 50 <= int(element[1]) <= 56 and 85 <= int(element[2]) <= 87:
            element.append("America")
        elif 49 <= int(element[1]) <= 62 and 18 <= int(element[2]) <= 74:
            element.append("Central_Asia")
        elif 46 <= int(element[1]) <= 48 and 52 <= int(element[2]) <= 63:
            element.append("Central_Asia")
        elif 21 <= int(element[1]) <= 48 and 70 <= int(element[2]) <= 80:
            element.append("Europe")
        elif 28 <= int(element[1]) <= 45 and 61 <= int(element[2]) <= 69:
            element.append("Europe")
        elif 46 <= int(element[1]) <= 48 and 64 <= int(element[2]) <= 69:
            element.append("Europe")
        elif 42 <= int(element[1]) <= 45 and 56 <= int(element[2]) <= 60:
            element.append("Europe")
        elif int(element[1]) == 41 and int(element[2]) == 60:
            element.append("Europe")
        elif 1 <= int(element[1]) <= 37 and 18 <= int(element[2]) <= 37:
            element.append("Africa")
        elif 1 <= int(element[1]) <= 32 and 38 <= int(element[2]) <= 48:
            element.append("Africa")
        elif 1 <= int(element[1]) <= 29 and 49 <= int(element[2]) <= 60:
            element.append("Africa")
        elif 1 <= int(element[1]) <= 27 and 61 <= int(element[2]) <= 69:
            element.append("Africa")
        elif 1 <= int(element[1]) <= 20 and int(element[2]) == 70:
            element.append("Africa")
        else:
            element.append("Middle_East")
    #Write the coordinates with the corresponding continent in an output file
    output = open(coordinates, "w")
    output.write("patch\tline\tcolumn\tindividuals\tcontinents\n")
    for element in list_coord:
        output.write(element[0]+"\t"+element[1]+"\t"+element[2]+"\t"+element[3]+"\t"+element[4]+"\n")
    output.close()
    #Remove the file containing only coordinates
    os.remove("only_coordinates.txt")

def patch_capacity(capacity, number):
    infile = open(capacity, "r")
    data = infile.read()
    infile.close()
    patch_list = data.split(' ')
    for i in range(len(patch_list)):
        if patch_list[i] != '0':
            patch_list[i] = str(number)
    s = " ".join(patch_list)
    outfile = open(capacity, "w")
    outfile.write(s)
    outfile.close()

def the_map(capacity, outmap):
    infile = open(capacity, "r")
    data = infile.read().split(' ')
    infile.close()
    del data[-1]
    for i in range(len(data)):
        if data[i] != "0":
            data[i] = "0"
        else:
            data[i] = "1"
    outfile = open(outmap, "w")
    for element in data:
        outfile.write(element+" ")
    outfile.close()