
formatPlot <- function(plot) {
  p <- plot + opts(plot.title = theme_text(size = 23))
  p <- p + {
    opts(plot.title = theme_text(size = 23),
         axis.title.x=theme_text(size=16, vjust=-0.05),
         axis.title.y=theme_text(size=16),
         legend.title=theme_text(size=14))         
  }
  p <- p + scale_y_continuous(name="Price", labels=c("200k", "400k", "600k", "800k"))
  
  print(p)
}
