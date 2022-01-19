x$fit.trend <- fitted(fit.lm)
x$fit.season <- fitted(fit.season)

# Neues Objekt mit Daten ab 2006:
x2006 <- x[x$Year >= 2006, ] 
library(lattice)

# Abweichend vom Code im Heft wird die Grafik als Objekt gr gespeichert
gr <- xyplot(Temperature ~ time, 
  data=x2006, 
  xlab="Jahr",
  ylab="Temperatur (Grad Celsius)",
  fit1=x2006$fit.season,
  fit2=x2006$fit.trend,

  # Funktion zum Zeichnen der Daten
  panel=function(x, y, ..., fit1, fit2) 
  {
    # Gitternetz
    L <- current.panel.limits() 
      # Grenzen der aktuellen Achsen
    panel.abline(v=pretty(L$x), 
      col="lightgray")
    panel.abline(h=pretty(L$y), 
      col="lightgray")

    # Daten plotten
    panel.xyplot(x, y, ...)

    # Fits als Linien
    panel.xyplot(x, fit1, type="l", 
      col="red", lwd=2)
    panel.xyplot(x, fit2, type="l", 
      col="darkgreen", lwd=3)
  }
)

# Ausgabe der Grafik auf dem Bildschirm:
print(gr)

# Export der Grafik als Datei:
pdf("grafik.pdf")
print(gr)
dev.off()