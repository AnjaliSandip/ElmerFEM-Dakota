 # copyright (c) 2019 ASandip
 #This program is free software: you can redistribute it and/or 
 # modify it under the terms of the GNU General Public License as 
 # published by the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <https://www.gnu.org/licenses/>.


#!/bin/bash

# $1 and $2 are special variables in bash that contain the 1st and 2nd 
# command line arguments to the script, which are the names of the
# Dakota parameters and results files, respectively.

params=$1
results=$2

############################################################################### 
##
## Pre-processing Phase: Transfer new set of values for the chosen input 
## parameters from Dakota to Elmer FEM
##
###############################################################################

dprepro $params sim.template Elmer_file

#Transfer the Elmer simulation input file, with new parameters, from Dakota to the Elmer workspace
cp /Dakota/Gui/Workspace/Dakota/Project/Elmer_file   /Elmer/Workspace/Project/Folder/Elmer_file

############################################################################### 
##
## Execution Phase: Run your simulation
##
###############################################################################

#Open the Elmer project folder and run simulation in Elmer
cd /Elmer/Workspace/Project/Folder/
ElmerSolver Elmer_file


############################################################################### 
##
## Post-processing Phase: Extract (or calculate) quantities of interest
##  from your simulation's output and write them to a properly-formatted
##  Dakota results file.
##
###############################################################################

#Extract the desired result/s from Elmer simulation output and transfer it to Dakota results file, results.out
cp  /Elmer/Workspace/Project/Folder/results.txt $results

