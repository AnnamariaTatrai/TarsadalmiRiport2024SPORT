# ezalapján dolgozom: https://cran.r-project.org/web/packages/forestplot/vignettes/forestplot.html
# ez segített hozzáadni egy vonalat az 1-nél:
# https://stackoverflow.com/questions/43164751/how-to-add-a-second-vertical-line-in-r-package-forestplot

library(forestplot)

base_data <- tibble::tibble(mean =  c(1.45,2.72,3.86,0.59,0.93,0.47,0.53,0.41,0.22,2.28,2.03,1.81,0.43,0.38),
                            lower = c(0.62,1.20,1.60,0.27,0.45,0.25,0.25,0.12,0.06,1.21,1.13,1.03,0.21,0.20),
                            upper = c(3.41,6.19,9.32,1.29,1.92,0.94,1.13,1.35,0.74,4.31,3.63,3.17,0.90,0.74),
                            study = c("Kor", "","", 
                                      "Egészségi állapot", "", 
                                      "Településnagyság","",
                                      "Anyagi helyzet","",
                                      "Mennyit tehet egészségéért",
                                      "Sport iránti érdeklődés", "",
                                      "Szerette a testnevelés órákat", ""),
                            refkat = c("18-29 éves","18-29 éves","18-29 éves",
                                       "(inkább) elégedetlen","(inkább) elégedetlen",
                                       "Budapest","Budapest",
                                       "anyagi gondok","anyagi gondok",
                                       "(nagyon) sokat",
                                       "érdekli a sport", "érdekli a sport",
                                       "(inkább) nem","(inkább) nem"),
                            kat = c("30-44 év","45-59 év","60+ év",
                                    "igen is, meg nem is","(inkább) igen",
                                    "város","falu",
                                    "éppen hogy kijönnek a jövdelemből","beosztással kijönnek/jól élnek",
                                    "keveset / semmit",
                                    "igen is, meg nem is","nem érdekli a sport",
                                    "igen is, meg nem is","(inkább) igen"),
                            OR = c("1.45","2.72","3.86","0.59","0.93","0.47","0.53",
                                   "0.41","0.22","2.28","2.03","1.81","0.43","0.38"))

base_data |>
  forestplot(labeltext = c(study, refkat, kat, OR),
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
  fp_add_header(study = c("Férfiak"),
                refkat = c("Ref. kat."),
                kat = c("Csoport"),
                OR = c("OR"))  
