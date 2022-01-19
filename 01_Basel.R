# Datei einlesen:
x <- read.table("basel.txt", sep="", header=T, skip=27)

# Variable time erzeugen:
x$time <- x$Year + x$Month/12

# Liste der Monatskürzel
month <- c("Jan", "Feb", "Mrz", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dez")

# Monatskürzel mit Monatzahlen verknüpfen
x$month <- factor(month[x$Month], levels=month)

# Jahresmitteltemperaturen
temp.means <- aggregate(x["Temperature"], x["Year"], mean)

# lineares Modell
x$time.scaled <- x$time - min(x$time)
fit.lm <- lm(Temperature ~ time.scaled, data=x)

# Saisonmodell
fit.season <- nls(Temperature ~ a+b*time + amp*sin(2*pi*(Month-1-shift)/11), data=x, start=list(a=10, b=0.1, amp=0.1, shift=0.1))
summary(fit.season)

library(lattice)


