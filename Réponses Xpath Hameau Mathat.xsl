<!-- Question 1 -->
//country/capital

capital	Oranjestad
capital	Kabul

<!-- Question 2 -->
//country/name/common

common	Aruba
common	Afghanistan

<!-- Question 3 -->
//*[count(@*) =1]

native_name	
native_name	

<!-- Question 4 -->
//country/name/native_name[@lang='fra']/official

official	Territoire des Terres australes et antarctiques françaises
official	République du Burundi
<!-- Question 5 -->
//country/name/native_name[position() = 2]/official

official	Aruba
(caractères non européens)

<!-- Question 6 -->
sum(//country[infosRegion/region/text()='Europe']/area)

2.3*10^7

<!-- Question 7 -->
//country/name[not(native_name)]/common

common	Antarctica

<!-- Question 8 -->
//country/name[not(contains(official,common))]/common

common	Argentina
common	Switzerland

<!-- Question 9 -->
//country[count(borders)>8]/name/common

common	Brazil
common	China

<!-- Question 10 -->
count(//country[name/common ='France']/preceding-sibling::*)+1

76

<!-- Question 11 -->
//country/name[contains(official,'Federal')]/official

official	Federal Republic of Germany
official	Federal Democratic Republic of Ethiopia

<!-- Question 12 -->
//country[not(name/native_name/@lang=preceding::name/native_name/@lang)]/name/native_name/@lang

lang	nld
lang	pap


<!-- Partie 2 -->

il faut rempalcer tld+ apr tld*
et inforegion* par inforegion+

<!-- Partie 3 -->