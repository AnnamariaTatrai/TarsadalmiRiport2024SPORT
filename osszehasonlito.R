# ezalapján dolgozom: https://cran.r-project.org/web/packages/forestplot/vignettes/forestplot.html
# ez segített hozzáadni egy vonalat az 1-nél:
# https://stackoverflow.com/questions/43164751/how-to-add-a-second-vertical-line-in-r-package-forestplot

library(forestplot)

base_data <- tibble::tibble(mean  = c(2.03,1.86,1.81,3.00,0.43,0.59,0.38,0.49),
                            lower = c(1.13,1.19,1.03,1.94,0.21,0.37,0.20,0.29),
                            upper = c(3.63,2.93,3.17,4.65,0.90,0.96,0.74,0.71),
                            study = c("Sport iránti érdeklődés", "","","",
                                      "Szerette a testnevelés órákat", "","",""),
                            refkat = c("érdekli a sport", "érdekli a sport", "érdekli a sport", "érdekli a sport", 
                                       "(inkább) nem","(inkább) nem","(inkább) nem","(inkább) nem"),
                            kat = c("igen is, meg nem is","igen is, meg nem is","nem érdekel","nem érdekel",
                                    "igen is, meg nem is","igen is, meg nem is","(inkább) igen","(inkább) igen"),
                            nem = c("férfi","nő","férfi","nő","férfi","nő","férfi","nő"),
                            OR = c("2.03","1.86","1.81","3.00","0.43","0.59","0.38","0.49"))

base_data |>
  forestplot(labeltext = c(study, refkat, kat, nem ,OR),
             clip = c(0, 5.5),
             xlog = FALSE,
             boxsize=0.08,
             cex = 6,
             vertices=F,
             hrzl_lines=T,
             txt_gp = fpTxtGp(ticks=gpar(cex=0.9)),
             axes = gpar(cex = 1),
             grid = structure(c(1), 
                              gp = gpar(lty = 3, col = "black")))|>
  fp_set_style(box = "black",
               line = "black",
               summary = "black") |> 
  fp_add_header(study = c(""),
                refkat = c("Ref. kat."),
                kat = c("Csoport"),
                nem=c("Nem"),
                OR = c("OR"))  
