# QSCPA__Project
In this file we describe and explain the different files of this Git repository
# MatlabCode1.m
This file contains code for analyzing the data recieved from simulating our circuit in Virtuoso. The data is contained in excel files and is uploaded to Matlab via "Import Data" button. The code is devided into 7 sections. Each section is to run separately using Matlab "Run Section" button. Each section has its own relavent data file. The sections purposes are as follows:
  Section 1: Plots the amplitude, phase, power and PE of the output's fundumental frequency as a function of on Q cells, when the I channel is off.
  Section 2: Plots the amplitude, phase, power and PE of the output's fundumental frequency as a function of on Q cells, when the I channel is on.
  Section 3: Plots the DNL and INL graphs of the output voltage
  Section 4: Plots the IQ constellation
  Section 5: Plots the output power and PE as a function of the clock's frequency
  Section 6: Plots the IQ constellation given gain imbalance
  Section 7: Plots the IQ constellation given phase imbalance
  Section 8: Contains functions that create the imbalnce of the IQ constellation.
# Data for section excel files 
These files are the ones we used MatlabCode1 code on. The files' names represent what code sections use these files. Each file has different data set:
  Data for sections 1 and 2: Contains the Virtuoso simulation result for the output amplitude (Vout_h1Mag), phase (Vout_h1Phase), power (Pout_h1) and PE (PE) versus how many Q cells are on (Qcode) and how many I       cells are on (Icode). The first 256 results are for when the I channel is off and the next 256 results are for when the I channel is on.
  Data for section3: 
  
