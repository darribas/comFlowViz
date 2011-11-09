            ########################################
            # comFlowViz: commuting flows visually #
            ########################################

This mini package offers the code used to produce the graphics in Arribas-Bel &
Gerritse (Forthcoming). In order to exemplify its use, the package contains
the NYC data used in the paper, all obtained from the Census Bureau.

If you use any snippet of the code released as part of this package, please cite
the reference below.

Authors
=======
Dani Arribas-Bel <daniel.arribas.bel@gmail.com>

Reference
=========
Arribas-Bel, D., Gerritse, M. (Forthcoming)
"Monocentricity? Commuting flows visually". Featured Graphic, Environment and
Planning A.

Dependencies
============
To use this package, you will need the following R packages, all of them
available from CRAN repositories:
    * shape
    * plotrix
    * vegan
    * maptools
    * RColorBrewer

Usage
=====
If you want to obtain a figure containing both the map and graph for NYC run
in the command line:

    > cd /path/to/the/folder/where/installed/
    > Rscript create_nyc.r

or from the R command line, you have to set the folder as working directory
and then:
    
    > source('create_nyc.r')

