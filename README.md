See plugin ekspordib valitud osad EHR .txt formaati mille järel saab siis need otse EHR-i üles laadida.
AUTOCAD: Käivita APPLOAD ja vali “Coords_export_ACAD.fas” ning klõpsa Load või lihtsalt lohista ja aseta .fas fail AutoCAD aknasse. Luba AutoCAD-il rakendust käivitada, klõpsates Load või Always Load, kui seda küsitakse.
BRICSCAD: Käivita APPLOAD ja vali “Coords_export_BRICSCAD.des” ning märgi Load.
Käsud:

EHR_WRITE – Kirjutab YX koordinaadid .txt failidesse. Failid salvestatakse joonise kausta, nimega DWGNAME_LAYERNAME.txt. Failid kirjutatakse üle, kui need juba eksisteerivad.<br>
EHR_SETTINGS – Võimaldab kasutajal määrata kaare/polügooni segmentide nööri pikkuse, mis muudetakse sirglõikudeks, ja määrata koordinaatide täpsus (komakohtade arv). Vaikeväärtused: Kohtade arv = 3, Nööri pikkus = 1.5.<br>
EHR_TEST – Visuaalne abi koordinaatide kontrollimiseks, mis kirjutatakse faili. Loob kihi "TEST_COORDS".<br>
EHR_HELP – Kuvab käskude kirjelduse.

Kui tekib probleeme pindade koordinaatide üles laadimisel Ehitisregistrisse, siis enne pindade koordinaatide võtmist tasub teha kõikidest pindadest "HATCHGENERATEBOUNDARY" ja koordinaadid võtta juba genereeritud boundary'test, sel juhul saab pinnad EHRi veateadeteta üles laadida ja EHR saab aru, et tegemist on suletud pinnavormidega.

Projekti toetab Euroopa Liit - NextGenerationEU vahenditest.
![image](https://github.com/user-attachments/assets/14beff5a-0073-49db-9db3-ae3dede6acb1)
