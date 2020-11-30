library(readxl)
X41587_2020_603_MOESM2_ESM <- read_excel("/mnt/Data/Documents/SRB/NewSpeciesDescription/SegataGenomes/41587_2020_603_MOESM2_ESM.xlsx", 
                            sheet="ST1")
View(X41587_2020_603_MOESM2_ESM)

alm = X41587_2020_603_MOESM2_ESM

alm$Sample accession
alm<-subset (alm, `Genome type` =="MAG")

library (dplyr)
alm <-tibble (alm, tibble.print_max = Inf)
alm %>% distinct (`Study accession`)

######by sample accession, e.g. per stool
Distribution=distinct(alm, across(contains(c("Sample accession", "Country", "Continent"))))

gf <-group_by(Distribution, Continent)
group_data(gf) #this information is highlighted in the paper

# by country
gf <-group_by(Distribution, Country) #this information is highlighted in the paper
#group_data(gf)

gf %>%count (Country) %>% print(n=40)

######by recovered genome, consider also isolates
alm = X41587_2020_603_MOESM2_ESM
Distribution=distinct(alm, across(contains(c("Genome", "Country", "Continent"))))

gf <-group_by(Distribution, Continent)
gf <-group_by(Distribution, `Genome type`)
group_data(gf)
