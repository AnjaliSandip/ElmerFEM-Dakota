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
## Pre-processing Phase: Transfer new set of values for the chosen input 
## parameters from Dakota to Elmer FEM
##
###############################################################################
#Chosen input parameter: wire radius
dprepro $params wire.template wire.grd

# Transfer Elmer geometry file, wire.grd, with the new wire radius from Dakota to Elmer workspace
cp /Dakota/Gui/Workspace/Dakota/Project/wire.grd   /Elmer/Workspace/Project/Folder/wire.grd

#Chosen input parameter: electric conductivity of the wire
dprepro --inline "@ @" $params case.template case.sif

# Transfer Elmer simulation input file, case.sif, with the new electric conductivity from Dakota to the Elmer workspace
cp /Dakota/Gui/Workspace/Dakota/Project/case.sif  /Elmer/Workspace/Project/Folder/case.sif


###############################################################################
## Execution Phase: Run your simulation
##
###############################################################################
##Create new mesh (and the corresponding mesh files) for the new geometry, create wire folder
cd /Elmer/Workspace/Project/Folder/
ElmerGrid 1 2 wire.grd

#Transfer the revised wire.grd files to the wire folder
cp /Elmer/Workspace/Project/Folder/wire.grd    /Elmer/Workspace/Project/Folder/wire/wire.grd

##Open and run Elmer project, wire, with revised geometry and mesh files
cd   /Elmer/Workspace/Project/Folder/wire
ElmerSolver case.sif

############################################################################### 
##
##  Post-processing Phase: Extract (or calculate) quantities of interest
##  from your simulation's output and write them to a properly-formatted
##  Dakota results file.
##
###############################################################################

#Extract the joule heating at the final timestep from Elmer output and transfer it to Dakota results file, results.out
cp  /Elmer/Workspace/Project/Folder/results.txt   $results



