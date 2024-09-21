* Encoding: UTF-8.
new file.
get file  = 'c:\Panni\MasMunka\2024\Sportkutatas\data\TARKI\sajat_elemzes\sport_csakkerdezettek_tisztitott.sav'.

fre a2 .
fre a4.
fre a5 .
fre a6.
fre a34_8.
* jobb áttekintés céljából a4 és 6-ban a sysmiseket (nem vonatkozott rájuk) átkódolom -6-ra  .
recode a4 a6 (sysmis=-6) .
fre a4 a6 .
add val lab a4 a6 -6'Nem vonatkozik rá' .
fre a4 a6 .

**** áttekintő táblázathoz .
cro a2 by a4 .
cro a5 by a6 .


* mindenkinél 0-ról indulunk .
compute sportTIP_TR_mozog = 0 .
var lab sportTIP_TR_mozog 'Aktivitás négy fokozatú skálán, mozgás és sport gyakoriságát ill. időtartamát  is figyelembe véve ' .
val lab sportTIP_TR_mozog 
    1'Inaktív:  ritkábban mint havonta, vagy sosem sportol, havonta maximum 3-szor 30 percet mozog' 
    2'Mérsékelten aktív: ritkábban mint hetente sportol, vagy hetente 60 percnél kevesebbet mozog '
    3'Aktív: legalább hetente 30 percet sportol, vagy hetente legalább 60 percet mozog  '    
    4'Nagyon aktív: hetente legalább háromszor, alkalmanként legalább egy órán át mozog/sportol ' .
fre sportTIP_TR_mozog .

****** NAGYON AKTÍVAK ******** .
* ha az a2 szerint legalább hetente háromszor SPORTOL alkalmaknént min 60 percet: biztosan nagyon aktív: 
* egy órás határral 93 eset érkezik, ennél maradtam).
if (a2<3 & a4>2 & a4<9 ) sportTIP_TR_mozog = 4 .
* ha az a5 szerint legalább hetente háromszor MOZOG alkalmanként min 60 percet: valószínűleg nagyon aktív: 
* egy órással határral 103 eset érkezik, ennél maradtam) .
if (a5<3  & a6>2 & a6<9) sportTIP_TR_mozog = 4 .
* validálásként összenézem a 34h-val .
*cro sportTIP_TR_mozog  by a34_8 .
* van pár ellentmondó eset, de legalább nem tömeges .
*cro sportTIP_TR_mozog  by a7 .
* eredmény 60 percnél kisebb agybaj, emellett döntöttem .
fre sportTIP_TR_mozog.

******* AKTÍVAK *********** .
* csak az eddig besorolatlanokat engedem besorolni .

* ha hetente 1-2 alkalommal SPORTOL legalább 60 percet   biztosan aktív .
* 162 eset érkezik így  .
if (sportTIP_TR_mozog =0 & a2=3 & a4>1 & a4<9 ) sportTIP_TR_mozog = 3 .
* ha hetente minimum 3-szor SPORTOL, de nem éri el a 60 percet: biztosan aktív .
* 76 eset érkezik így , összesen már 238-an a hármasban  .
if (sportTIP_TR_mozog =0 & a2<3 & a4<3 ) sportTIP_TR_mozog = 3 .

* ha hetente minimum 3-szor MOZOG, 30-60 percet, valószínűleg aktív .
if (sportTIP_TR_mozog =0 & a5<3 & a6=2) sportTIP_TR_mozog = 3 .
* ha hetente 5-ször MOZOG 30 percnél kevesebbet (vagy ismeretlen időtartamot), valószínűleg aktív .
if (sportTIP_TR_mozog =0 & a5=1 & a6=1) sportTIP_TR_mozog = 3 .
if (sportTIP_TR_mozog =0 & a5=1 & a6=9) sportTIP_TR_mozog = 3 .
* ha hetente 1-2 alkommal MOZOG legalább 60 percet, valószínűleg aktív .
if (sportTIP_TR_mozog =0 & a5=3 & a6>2 & a6<9 ) sportTIP_TR_mozog = 3 .

fre sportTIP_TR_mozog.


************** MÉRSÉKELTEN AKTÍVAK ***************************** .
* hetente 1-2-szer SPORTOL, de 30 percnél kevesebbet (vagy ismeretlen időtartamot.
if (sportTIP_TR_mozog =0 & a2=3 & a4=1)  sportTIP_TR_mozog = 2 .
if (sportTIP_TR_mozog =0 & a2=3 & a4=9)  sportTIP_TR_mozog = 2 .
* havonta 1-3szor SPORTOL (bármilyen időtartamban) .
if (sportTIP_TR_mozog =0 & a2=4 )  sportTIP_TR_mozog = 2 .

* hetente 3-4-szer mozog, de kevesebb mint 30 percet .
if (sportTIP_TR_mozog=0 & a5=2 & a6=1)   sportTIP_TR_mozog = 2 .
* hetente 1-2 alkalommal MOZOG, d ekevesebb mint 60 percet .
if (sportTIP_TR_mozog=0 & a5=3 & a6<3)   sportTIP_TR_mozog = 2 .
* ritkábban mint hetente mozog, de legalább alkalmanként 30 percet  .
if (sportTIP_TR_mozog=0 & a4=3 & a6>1)   sportTIP_TR_mozog = 2 .

fre sportTIP_TR_mozog.


*********************** INAKTÍV ************************************ .
* ha ritkábban mint havonta vagy soha nem sportol,  inaktív .
if (sportTIP_TR_mozog =0 & a2= 5)   sportTIP_TR_mozog = 1 .
if (sportTIP_TR_mozog =0 & a2= 6)   sportTIP_TR_mozog = 1 .
* ha sosem mozog, biztosan inktív: 3 újabb eset .
if (sportTIP_TR_mozog =0 & a5= 6)   sportTIP_TR_mozog = 1 .
* ha ritkábbn mint havonat mozog, biztosan inaktív .
if (sportTIP_TR_mozog =0 & a5= 5)   sportTIP_TR_mozog = 1 .




fre sportTIP_TR_mozog. 



***** elégnek tartja-e .
fre a16 .
* 43 NT miatt próbálok a hasonló változókból valamit rügyezni .
cro sportTIP_TR_mozog by a16 .
cro a35_6 by a16.
cro a36 by a16 .

compute sportTIP_TR_eleg = 0 .
var lab sportTIP_TR_eleg 'Véleménye szerint eleget mozog / sportol' .
val lab sportTIP_TR_eleg
     1'Saját véleménye szerint eleget mozog/sportol'
      2'Saját véleménye szerint nem mozog/sportol eleget' .

* elégnek tartja .
if (a16=1)  sportTIP_TR_eleg = 1 .
* nem tartja elégnek .
if (a16=2)  sportTIP_TR_eleg = 2 .
* A16-ban nem tudját válaszolókat az a36_6 alapján soroljuk be .
* ha változó időbeosztás mellett is ugyanennyit vagy kevesebbet  sportolna, akkor elégedett .
if (a16=9 & a35_6>2 )  sportTIP_TR_eleg = 1 .
* ha változó időbeosztás mellett többet sportolna, akkor elégedetlen .
if (a16=9 & a35_6=2 )  sportTIP_TR_eleg = 2 .

fre  sportTIP_TR_eleg .

******* aktivitás és elégedettség együtt.
cro sportTIP_TR_mozog by sportTIP_TR_eleg 
    / cells= count total .

compute sportTIP_TR_mozogEleg = sportTIP_TR_mozog*10 + sportTIP_TR_eleg .
recode sportTIP_TR_mozogEleg (41 42 = 40)  .
var lab sportTIP_TR_mozogEleg 'Aktivitás és az aktivitással való elégedettség' .
val lab sportTIP_TR_MozogEleg
    40'Nagyon aktív'
    32'Aktív, de aktivitásával elégedetlen' 
    31'Aktív, aktivitásával elégedett' 
    21'Mérsékelten aktív, aktivitásával elégedett'
    22'Mérsékelten aktív, aktivitásával elégedetlen'
    12'Inaktív, de úgy érzi, többet kellene mozognia'
    11'Inaktív és nem érzi szükségét több mozgásnak' .

fre sportTIP_TR_MozogEleg. 

fre szubjanyagi .
recode szubjanyagi (1 2 =1) (3=2) (4 5=3) into szubjanyagi3 .
var lab szubjanyagi3 'Szubjektív anyagi helyzet 3 kategória' .
val lab szubjanyagi3 1'anyagi gondok' 2'éppen hogy kijönnek a jövedelmükből' 3'beosztással kijönnek vagy jól élnek' .
fre szubjanyagi3 .

* kor .
fre szulev.
mis val szulev (8) .
compute kor = ev - szulev.
fre kor.

recode kor
     (18 thru 25=1)
     (26 thru 35=2)
     (36 thru 45=3)
     (46 thru 55=4)
     (56 thru 65=5)
     (66 thru 75=6)
     (76 thru hi=7) 
      into kor7a .
fre kor7a.

recode kor
     (18 thru 29=1)
     (30 thru 39=2)
     (40 thru 49=3)
     (50 thru 59=4)
     (60 thru 69=5)
     (70 thru hi=7) 
      into kor6 .
fre kor6.
val lab kor6
    1'18-29 éves'
    2'30-39 éves'
    3'40-49 éves'
    4'50-59 éves'
    5'60-69 éves'
    6'70+'



* milyen gyakran végezte szabadidejében. 
mis val  A34_1 A34_2 A34_3 A34_4 A34_5 A34_6 A34_7 A34_8 A34_9 A34_10 A34_11 A34_12  (9).

* ha megváltoztathatná az időbeosztását .

mis val  A35_1 A35_2 A35_3 A35_4 A35_5 A35_6 A35_7 A35_8  (9) .

* hány évesen mozgott utoljára rendszeresen .
recode a7 (888=1) (889=1) (999=9) (777=7) (0 thru 18 = 5) (19 thru 30 =4) (31 thru 60 =3) (61 thru 80=2)  into a7_5 .
val lab a7_5 
    1'jelenleg is rendszeresen mozog' 
    2'61-80 éves koráig'
    3'31-60 éves koráig'
    4' 19-30 éves koráig'
    5'maximum 18 éves koráig'
    7 'soha nem mozgott rendszeresen'
    9'nem tudja' .
fre a7 a7_5 .


* rendszeres-e, elég-e tipológia.
compute sportTIP = 0 .
if (a2<4 and a16=1) sportTIP= 1 .
if (a2<4 and a16=2) sportTIP= 2 .
if (a2=4 and a16=1) sportTIP=3 .
if (a2=5 and a16=1) sportTIP=3 .
if (a2=4 and a16=2) sportTIP=4 .
if (a2=5 and a16=2) sportTIP=4 .
if (a2=6 and a16=1) sportTIP=5 .
if (a2=6 and a16=2) sportTIP=6 .
if (sporttip= 0) sporttip= 9 .

val lab sportTIP 
    1'legalább hetente mozog és elégnek érzi'
    2'legalább hetente mozog, de elégedetlen'
    3'ritkán mozog, és elégnek érzi'
    4'ritkán mozog, de elégedetlen'
    5'sosem mozog és elégnek érzi'
    6'sosem mozog, de elégedetlen' 
    9'bizonytalan'.

fre sporttip.

temp.
sel if (sporttip=0).
list sorszam sporttip a2 a16.

mis val a8 a9 (99) .

* milyen az egészsége általában.
fre a22.

compute a22_2 = 0.
if (a22=4) a22_2 =1 .
if (a22=5) a22_2 =1 .
var lab a22_2 'Jó az egészsége' .
val lab a22_2 1'igen' 0'nem' .
fre a22_2 .


* erőnlétével elégedett a 45_2-ben 4,5. 
fre a45_2 .
compute a45_2_2 = 0.
if (a45_2=4) a45_2_2 =1 .
if (a45_2=5) a45_2_2 =1 .
var lab a45_2_2 'Elégedett az erőnlétével' .
val lab a45_2_2 1'igen' 0'nem' .
fre a45_2_2 .

* külsejével elégedett a45_3ban 4-5.
fre a45_3 .
compute a45_3_2 = 0.
if (a45_3=4) a45_3_2 =1 .
if (a45_3=5) a45_3_2 =1 .
var lab a45_3_2 'Elégedett a külsejével' .
val lab a45_3_2 1'igen' 0'nem' .
fre a45_3_2 .

 * sokat vagy nagyon sokat tehet az egészsségéért  a26-ban 1,2.
fre a26 .
compute a26_2 = 0.
if (a26=1) a26_2 =1 .
if (a26=2) a26_2 =1 .
var lab a26_2 'Sokat tehet az egészsségéért' .
val lab a26_2 1'igen' 0'nem' .
fre a26_2 .


* szabadidejében hetente néhányszor mozgott  a34_8-ban 1,2.
fre a34_8 .
compute a34_8_2 = 0.
if (a34_8=1) a34_8_2 =1 .
if (a34_8=2) a34_8_2 =1 .
var lab a34_8_2 'Szabadidejében hetente mozog' .
val lab a34_8_2 1'igen' 0'nem' .
fre a34_8_2 .

* szeretne többet mozogni a35_6 1,2 .
fre a35_6 .
compute a35_6_2 = 0.
if (a35_6=1) a35_6_2 =1 .
if (a35_6=2) a35_6_2 =1 .
var lab a35_6_2 'Szeretne többet mozogni' .
val lab a35_6_2 1'igen' 0'nem' .
fre a35_6_2 .

* közlekedésre szánt időt nagyobb részt aktívan tölti a15-ben 3,4 .
fre a15 .
compute a15_2 = 0.
if (a15=3) a15_2 =1 .
if (a15=4) a15_2 =1 .
var lab a15_2 'Közlekedésre szánt időt aktívan tölti' .
val lab a15_2 1'igen' 0'nem' .
fre a15_2 .

* sportol vagy mozog .
fre a2 a5.
compute mozsport = 0 .
if (a2 < 6 or a5 < 6 )  mozsport =1 .
var lab  mozsport 'Mozog vagy sportol' .
val lab  mozsport  1'igen' 0'nem' .
fre  mozsport .


* hol sportol.
mis val a12_1 a12_2 a12_3 a12_4 a12_5 a12_6 a12_7 a12_8 a12_9 a12_10 a12_11 a12_88  (9).
* fő kategóriák: otthon, szabadban,edzőterem-fitnessterem.
* szabadban, útközben, kültéren, sportpályán .
compute sporthol_otthon = 0.
compute sporthol_kulter = 0.
compute sporthol_efterem = 0 .
if (a12_1 =1) sporthol_otthon = 1.
if (a12_10 =1) sporthol_kulter = 1 .
if (a12_11 =1) sporthol_kulter = 1 .
if (a12_3 =1) sporthol_kulter = 1 .
if (a12_6 =1) sporthol_efterem = 1.
if (a12_7 =1) sporthol_efterem = 1.
var lab sporthol_otthon 'Otthon sportol' .
var lab sporthol_kulter 'Kültéren sportol' .
var lab sporthol_efterem 'Edzőteremben vagy fitnessközpontbna sportol' .

val lab sporthol_otthon sporthol_kulter sporthol_efterem 1'igen' 0'nem' .

fre sporthol_otthon sporthol_kulter sporthol_efterem .

mis val a50_1 (9) .

recode a50_1 (5 4 = 1) (9 3 = 2) (1 2 = 3)  into sportlehetoseg3 .
var lab sportlehetoseg3 'A környéken, ahol élek, elegendő lehetőség van testmozgásra, sportolásra, fizikai aktivitásra' .
val lab sportlehetoseg3 1 'igen' 2'bizonytalan' 3'nem' .


* miért sportol .
mis val A46AA_1 A46AA_2 A46AA_3 A46AA_4 A46AA_5 A46AA_6 A46AA_7 A46AA_8 A46AA_9 A46AA_10 A46AA_11 A46AA_12 
    A46AA_13 A46AA_14 A46_88 (9).

* motivációk .
if (a2<6)                mot_egeszs = 0 .
if (a46aa_1 = 1 or a46aa_10=1) mot_egeszs = 1 .

if (a2<6)                mot_erosvekonyjolnfiatal = 0 .
if (a46aa_2=1  or a46aa_11=1 or a46aa_9=1 or a46aa_3=1 ) mot_erosvekonyjolnfiatal = 1 .

if (a2<6)                mot_kikapcsszor = 0 .
if (a46aa_4=1 or a46aa_5=1) mot_kikapcsszor = 1 .

if (a2<6)                mot_magabiztos = 0 .
if (a46aa_12=1)  mot_magabiztos = 1 .

if (a2<6)                mot_tarsasag = 0 .
if (a46aa_6=1 or a46aa_7=1) mot_tarsasag = 1 .

if (a2<6)                mot_versenykihivas = 0 .
if (a46aa_13=1 or a46aa_14=1) mot_versenykihivas = 1 .

if (a2<6)                mot_trendi = 0 .
if (a46aa_8 = 1 ) mot_trendi = 1 .

var lab mot_egeszs 'Sportolásban az motiválja, hgoy egészségesebb legyen' .
var lab mot_erosvekonyjolnfiatal 'Sportolásban ezek motiválják: erős, vékony, fiatalos legyen, jól nézzen ki' .
var lab mot_magabiztos 'Sportolásban az motiválja, hogy magabiztos legyen' .
var lab mot_tarsasag 'Sportolásban a társaság motiválja' .
var lab mot_versenykihivas 'Sportolásban a versenyhelyzet, kihívás motiválja' .
var lab mot_trendi 'Sportolásban az motiválja, hogy trendi legyen' .

val lab  mot_egeszs mot_erosvekonyjolnfiatal mot_kikapcsszor mot_magabiztos mot_tarsasag 
    mot_versenykihivas mot_trendi 1'igen' 0'nem' .

* sportegyesület csatlakozás.
mis val a52 a53 (9) .

compute nemsportol = 0 .
if (a2=6) nemsportol = 1.

compute ritkansportol = 0 .
if (a2=4 or a3=5) ritkansportol = 1.

temp.
sel if (a47_other ne "") .
list Sorszam  A47AA_7 A47AA_9 A47_other .


fre a2 a16 a26 a36 a35_6 a50_2 a50_3  a53 .

* ellenőrzés .
cro a35_6 by a16 .

* új tipológia szándék és társai .
* amiből főzünk .
* a2: .milyen gyakran sportol ön: 1-3: laglább hetente
* a16: 16.	Véleménye szerint Ön eleget mozog, sportol?
* a35_6: képzelje el hogy megváltoztathatná időbeosztását: testmozgással sporttal 3 ugyanannyit mint most 
* a50_2: A testmozgás, a sport nem igazán érdekel
* a50_3: sportolás helyett mással töltöm a szabadidőmet .
* a53: csatlakozna-e sportolói közösséghez

* a36: 36.	Mennyire tartja fontosnak, hogy hétköznapokon is mozogjon?
* a26: mennyit tehet az egyészségéért .
*fre a2.
* reménytelenül passzív: nem mozog eleget és nem növelné, még ha tehetné sem .
*compute sportTIPUJ = 0.
* nem mozog és nem növelné .
*if (a35_6 >2 & a2 > 3) sportTIPUJ = 1 .
*if ( a16=1 & a2 > 3) sportTIPUJ = 1 .
* nem mozog, de növelné .
*if (a2 >3 & a16=2) sportTIPUJ = 2.
*if (a2>3 & a35_6<3) sportTIPUJ = 2.

* legalább hetente mozog .
*if (a2 <4) sportTIPUJ = 3 .

* a35_6-ban NT válasz miatt be nem sorolódók.
*if (sportTIPUJ=0 & a36=4) sportTIPUJ= 2 .

*val lab sportTIPUJ
     1 'nem sportol és nem növelné, még ha tehetné sem'
     2 'nem sportol, de növelné'
     3 'legalább hetente sportol' .


compute sportTIPUJ = 0.
* nem mozog és nem növelné .
if ( a16=1 & a2 > 3) sportTIPUJ = 1 .
* nem mozog, de növelné .
if (a2 >3 & a16=2) sportTIPUJ = 2.

* legalább hetente mozog .
if (a2 <4) sportTIPUJ = 3 .

*  NT válasz miatt be nem sorolódók.
if (sportTIPUJ=0 & a35_6=2) sportTIPUJ= 2 .
if (sportTIPUJ=0 & a35_6>2) sportTIPUJ= 1 .
if (sportTIPUJ=0 & a36=4) sportTIPUJ= 2.

fre sporttipuj.


val lab sportTIPUJ
     1 'nem sportol és nem növelné, még ha tehetné sem'
     2 'nem sportol, de növelné'
     3 'legalább hetente sportol' .

fre sportTIPUJ .
variable level sportTIPUJ (ordinal) .

*temp.
*sel if (sportTIPUJ=0) .
*list sorszam sportTIPUJ sporttip  a2 a16 a26 a36 a35_6 a50_2 a50_3  a53 . 


*sort cases by sportTIPUJ .
*split file by sportTIPUJ .
*fre a2 a16 a26 a36 a35_6 a50_2 a50_3  a53 .
*split file off.


save outfile = 'c:\Panni\MasMunka\2024\Sportkutatas\data\TARKI\sajat_elemzes\sport_csakkerdezettek_tisztitott_valtozokkal.sav'.








