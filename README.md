# QSCPA__Project
In this file we describe and explain the different files of this Git repository
# MatlabCode1.m
This file contains code for analyzing the data recieved from simulating our circuit in Virtuoso. The data is contained in excel files and is uploaded to Matlab via "Import Data" button. The code is devided into 7 sections. Each section is to run separately using Matlab "Run Section" button. Each section has its own relavent data file. The sections purposes are as follows:
  Section 1: Plots the amplitude, phase, power and PE of the output's fundumental frequency as a function of on Q cells, when the I channel is off.
  Section 2: Plots the amplitude, phase, power and PE of the output's fundumental frequency as a function of on Q cells, when the I channel is on.
  Section 3: Plots the DNL and INL graphs of the output voltage.
  Section 4: Plots the IQ constellation.
  Section 5: Plots the output power and PE as a function of the clock's frequency.
  Section 6: Plots the IQ constellation given gain imbalance.
  Section 7: Plots the IQ constellation given phase imbalance.
  Section 8: Contains functions that create the imbalnce of the IQ constellation.
# "Data for section" excel files 
These files are the ones we used MatlabCode1 code on. The files' names represent what code sections use these files. Each file has different data set:
  Data for sections 1 and 2: Contains the Virtuoso simulation result for the output amplitude (Vout_h1Mag), phase (Vout_h1Phase), power (Pout_h1) and PE (PE) versus how many Q cells are on (Qcode) and how many I       cells are on (Icode). The first 256 results are for when the I channel is off and the next 256 results are for when the I channel is on.
  Data for section 3: The same as the previous file. It contains only the first 256 results but with better resolution.
  Data for sections 4, 6 and 7: The results are similar to the previous files only that the Q and I code come in chuncks 0:32:224, 255 and the Q and I select bits take all possible options (0 and 1). All in all        there are 324 different configurations.
  Data for section 5: The results are the same. The clock frequency changes from 0.1Hz to 10GHz with 130 steps. The first 130 points are for when both channels are off, for the next 130 points only the Q 
  channel is on, for the next 130 points only the I channel is on and for the last 130 points both channels are on.
# VerilogA files
The project used a decoder that was created in VerilogA. It translates an 8 bit binary code to 256 thermometric code. The code for the decoder is contained in "Decoder VerilogA.txt" file. Additionally, a block that used in the circuit's TB, "Const_word VerilogA.txt" was also created in VerilogA. It recieves as parameter a number from 0 to 255 and outputs an 8 bit binary code in respect to the parameter.
# Component images file
Contains images used in the final project
# Q-SCPA Summary pdf file
A summary of the project. Contains additional simualtions, with additional explenations.
# Q-SCPA Suimmary images file
Conatin additional images of the project, used in Q-SCPA summary.
