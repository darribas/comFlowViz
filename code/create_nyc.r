##############################################
# Main controller to generate global graphic #
##############################################

# Author: Daniel Arribas-Bel <daniel.arribas.bel@gmail.com>
# Copyright 2011 by Daniel Arribas-Bel 
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    See: <http://creativecommons.org/licenses/GPL/2.0/> or <http://www.gnu.org/licenses/>


png('../nyc_example.png', heigh=600, width=1200)
par(mfrow=c(1,2))
source('plot_flows.r')
source('plot_dists.r')
dev.off()

