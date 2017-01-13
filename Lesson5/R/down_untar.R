
download.file("https://www.dropbox.com/s/i1ylsft80ox6a32/LC81970242014109-SC20141230042441.tar.gz?dl=1",'LC8.tar.gz')
download.file("https://www.dropbox.com/s/akb9oyye3ee92h3/LT51980241990098-SC20150107121947.tar.gz?dl=1",'LT6.tar.gz')
untar('LC8.tar.gz',exdir = paste0(getwd(),'/data/LC8'))
untar('LT6.tar.gz',exdir = paste0(getwd(),'/data/LT6'))
file.remove ('LC8.tar.gz')
file.remove ('LT6.tar.gz')
