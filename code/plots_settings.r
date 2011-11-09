####################################################
# Main settings of the plots and utility functions #
####################################################

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

library(shape) # Arrows
library(plotrix) # Color legend
library(vegan) # Shannon index
library(maptools) # Shape handling
library(RColorBrewer)

squeeze <- function(targetMin, targetMax, sourceMin, sourceMax, val){
    diffF <- sourceMax - sourceMin
    diffA <- targetMax - targetMin

    alphas <- targetMin + (diffA / diffF) * (val - sourceMin)
    alphas
}

alpha.level <- function(minA, maxA, flows){
    # Get proportion of transparency (alpha)
    flows <- flows**2
    minF  <- min(flows)
    maxF  <- max(flows)
    diffF <- maxF - minF
    diffA <- maxA - minA

    alphas <- minA + (diffA / diffF) * (flows - minF)
    alphas
}

col.level <- function(flows){
    # Return colors from a colorRamp
    minF  <- min(flows)
    maxF  <- max(flows)
    diffF <- maxF - minF
    ceroUno <- (flows - minF) / diffF
    ceroUno
}

paleta <- brewer.pal(3, 'BrBG')

oneway <- 'chocolate'
balanced <- paleta[3]
wheel <- colorRampPalette(c(oneway, balanced)) #1st. color one-way
                                               #2nd. color balanced

# Boundaries
border.col <- rgb(0.894, 0.89, 0.859)
bg.col <- 'white'

assign.colors <- function(angles){
    paleta <- wheel(length(unique(angles)))
    uas <- sort(unique(angles))
    d <- vector(mode='list', length = length(uas))
    names(d) <- uas
    for(i in seq(length(paleta))){
        d[i] <- paleta[i]
    }
    final <- seq(length(angles))
    for(i in final){
        final[i] <- d[paste(angles[i])]
    }
    final
}

distance <- function(x1, y1, x2, y2){
    (x1 - x2)**2 + (y1 - y2)**2
}

# Font size
cexS = 2

# Transparency and width
alpha.min <- 0.001
alpha.min <- 0.1
alpha.max <- 0.75

width.min <- 0.1
width.max <- 5
