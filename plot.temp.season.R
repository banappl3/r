# Enthaelt die Deklaration der Funktion plot.temp.season.
# Stellt eine Saison von Temperaturen grafisch dar,
# mehrere Jahre werden uebereinandergelagert.
# Rueckgabe: grafisches Objekt.
plot.temp.season <- function(data)
{
  library(lattice)
  gr <- xyplot(Temperature ~ Month, data=data, 
  type="b", groups=Year)
  return(gr)
}