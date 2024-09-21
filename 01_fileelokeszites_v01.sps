* Encoding: UTF-8.
get file 'c:\Panni\MasMunka\2024\Sportkutatas\data\TARKI\ujrasulyozott_original\sport_23_veg_jav_veg_sulyozott_veg_v3_suly22_kerdezoiinterjukkal.sav'.

* kidobom a kérdezői kérdőíveket .
sel if (sorszam < 9000) .


save outfile = 'c:\Panni\MasMunka\2024\Sportkutatas\data\TARKI\sajat_elemzes\sport_csakkerdezettek.sav'.
