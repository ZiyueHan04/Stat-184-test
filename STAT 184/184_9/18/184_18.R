oreoData<-read.table(
  file="https://raw.github.com/neilhatfield/STAT461/main/dataFiles/classDemoOreo.dat",
  header=TRUE,
  sep=","
)

str(oreoData)
View(oreoData)
oreoData$Filling.Mass
oreoData$Type
oreoData$Filling.Mass[4]

oreoData[1:3,2]
#Returns the first three case values for the second variable

oreoData[,2]
#return all cases type value, the same as oreoData$Type

oreoData[27:33, ]
#Return a data frame consisting of just cases 27 through 33, all columns

oreoData[60,"Tpye"]<-"Mega"
#fix typos

#Tidy Data
#Rule 1:each row represents and individual case,for the given context and all fo their value
#Rule 2:each column has a name and houses the values of a particular attribute across all cases