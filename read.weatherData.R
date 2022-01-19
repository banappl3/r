# Daten aus Datei einlesen und vorbereiten:
read.weatherData <- function(
  file, # Dateiname, z.B. "basel.txt"
  sep="", # Feld-Separator der Datei
  header=TRUE, # Kopfzeile mit Variablennamen in der Datei zeigen?
  skip.lines=27 # Zahl der Textzeilen, bevor die Daten beginnen
)
{
  # Testen, ob die Datei existiert
  if(!file.exists(file))
    stop("Datei ", file, " nicht gefunden!")
  # Datei einlesen
  x <- read.table(file, sep="", header=header, 
    skip=skip.lines)
  # time-Variable einfuegen
  x$time <- x$Year + x$Month/12
  # Monatsnamen einfuegen
  month <- c("Jan", "Feb", "Mrz", "Apr", 
    "Mai", "Jun", "Jul", "Aug", "Sep", "Oct", 
    "Nov", "Dez")
  x$month <- factor(month[x$Month], levels=month)
  # Daten zurueckgeben
  return(x)
}