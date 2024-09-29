<h1><span style="font-weight: 400;">EHR Autocad plugina dokumentatsioon</span></h1>
<p>&nbsp;</p>
<h3><strong>1. RtD, DtR: Radiaanide ja kraadide vahel teisendamine</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>RtD</strong><span style="font-weight: 400;"> funktsioon teisendab nurga radiaanidesse kraadideks. Seda kasutatakse sageli, sest AutoCAD t&ouml;&ouml;tab tavaliselt radiaanidega, kuid paljud geomeetrilised arvutused vajavad kraade.</span></li>
<li style="font-weight: 400;"><strong>DtR</strong><span style="font-weight: 400;"> teisendab nurga kraadidest radiaanideks, mis on vajalik paljude AutoCAD-i ja matemaatiliste arvutuste jaoks.</span></li>
</ul>
<h3><strong>2. BITS_LST: Tagastab arvu, mis koosneb 2 astmetest</strong></h3>
<ul>
<li style="font-weight: 400;"><span style="font-weight: 400;">Funktsioon </span><strong>BITS_LST</strong><span style="font-weight: 400;"> v&otilde;tab ette antud arvu ja leiab k&otilde;ik 2 astmed, mis kokku moodustavad selle arvu. N&auml;iteks kui sisend on 5, siis funktsioon tagastab 2^2 ja 2^0, sest 5 = 4 + 1. Seda saab kasutada mitmesugustes matemaatilistes ja bitip&otilde;histes arvutustes.</span></li>
</ul>
<h3><strong>3. -MEMBER, -MEMBER_ASSOC: Elemendi v&otilde;i paaride leidmine p&ouml;&ouml;ratud listist</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>-MEMBER</strong><span style="font-weight: 400;"> otsib antud v&auml;&auml;rtust listist, kuid teeb seda, alustades listi l&otilde;pust. See on kasulik, kui soovite leida viimase esinemise listis.</span></li>
<li style="font-weight: 400;"><strong>-MEMBER_ASSOC</strong><span style="font-weight: 400;"> t&ouml;&ouml;tab sarnaselt, kuid otsib assotsiatiivseid paare (v&otilde;tme-v&auml;&auml;rtuse paare) p&ouml;&ouml;ratud listist.</span></li>
</ul>
<h3><strong>4. DICTAD: Lisab v&otilde;tme-v&auml;&auml;rtuse paare s&otilde;nastikku</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>DICTAD</strong><span style="font-weight: 400;"> lisab s&otilde;nastikku v&otilde;tme-v&auml;&auml;rtuse paari. Kui antud v&otilde;ti juba eksisteerib, siis selle v&otilde;tme alla kombineeritakse mitu v&auml;&auml;rtust &uuml;heks listiks, mitte ei kirjutata uut v&auml;&auml;rtust &uuml;le. See v&otilde;imaldab hoida mitu v&auml;&auml;rtust sama v&otilde;tme all.</span></li>
</ul>
<h3><strong>5. LM: Pesastatud listide tasandamine</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>LM</strong><span style="font-weight: 400;"> funktsioon v&otilde;tab pesastatud (sisemised) listid ja teisendab need &uuml;heks tasaseks listiks. N&auml;iteks, kui on mitu taset listides, kogutakse k&otilde;ik andmed &uuml;hte loetellu, mis muudab nende t&ouml;&ouml;tlemise lihtsamaks.</span></li>
</ul>
<h3><strong>6. LST-&gt;STR_SEP: Loendi teisendamine stringiks, kasutades kindlat eraldajat</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>LST-&gt;STR_SEP</strong><span style="font-weight: 400;"> v&otilde;tab ette loendi ja &uuml;hendab selle elemendid &uuml;heks stringiks, kasutades m&auml;&auml;ratud eraldajat. See v&otilde;ib olla kasulik, kui soovite loendist luua inimloetava vormingu, n&auml;iteks komadega eraldatud v&auml;&auml;rtuste loendi.</span></li>
</ul>
<h3><strong>7. pt3D-&gt;2D: 3D-punkti teisendamine 2D-punktiks</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>pt3D-&gt;2D</strong><span style="font-weight: 400;"> funktsioon eemaldab 3D-punktist Z-koordiinaadi ja tagastab ainult 2D-punkti (X ja Y koordinaadid). Seda kasutatakse juhul, kui kolmandat m&otilde;&otilde;det pole vaja, n&auml;iteks tasapinnaliste arvutuste puhul.</span></li>
</ul>
<h3><strong>8. ARCSIN, CHRD-&gt;ARC_LEN, CHRD-&gt;ANG: Trigonomeetrilised arvutused</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>ARCSIN</strong><span style="font-weight: 400;"> teeb arkusiini (asin) arvutuse, mis on trigonomeetriline funktsioon, mida kasutatakse nurkade leidmiseks.</span></li>
<li style="font-weight: 400;"><strong>CHRD-&gt;ARC_LEN</strong><span style="font-weight: 400;"> arvutab kaare pikkuse, l&auml;htudes kordiinaadist. Kord on kahe punkti vaheline sirge, mille p&otilde;hjal saab arvutada kaare pikkuse.</span></li>
<li style="font-weight: 400;"><strong>CHRD-&gt;ANG</strong><span style="font-weight: 400;"> arvutab nurga, l&auml;htudes kordidest. Seda kasutatakse geomeetriliste arvutuste puhul, kus kordiinaadid on teada ja on vaja v&auml;lja selgitada nurgad.</span></li>
</ul>
<h3><strong>9. STRBETWEEN, STR_REMOVE, SPARSER: Stringi manipuleerimise funktsioonid</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>STRBETWEEN</strong><span style="font-weight: 400;"> funktsioon eraldab stringist osa, mis j&auml;&auml;b kahe m&auml;&auml;ratud m&auml;rgi v&otilde;i v&auml;&auml;rtuse vahele. N&auml;iteks kui string on &bdquo;[info]&ldquo;, eraldab see funktsioon sisu sulgude vahelt.</span></li>
<li style="font-weight: 400;"><strong>STR_REMOVE</strong><span style="font-weight: 400;"> eemaldab stringist soovimatud m&auml;rgid v&otilde;i s&uuml;mbolid.</span></li>
<li style="font-weight: 400;"><strong>SPARSER</strong><span style="font-weight: 400;"> puhastab ja manipuleerib stringe, eemaldades t&uuml;hikud v&otilde;i muud liigsed s&uuml;mbolid, et string oleks t&ouml;&ouml;tluseks valmis.</span></li>
</ul>
<h3><strong>10. LST_SLICE: Loendi t&uuml;keldamine kahe indeksi vahel</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>LST_SLICE</strong><span style="font-weight: 400;"> l&otilde;ikab v&auml;lja loendist osa, mis j&auml;&auml;b kahe m&auml;&auml;ratud indeksi vahele. See on kasulik, kui soovite t&ouml;&ouml;deldavatest andmetest kasutada vaid osa.</span></li>
</ul>
<h3><strong>11. LST_REM_DUPES: Eemaldab duplikaadid loendist</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>LST_REM_DUPES</strong><span style="font-weight: 400;"> skaneerib l&auml;bi loendi ja eemaldab sellest k&otilde;ik korduvad v&auml;&auml;rtused, j&auml;ttes alles ainult unikaalsed elemendid.</span></li>
</ul>
<h3><strong>12. PT-&gt;STR, STR-&gt;PT: Punktide ja stringide vaheline teisendamine</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>PT-&gt;STR</strong><span style="font-weight: 400;"> teisendab punkti koordinaadid stringiks. N&auml;iteks punkt </span><span style="font-weight: 400;">(10, 20)</span><span style="font-weight: 400;"> teisendatakse stringiks &bdquo;10,20&ldquo;.</span></li>
<li style="font-weight: 400;"><strong>STR-&gt;PT</strong><span style="font-weight: 400;"> teeb vastupidist: teisendab stringi punktiks, n&auml;iteks stringi &bdquo;10,20&ldquo; punktiks </span><span style="font-weight: 400;">(10, 20)</span><span style="font-weight: 400;">.</span></li>
</ul>
<h3><strong>13. PTS_REM_DUPLI: Eemaldab duplikaatsed punktid loendist</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>PTS_REM_DUPLI</strong><span style="font-weight: 400;"> otsib loendist duplikaadid ja eemaldab need. Seejuures arvestab funktsioon punktide t&auml;psusega (kasutatakse ligikaudselt sarnaseid punkte) ning j&auml;tab alles ainult unikaalsed punktid.</span></li>
</ul>
<h3><strong>14. PLINE_COORDS_GET: Pol&uuml;joone koordinaatide tuvastamine</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>PLINE_COORDS_GET</strong><span style="font-weight: 400;"> funktsioon tuvastab ja tagastab pol&uuml;joone koordinaadid. Pol&uuml;joon on joon, mis koosneb mitmest sirgest segmendist, ja see funktsioon v&otilde;imaldab koordinaate nende segmentide p&otilde;hjal.</span></li>
</ul>
<h3><strong>15. ARC-&gt;SEGS, BULGE-&gt;ARC: Kaarepunktide arvutamine</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>ARC-&gt;SEGS</strong><span style="font-weight: 400;"> arvutab ja tagastab k&otilde;ik punktid, mis j&auml;&auml;vad kaare peale, jaotades selle mitmeks v&auml;ikeseks segmendiks.</span></li>
<li style="font-weight: 400;"><strong>BULGE-&gt;ARC</strong><span style="font-weight: 400;"> teisendab kaare "paisutuse" parameetri alusel, mis on kasulik kaare geomeetria t&auml;pseks m&auml;&auml;ramiseks.</span></li>
</ul>
<h3><strong>16. HATCH-&gt;SEGS: Hatch-entiteetide koordinaatide tuvastamine</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>HATCH-&gt;SEGS</strong><span style="font-weight: 400;"> funktsioon tuvastab ja eraldab k&otilde;ik koordinaadid AutoCAD-i &bdquo;hatch&ldquo; (varjutuse) objektist, mis koosneb mitmest geomeetrilisest joonest v&otilde;i punktist.</span></li>
</ul>
<h3><strong>17. WRITE_COORDS_RZ: Koordinaatide salvestamine faili</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>WRITE_COORDS_RZ</strong><span style="font-weight: 400;"> funktsioon kirjutab kogutud koordinaadid faili kindla struktuuri alusel. RZ t&auml;histab, et koordinaadid on X, Y, ja Z vormingus, mis on vajalik ruumiliste koordinaatide s&auml;ilitamiseks.</span></li>
</ul>
<h3><strong>18. SS-&gt;ENTS_BY_LAYER: Valitud objektide korraldamine kihtide j&auml;rgi</strong></h3>
<ul>
<li style="font-weight: 400;"><strong>SS-&gt;ENTS_BY_LAYER</strong><span style="font-weight: 400;"> funktsioon v&otilde;tab valitud objektid ja jaotab need erinevatesse kihtidesse. AutoCAD-is kasutatakse kihte, et eraldada ja korraldada erinevat t&uuml;&uuml;pi geomeetrilisi elemente, ning see funktsioon lihtsustab valikute jaotamist erinevateks kihtideks.</span></li>
</ul>
<p>&nbsp;</p>
