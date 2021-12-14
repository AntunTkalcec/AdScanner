--insert into kupci(vrsta, adresa, vlasnik) values ('trgovina', 'Ulica Augusta Šenoe 14', 'Ivica Pivica'), ('trgovina', 'Ulica Nikole Tesle 2', 'Ana Anić'), 
--('kafic', 'Zagrebačka 46', 'Pero Perić'), ('kafic', 'Ulica Branitelja Hrvatske 108', 'Draganka Jagodić');

--insert into vozaci(oznaka, ime_prezime) values ('HR100', 'Marija Horvat'), ('HR200', 'Dubravko Kovačević'), ('HR300', 'Filip Babić'), ('HR400', 'Marko Tomić'),
--('HR500', 'Klara Pavlović');

--insert into dostavna_vozila(oznaka) values ('ZG-180-BV'), ('KC-682-LI'), ('RI-777-A'), ('BJ-143-KG'), ('KR-450-CT'), ('SP-934-H'), ('DU-865-KK'), ('SB-821-TT'), 
--('PU-281-BO');

--insert into dnevni_rasporedi(raspored_pocetak, raspored_zavrsetak, vozilo_id, vozac_id) values ('08:00', '10:00', 1, 1), ('12:00', '14:30', 2, 1), ('16:00', '17:00', 4, 1),
--('07:30', '18:00', 9, 2), ('10:00', '14:00', 3, 3), ('16:00', '17:30', 5, 3), ('08:00', '12:00', 4, 4), ('13:00', '14:30', 5, 4), ('15:00', '23:00', 6, 5), 
--('09:00', '10:00', 6, 3), ('11:30', '13:30', 7, 5), ('10:30', '11:30', 8, 1);

insert into narucuje (kupac_id, pivo_id, vozilo_id, kolicina) values (1, 1, 1, 10), (1, 2, 2, 25), (1, 16, 1, 80), (2, 19, 9, 300), (2, 3, 3, 100), (2, 4, 4, 40), (3, 13, 7, 60), 
(3, 16, 8, 57.5), (4, 11, 6, 75), (4, 5, 5, 50), (5, 6, 1, 84), (3, 9, 8, 130), (4, 19, 1, 10), (5, 2, 3, 30), (6, 6, 6, 60), (7, 7, 7, 70), (8, 8, 8, 80), (9, 9, 9, 19), 
(10, 12, 3, 120), (11, 13, 4, 15), (12, 12, 5, 12), (13, 13, 6, 39), (14, 14, 7, 4);


--insert into kupci(vrsta, adresa, vlasnik) values ('trgovina', 'Adresa Kupca 5', 'Vlasnik trgovine 5'), ('kafic', 'Adresa Kafica 6', 'Vlasnik kafica 6'), 
--('trgovina', 'Adresa trgovine 7', 'Vlasnik trgovine 7'), ('trgovina', 'Adresa trgovine 8', 'Vlasnik trgovine 8'), ('kafic', 'Adresa kafica 9', 'Vlasnik kafica 9'),
--('kafic', 'Adresa kafica 10', 'Vlasnik kafica 10'), ('kafic', 'Adresa kafica 11', 'Vlasnik kafica 11'), ('trgovina', 'Adresa trgovine 12', 'Vlasnik dvanaeste trgovine'),
--('trgovina', 'Adresa 13. trgovine', 'Vlasnik neke trinaeste trgovine'), ('kafic', 'Ulica kafica 14', 'Vlasnica Vlasnikić');

insert into narucuje(kupac_id, pivo_id, vozilo_id, kolicina) values (1, 3, 3, 30), (1, 4, 4, 40), (1, 5, 5, 50), (2, 2, 2, 20), (2, 5, 3, 30);
insert into narucuje(kupac_id, pivo_id, vozilo_id, kolicina) values (2, 11, 9, 9);

select * from narucuje order by pivo_id asc;

select p.id as pivo, k.id as kupac, sum(n.kolicina) from kupci k join narucuje n on k.id = n.kupac_id join piva p on p.id = n.pivo_id 
group by k.id, p.id order by sum(n.kolicina) desc limit 10;

/////select k.id from kupci k join narucuje n on k.id = n.kupac_id group by k.id having count(k.id) > 5;

/////select p.id, p.name, sum(n.kolicina) from piva p join narucuje n on n.pivo_id = p.id group by p.name, p.id order by sum(n.kolicina) desc limit 10;

/////select k.id, k.vrsta, sum(n.kolicina) from kupci k join narucuje n on k.id = n.kupac_id group by k.id order by sum(n.kolicina) desc limit 10;

/////select p.id, p.name from piva p join narucuje n on n.pivo_id = p.id join kupci k on n.kupac_id = k.id where k.id not in 
(select k.id from kupci k join narucuje n on k.id = n.kupac_id group by k.id order by sum(n.kolicina) desc limit 10);

 * UPITI IZ ZADATKA OZNAČENI S " ///// " *