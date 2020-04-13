 # copyright (c) 2019 ASandip
 # This program is free software: you can redistribute it and/or 
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

dprepro $params case.template case.sif
cp /home/caelinux2/caelinux/dakota_gui_workspace/ED_Cylinder/case.sif   /home/caelinux2/Desktop/Elmer/ElmerTutorialFilesGUI/VortexShedding/case.sif

############################################################################### 
##
## Execution Phase -- Run your simulation
##
###############################################################################

##Open and run Elmer project - beam3d - with revised geometry and mesh files
cd /home/caelinux2/Desktop/Elmer/ElmerTutorialFilesGUI/VortexShedding/
ElmerSolver case.sif


############################################################################### 
##
## Post-processing Phase -- Extract (or calculate) quantities of interest
##  from your simulation's output and write them to a properly-formatted
##  Dakota results file.
##
###############################################################################


cp  /home/caelinux2/Desktop/Elmer/ElmerTutorialFilesGUI/VortexShedding/dragforce.txt $results

