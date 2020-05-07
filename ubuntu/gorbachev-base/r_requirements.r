old <- getOption("defaultPackages"); r <- getOption("repos")
r["CRAN"] <- "http://cran.stat.auckland.ac.nz"
options(defaultPackages = c(old, "MASS"), repos = r, warn=2)

# packages ‘grid’, ‘genoud’, ‘tools’, ‘utils’ are not available (for R version 3.4.2)

packages <- c(
    "shapefiles", "sp", "lattice", "RColorBrewer",
    "maptools", "RPostgreSQL", "knitr", "rjson", "pander", "tidyverse",
    "tables", "data.table", "gridExtra", "rjags", "R2jags", "reshape2",
    "mapproj", "cplm", "lme4", 'xtable', 'plyr', 'scales',
    'ggmap', 'Cairo', 'maps', 'Matching', 'BenfordTests', 'rgenoud',
    'broom', 'cowplot', 'MASS', 'gridBase', 'pryr', 'proto',
    'beanplot', 'mapdata', 'rpart', 'caret', 'openxlsx', 'readxl', 'GGally', 'gam',
    'mgcv', 'geosphere', 'dbplyr', 'timeline', 'ggforce', 'CheckDigit', 'tinytex',
    'kableExtra', 'fuzzyjoin','lunar','gamlss','glmmTMB','PBSmapping','colorRamps',
    'rstan','brms','patchwork','tidybayes','Rcpp','ggpubr', 'rgdal','party', 'extrafont','viridis','english','coda','runjags',
    'janitor','bestglm','DHARMa','MuMIn','arm','ggrepel','truncdist','sf','fields','raster','glm2','sampling','effects', 'collapse')

update.packages(ask=F)

existing <- tryCatch({
    library()$results[, 'Package']
}, error = function (x) {
    c()
})

pkgs2install <- setdiff(packages, existing)
message(sprintf('Installing packages: %s', paste(pkgs2install, collapse=', ')))


old_foreign <- "https://cran.r-project.org/src/contrib/Archive/foreign/foreign_0.8-77.tar.gz"
install.packages(old_foreign, repos=NULL, type="source")

install.packages(pkgs2install)

## Start with older versions in case they are dependencies of the newer ones
old_rgeos <- "https://cran.r-project.org/src/contrib/Archive/rgeos/rgeos_0.3-28.tar.gz"
install.packages(old_rgeos, repos=NULL, type="source")
