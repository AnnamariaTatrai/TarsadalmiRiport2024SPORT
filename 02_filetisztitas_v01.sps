* Encoding: UTF-8.
get file = 'c:\Panni\MasMunka\2024\Sportkutatas\data\TARKI\sajat_elemzes\sport_csakkerdezettek.sav'.


* neme változóból numerikus .
autorecode neme /into= neme2 .

val lab neme2 
    1'férfi'
    2'nő' .
fre neme2.


* egyéb, de visszakódolható válaszok a hol sportol kérdés kapcsán .
if (a12_other = "4 unokával fog") a12_1=1 .

if (a12_other = "Bicikli úton") a12_11=1 .
if (a12_other = "Budai vár") a12_10=1 .
if (a12_other = "csónakház") a12_10=1 .
if (a12_other = "Hegyekben") a12_10=1 .
if (a12_other = "járda") a12_10=1 .
if (a12_other = "kerékpár-úton") a12_11=1 .
if (a12_other = "kertben") a12_10=1 .

if (a12_other = "Lovarda") a12_10=1 .
if (a12_other = "Margitsziget") a12_10=1 .

if (a12_other = "Rába folyó") a12_10=1 .


if (a12_other = "Szabadidő park") a12_10=1 .
if (a12_other = "Temetőben") a12_10=1 .
if (a12_other = "tornaterem") a12_8=1 .
if (a12_other = "Tornaterem") a12_8=1 .
if (a12_other = "Unokával játs") a12_1=1 .
if (a12_other = "uszoda") a12_4=1 .
if (a12_other = "vízpart") a12_10=1 .



save outfile  = 'c:\Panni\MasMunka\2024\Sportkutatas\data\TARKI\sajat_elemzes\sport_csakkerdezettek_tisztitott.sav'.



