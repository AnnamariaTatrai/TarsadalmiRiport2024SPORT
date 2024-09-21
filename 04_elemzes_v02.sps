* Encoding: UTF-8.
new file.
* Encoding: UTF-8.
get file = 'c:\Panni\MasMunka\2024\Sportkutatas\data\TARKI\sajat_elemzes\sport_csakkerdezettek_tisztitott_valtozokkal_11.sav'.

*display labels. 

****** súlyozatlan lekérések .
*fre neme2 sulykor sulyisk sulytel.
*fre szubjanyagi3 a22 a26.
fre a2.
******* súlyozott lekérések .
weight by sulynkit .

weight by sulynkit.
fre sportTIP_TR_mozog .
cro kor6 by sportTIP_TR_mozog  /cells=row .


fre sportTIP_TR_mozogEleg.




cro  sportTIP_TR_mozogEleg by neme /cells=col.
cro  sportTIP_TR_mozogEleg by sulykor /cells=col.
cro  sportTIP_TR_mozogEleg by sulyisk /cells=col.
cro  sportTIP_TR_mozogEleg by sulytel /cells=col.
cro  sportTIP_TR_mozogEleg by szubjanyagi3 /cells=col.


** ordinal regression .
* https://statistics.laerd.com/spss-tutorials/ordinal-regression-using-spss-statistics.php .
DATASET DECLARE  plum.
OMS
  /SELECT TABLES
  /IF COMMANDS=['PLUM'] SUBTYPES=['Parameter Estimates']
  /DESTINATION FORMAT=SAV NUMBERED=TableNumber_
   OUTFILE='plum' VIEWER=YES.

PLUM sportTIPUJ BY SulyNem SulyIsk szubjanyagi3 with kor
  /CRITERIA=CIN(95) DELTA(0) LCONVERGE(0) MXITER(100) MXSTEP(5) PCONVERGE(1.0E-6) SINGULAR(1.0E-8)
  /LINK=LOGIT
  /PRINT=FIT PARAMETER SUMMARY TPARALLEL
  /SAVE=ESTPROB PREDCAT PCPROB ACPROB
 /test = sulyisk 1 0 -1;
              sulyisk 0 1 -1
 /test = szubjanyagi3 1 0 -1;
             szubjanyagi3 0 1 -1 .
              
fre sporttip .    
*** sportTIPUJ .
fre sportTIPUJ .

*cro sportTIPUJ by sporttip.

cro sulyisk by sportTIPUJ/cells=row .
cro sulykor by sportTIPUJ /cells=row.
cro neme2 by sportTIPUJ /cells=row.
cro sulytel by sportTIPUJ /cells=row.
cro szubjanyagi3 by sportTIPUJ /cells=row.

fre neme2 sulykor sulyisk sulytel.
fre szubjanyagi3 a22 a26.

* milyen az egészsége általában.
fre a22 /stat=mean. 


* mennyire elégedett a következőkkel: egészségi állapota .... sportolási lehetőségei .
fre  A45_1 A45_2 A45_3 A45_4 A45_5 A45_6 A45_7 .

* mennyit tehet az egészségéért .
fre a26.
* .
* milyen gyakran érezte .
fre  A32_1 A32_2 A32_3 A32_4 A32_5 A32_6 A32_7 A32_8 .

* milyen gyakran végezte szabadidejében. 
fre  A34_1 A34_2 A34_3 A34_4 A34_5 A34_6 A34_7 A34_8 A34_9 A34_10 A34_11 A34_12 /stat=mean .

* ha megváltoztathatná az időbeosztását .
fre   A35_1 A35_2 A35_3 A35_4 A35_5 A35_6 A35_7 A35_8 /stat=mean.

* milyen gyakran sportol Ön .
fre a2.

* hány éves korában mozgott Ön rendszeresen utoljára .
fre a7_5.

* véleménye szerint eleget sportol .
fre a16 .


*sporttip.
fre sporttip.

*covid és sport .
fre a21.

* mit sportol .
fre  A17_1 A17_2 A17_3 .

* horgászás .
fre a21b.


* mikor sportol .
fre a3.

* ha sportol, mennyit sportol.
fre a4.

* egyéb testmozgás .
fre a5 .
fre a6.

* megszakítás nélküli gyaloglás .

fre a8 a9.

fre a10.

* aktív közlekedés .

fre a15.


* egészsége háttéráltozókkal.
fre a22_2.

cro sulyisk by a22_2 /cells=row .
cro sulykor by a22_2 /cells=row.
cro neme2 by a22_2 /cells=row.
cro sulytel by a22_2 /cells=row.
cro szubjanyagi3 by a22_2 /cells=row.


* erőnlétével elégedett a 45_2-ben 4,5. 
fre a45_2_2.

cro sulyisk by a45_2_2 /cells=row .
cro sulykor by a45_2_2 /cells=row.
cro neme2 by a45_2_2 /cells=row.
cro sulytel by a45_2_2 /cells=row.
cro szubjanyagi3 by a45_2_2 /cells=row.



* külsejével elégedett a45_3ban 4-5.
fre a45_3_2.

cro sulyisk by a45_3_2 /cells=row .
cro sulykor by a45_3_2 /cells=row.
cro neme2 by a45_3_2 /cells=row.
cro sulytel by a45_3_2 /cells=row.
cro szubjanyagi3 by a45_3_2 /cells=row.



 * sokat vagy nagyon sokat tehet az egészsségéért  a26-ban 1,2.
fre a26_2.

cro sulyisk by a26_2 /cells=row .
cro sulykor by a26_2 /cells=row.
cro neme2 by a26_2 /cells=row.
cro sulytel by a26_2 /cells=row.
cro szubjanyagi3 by a26_2 /cells=row.


* szabadidejében hetente néhányszor mozgott  a34_8-ban 1,2.
fre a34_8_2.

cro sulyisk by a34_8_2 /cells=row .
cro sulykor by a34_8_2 /cells=row.
cro neme2 by a34_8_2 /cells=row.
cro sulytel by a34_8_2 /cells=row.
cro szubjanyagi3 by a34_8_2 /cells=row.


* szeretne többet mozogni a35_6 1,2 .
fre a35_6_2.

cro sulyisk by a35_6_2 /cells=row .
cro sulykor by a35_6_2 /cells=row.
cro neme2 by a35_6_2 /cells=row.
cro sulytel by a35_6_2 /cells=row.
cro szubjanyagi3 by a35_6_2 /cells=row.

* közlekedésre szánt időt nagyobb részt aktívan tölti a15-ben 3,4 .
fre a15_2.

cro sulyisk by a15_2 /cells=row .
cro sulykor by a15_2 /cells=row.
cro neme2 by a15_2 /cells=row.
cro sulytel by a15_2 /cells=row.
cro szubjanyagi3 by a15_2 /cells=row.


* hol zsokott Ön sportolni.
fre a12_1 to a12_other.

fre mozsport sporthol_otthon sporthol_kulter sporthol_efterem .
cro mozsport by sporthol_otthon  /cells=row count.
cro mozsport by sporthol_kulter  /cells=row count.
cro mozsport by sporthol_efterem /cells=row  count.


filter by mozsport.
cro sulyisk by sporthol_otthon /cells=row .
cro sulykor by sporthol_otthon /cells=row.
cro neme2 by sporthol_otthon /cells=row.
cro sulytel by sporthol_otthon /cells=row.
cro szubjanyagi3 by sporthol_otthon /cells=row.
filter off.
        
filter by mozsport.
cro sulyisk by sporthol_kulter /cells=row .
cro sulykor by sporthol_kulter /cells=row.
cro neme2 by sporthol_kulter /cells=row.
cro sulytel by sporthol_kulter /cells=row.
cro szubjanyagi3 by sporthol_kulter /cells=row.
filter off.
        
filter by mozsport.
cro sulyisk by sporthol_efterem /cells=row .
cro sulykor by sporthol_efterem /cells=row.
cro neme2 by sporthol_efterem /cells=row.
cro sulytel by sporthol_efterem /cells=row.
cro szubjanyagi3 by sporthol_efterem /cells=row.
filter off.


* környéken psortolási lehetőség.
fre a50_1 /stat=mean.
fre sportlehetoseg3.

cro sulyisk by sportlehetoseg3 /cells=row .
cro sulykor by sportlehetoseg3 /cells=row.
cro neme2 by sportlehetoseg3 /cells=row.
cro sulytel by sportlehetoseg3 /cells=row.
cro szubjanyagi3 by sportlehetoseg3 /cells=row.


* miért sportol 
fre  A46AA_1 A46AA_2 A46AA_3 A46AA_4 A46AA_5 A46AA_6 A46AA_7 A46AA_8 A46AA_9 A46AA_10 A46AA_11 A46AA_12 
    A46AA_13 A46AA_14 A46_88 a46_other .

fre a2.


fre  mot_egeszs mot_erosvekonyjolnfiatal mot_kikapcsszor mot_magabiztos mot_tarsasag 
    mot_versenykihivas mot_trendi /stat=mean.

cro sulyisk by mot_egeszs /cells=row .
cro sulykor by mot_egeszs /cells=row.
cro neme2 by mot_egeszs /cells=row.
cro sulytel by mot_egeszs /cells=row.
cro szubjanyagi3 by mot_egeszs /cells=row.


cro sulyisk by mot_erosvekonyjolnfiatal /cells=row .
cro sulykor by mot_erosvekonyjolnfiatal /cells=row.
cro neme2 by mot_erosvekonyjolnfiatal /cells=row.
cro sulytel by mot_erosvekonyjolnfiatal /cells=row.
cro szubjanyagi3 by mot_erosvekonyjolnfiatal /cells=row.


*FACTOR
  /VARIABLES A46AA_1 A46AA_2 A46AA_3 A46AA_4 A46AA_5 A46AA_6 A46AA_7 A46AA_8 A46AA_9 A46AA_10 
    A46AA_11 A46AA_12 A46AA_13 A46AA_14
  /MISSING LISTWISE 
  /ANALYSIS A46AA_1 A46AA_2 A46AA_3 A46AA_4 A46AA_5 A46AA_6 A46AA_7 A46AA_8 A46AA_9 A46AA_10 
    A46AA_11 A46AA_12 A46AA_13 A46AA_14
  /PRINT INITIAL CORRELATION KMO EXTRACTION
  /CRITERIA FACTORS(5) ITERATE(25)
  /EXTRACTION ML
  /ROTATION NOROTATE.


* egyesület csatlakozás .
fre a52 a53 /stat=mean.

fre a50_3.

* megélt akadályok: soha nem sportolók részéről .

filter by nemsportol.
fre  A47AA_1 A47AA_2 A47AA_3 A47AA_4 A47AA_5 A47AA_6 A47AA_7 A47AA_8 A47AA_9 A47AA_10 A47_88 a47_other .
filter off.

* megélt akadályok a ritkán sportolók körében.
filter by ritkansportol.
fre  A47AA_1 A47AA_2 A47AA_3 A47AA_4 A47AA_5 A47AA_6 A47AA_7 A47AA_8 A47AA_9 A47AA_10 A47_88 a47_other .
filter off.

* sportolás helyett mással töltöm a szabadidőmet.
fre a50_3.

* fre sportág.
fre  A17_1 A17_2 A17_3 .

DATASET ACTIVATE $DataSet.

fre sportTIP_TR_mozog.

cro sulyisk by sportTIP_TR_mozogEleg /cells=row .
cro sulykor by sportTIP_TR_mozogEleg /cells=row.
cro neme2 by sportTIP_TR_mozogEleg /cells=row.
cro sulytel by sportTIP_TR_mozogEleg /cells=row.
cro szubjanyagi3 by sportTIP_TR_mozogEleg /cells=row.

cro sulyisk by sportTIP_TR_mozog /cells=row .
cro sulykor by sportTIP_TR_mozog /cells=row.
cro neme2 by sportTIP_TR_mozog /cells=row.
cro sulytel by sportTIP_TR_mozog /cells=row.
cro szubjanyagi3 by sportTIP_TR_mozog /cells=row.

*** ellenőrzöm a teltip - aktivitás, teltip - sport, teltip - mozgás kapcsolatokat .
* aktivitásl .
cro sulytel by sportTIP_TR_mozog / cells = row.
* sporttal.
cro sulytel by a2 / cells = row.
* mozgással .
cro sulytel by a5 / cells = row.

**** iskolai végzettség- aktivitás, sport, mozgás kapcsolata .
cro sulyisk by sportTIP_TR_mozog / cells = row.
* sporttal.
cro sulyisk by a2 / cells = row.
* mozgással .
cro sulyisk by a5 / cells = row.


***** szubjanyagi .
cro szubjanyagi3 by sportTIP_TR_mozog / cells = row.
* sporttal.
cro szubjanyagi3 by a2 / cells = row.
* mozgással .
cro szubjanyagi3 by a5 / cells = row.


weight off.
fre sulytel sulyisk szubjanyagi3 sulykor.
