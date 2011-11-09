#####################
# Generate flow map #
#####################

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

flows = '../data/nyc_cty_coords.csv'
shp <- '../data/nyc_cty.shp'

shp <- readShapeSpatial(shp, force_ring=TRUE)

# Trim extent of the bounding box
zoom <- 0.2
xlims <- (shp@bbox[3] - shp@bbox[1]) * zoom
cx <- -100000
xlims <- c(shp@bbox[1]+xlims+cx, shp@bbox[3]-xlims+cx)
ylims <- (shp@bbox[4] - shp@bbox[2]) * zoom
cy <- 45000
ylims <- c(shp@bbox[2]+ylims+cy, shp@bbox[4]-ylims+cy)

# Initial shape plot
plot(shp, col=border.col, border=bg.col, 
     lwd=0.05, main='Variable', bg=bg.col,
     xlim=xlims, ylim=ylims)
title(main='NYC Commuting Flows', cex.main=cexS)

# Plot flows
csv <- read.csv(flows, header=FALSE)
csv <- csv[csv$V1 != csv$V3, ] # Get rid of ii
total.flows <- csv$V5 + csv$V6
total.flows <- log(total.flows)

# Calculate shanon index and assign color to each flow consecuently
shanon <- diversity(matrix(c(csv$V5, csv$V6), ncol=2))
scols <- assign.colors(shanon)

alphas <- alpha.level(alpha.min, alpha.max, total.flows) 
lwidths <- alpha.level(width.min, width.max, total.flows)

# Main loop to plot flows
for(i in seq(length(scols))){
    co <- col2rgb(scols[[i]])
    s <- squeeze(0, 1, 0, 255, co[1])
    segments(csv$V1[i], csv$V2[i], csv$V3[i], csv$V4[i], 
    col=rgb(squeeze(0, 1, 0, 255, co[1]), 
            squeeze(0, 1, 0, 255, co[2]), 
            squeeze(0, 1, 0, 255, co[3]), 
         alpha = alphas[i]
         ),
         lwd = lwidths[i]
     )
}

# Create gradient and insert legend
sshanon <- sort(shanon)
sscols <- as.character(assign.colors(sshanon))
color.legend(299800, 315000, 415800, 325000, c('One way', 'Balanced'), sscols)

# Label for core
xys <- coordinates(shp)
manh <- xys[1, ]
points(manh[1], manh[2], cex=3, pch=13)

