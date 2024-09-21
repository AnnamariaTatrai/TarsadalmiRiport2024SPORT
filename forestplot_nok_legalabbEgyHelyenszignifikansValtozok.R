# ezalapján dolgozom: https://cran.r-project.org/web/packages/forestplot/vignettes/forestplot.html
# ez segített hozzáadni egy vonalat az 1-nél:
# https://stackoverflow.com/questions/43164751/how-to-add-a-second-vertical-line-in-r-package-forestplot

library(forestplot)

base_data <- tibble::tibble(mean =  c(1.29,1.16,1.55,0.39,0.28,0.98,0.77,0.65,0.61,1.26,1.86,3.00,0.59,0.46),
                            lower = c(0.69,0.62,0.77,0.22,0.16,0.61,0.45,0.26,0.23,0.79,1.19,1.94,0.37,0.29),
                            upper = c(2.44,2.16,3.11,0.68,0.49,1.59,1.32,1.67,1.58,2.01,2.93,4.65,0.96,0.71),
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
                            OR = c("1.29","1.16","1.55","0.39","0.28","0.98","0.77",
                                   "0.65","0.61","1.26","1.86","3.00","0.59","0.46"))

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
  fp_add_header(study = c("Nők"),
                refkat = c("Ref. kat."),
                kat = c("Csoport"),
                OR = c("OR"))  
