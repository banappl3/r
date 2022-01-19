# Hilfsfunktion, um eine Grafik als Datei zu speichern.
# Achtung: Bei manchen Grafikformaten wird die Groesse in Zoll angegeben. 
graph2file <- function(
  graph, # Grafik-Objekt
  file, # Datei fuer Ausgabe
  format="pdf", # "pdf" oder "wmf". Default "pdf"
  width=20, # Breite in cm
  height=12 # Hoehe in cm
)
{
  # Testen, ob eine Datei angegeben wurde
  if(missing(file))
    stop("Keine Datei spezifiziert! ")
  # File-Extension anhaengen
  file <- paste(file, format, sep=".")
  # Meldung auf Bildschirm (stdout)
  cat("Grafik-Ausgabe auf Datei ", file, ".\n", sep="")
  if(format=="pdf")
    pdf(file, width=width/2.54, height=height/2.54)
  else
    if(format=="wmf")
      win.metafile(file, width=width/2.54, height=height/2.54)
    else
      stop("Unbekanntes Format: ", format)
  on.exit(dev.off()) # Datei schliessen bei Verlassen der Funktion,
  # auch wenn im folgenden Code noch ein Crash passiert.
  print(graph) # Ausgabe auf das aktuelle Device, die Datei.
  return(invisible()) # keine Rueckgabe
}