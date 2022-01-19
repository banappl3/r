# Enthaelt die Deklaration der Funktion Basel.temperature.avg
# Durchschnittstemperatur in Basel im spezifizierten Zeitraum
Basel.temperature.avg <- function(
  data, # Datensatz
  start=min(data[, "time"]), # Anfang des Zeit-Intervalls
  end=max(data[, "time"]), # Ende des Zeit-Intervalls
  var="Temperature" # Mittelwert welcher Variable in data?
)
{
  # Teste, ob die Variablen im Datensatz existieren
  for(check in c("time", var))
  if(!any(names(data)==check))
    stop("Variable ", check, " nicht gefunden!")
  # Teste, ob start und end innerhalb des Beobachtungszeitraums liegen
  min.time <- min(data[, "time"])
  zufrueh <- start < min.time
  if(zufrueh)
  {
    warning("start=", start, 
      " liegt vor Beginn des Zeitraums (", min.time, ")")
    start <- min.time # Umsetzen von start
  }
  max.time <- max(data[, "time"])
  zuspaet <- end > max.time
  if(zuspaet)
  {
    warning("end=", end,
      " liegt nach Ende des Zeitraums (", max.time, ")")
    end <- max.time # Umsetzen von end
  }
  # Erstelle einen TRUE/FALSE-Vektor, der anzeigt,
  # welche Elemente zwischen start und end liegen:
  which <- data$time >= start & data$time <= end 
  # Teste, ob mindestens ein Element im Zeit-Intervall liegt
  if(sum(which)==0)
    stop("Kein Wert im Zeitintervall ", start, " bis ", end, "gefunden!")
  # Berechne den Mittelwert der Variable var im Intervall [start, end].
  M <- mean(data[, var][which])
  return(M)
}