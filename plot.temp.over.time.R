# Die Funktion stellt die Temperatur ueber die Zeit dar.
# Rueckgabe: ein Grafik-Objekt.
plot.temp.over.time <- function(data, subset=Year > 2009, type="b")
{
  library(lattice)
  gr <- xyplot(Temperature ~ time, data=data,
    subset=subset, type=type)
  return(gr)
}
