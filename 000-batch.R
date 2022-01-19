# Liest die Deklarationen von Funktionen ein und führt sie aus.
rm(list=ls()) # Alle vorhanden Objekte loeschen (!)

# Konfiguration einlesen
source("config.R")

# Tools einlesen
source("graph2file.R")
source("read.weatherData.R")
x <- read.weatherData(file=config$data.file)
source("Basel.temperature.avg.R")
cat("Temperaturen in Basel:\n")
print(Basel.temperature.avg(data=x, start=1860, end=1900))
print(Basel.temperature.avg(data=x, start=1900, end=1950))

# Temperaturkurve ueber die gesamte Zeit.
source("plot.temp.over.time.R")
gr <- plot.temp.over.time(data=x, subset=x$Year >= min(x$Year))
graph2file(gr, file="gr.temp.over.time", format=config$graph.format) 

# Ueberlagerte Jahreskurven
source("plot.temp.season.R")
cat("Jahreskurven der Temperaturen in Basel:\n")
gr <- plot.temp.season(data=x)
graph2file(gr, file="gr.temp.seasons", format=config$graph.format) 

# The End.
rm(gr)
cat("Alle Kommandos ausgefuehrt!\n")
