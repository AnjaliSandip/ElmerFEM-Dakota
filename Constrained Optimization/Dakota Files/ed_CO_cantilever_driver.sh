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
## Pre-processing Phase -- Generate/configure an input file for your simulation 
##  by substiting in parameter values from the Dakota paramters file.
##
###############################################################################
#Transfer new geometric parameters from Dakota parameters file to Elmer geometry file
#Both files are currently in the Dakota workspace/Dakota Project
dprepro $params cantilever_geometry_CO.template beam3d.grd

#Transfer beam3d.grd  files from Dakota gui workspace to Elmer workspace
cp /Dakota/Gui/Workspace/Dakota/Project/beam3d.grd   /Elmer/Workspace/Project/Folder/beam3d.grd

############################################################################### 
##
## Execution Phase -- Run your simulation
##
###############################################################################

##Create new mesh (and the corresponding mesh files) for the new geometry 
cd /Location/to/Elmer/Case/File
ElmerGrid 1 2 beam3d.grd

#Transfer the revised beam3d.grd files to the beam3d folder
#beam3d folder is within Elmer Project folder and contains the Elmer project sif file
cp /Elmer/Workspace/beam3d.grd  /Elmer/Workspace/beam3d/beam3d.grd 

##Open beam3d folder and run simulation in Elmer
cd /Elmer/Workspace/Project/Folder/beam3d
ElmerSolver case.sif


############################################################################### 
##
## Post-processing Phase -- Extract (or calculate) quantities of interest
##  from your simulation's output and write them to a properly-formatted
##  Dakota results file.
##
###############################################################################

#Extract the desired results from Elmer output and transfer it to Dakota results file, results.out
cp /Elmer/Workspace/beam3d/displacement.txt $results

