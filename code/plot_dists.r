#########################
# Generate distance map #
#########################
#

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

source('plots_settings.r')

csv = '../data/flows_respective_to_manhattan2.csv'
csv <- read.csv(csv)
csv <- csv[csv$county_i != csv$county_j, ]

# Initialize plot with appropriate bounding box
maxi <- max(csv$resdist)
plot(c(0, maxi*0.0003048), c(0, maxi*0.0003048), type='n',
    xlab='Residential distance to CBD', ylab='Workplace distance to CBD',
    cex.lab=cexS-0.25, main='Dist to Manhattan', cex.main=cexS)

# Line of means
ml = read.csv('../data/means_manhattan.csv')
ml = ml[order(ml$resdist), ]
# Variance bands
polygon( c(ml$resdist*0.0003048, rev(ml$resdist*0.0003048)),
        c(ml$mminse*0.0003048, rev(ml$mplusse*0.0003048)),
                 col=rgb(0.894, 0.89, 0.859), lty=2,border=NA)
# 45 degree line
lines(c(0, maxi*0.0003048), c(0, maxi*0.0003048), lty=2,
    col=rgb(0, 0, 0, alpha=1.00), lw=0.75)
# Average distance line
lines(ml$resdist*0.0003048, ml$mwdist*0.0003048,
      lw=2)


