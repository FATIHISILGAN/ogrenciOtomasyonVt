CREATE DATABASE OgrenciOtomasyon CHARACTER SET utf8 COLLATE utf8_turkish_ci;
use OgrenciOtomasyon


Create table brans (
 bransID int not null,
 bransAD varchar(100),
 primary key (bransID)
);

Create table ogretmenler(
ogretmenİD int not null primary key,
ogretmenKullaniciAd varchar(100) not null,
ogretmenPassword varchar(100) not null,
ogretmenAd varchar(100),
ogretmenSoyad varchar(100),
dogumTarihi date not null,
 bransID int not null,
 foreign key (bransID)  references brans(bransID)
);

Create table siniflar(
sinifİD int not null primary key,
sube varchar(100) not null,
mevcutKisi int not null,
ogretmenİD int not null,
 foreign key (ogretmenİD)  references ogretmenler(ogretmenİD)
);

Create table dersler(
dersİD int not null primary key,
dersAd varchar(100) not null,
ogretmenİD int not null,

 foreign key (ogretmenİD)  references ogretmenler(ogretmenİD)
  
);



Create table ogrenciler(
ogrenciİD int not null primary key,
ogrenciKullaniciAd varchar(100) not null,
ogrenciKullaniciPassword varchar(100) not null,
ogrenciAd varchar(100) not null,
ogrenciSoyad varchar(100) not null,
tc varchar(100) not null,
dogumTarihi date not null,
sinifİD int not null,

  foreign key (sinifİD)  references siniflar(sinifİD)
);

Create table obs(
islemİD int not null primary key,
dersNotu int not null,
notNo int not null,
dersİD int not null ,
ogretmenİD int not null ,
ogrenciİD int not null,


 foreign key (ogretmenİD)  references ogretmenler(ogretmenİD),
 foreign key (dersİD)  references dersler(dersİD),
    foreign key (ogrenciİD)  references ogrenciler(ogrenciİD)
);



insert into brans(bransID,bransAD) 
values
(1,'Matematik'),
(2,'Türkçe'),
(3,'Kimya'),
(4,'Fizik'),
(5,'Biyoloji'),
(6,'Felsefe'),
(7,'Tarih'),
(8,'Din Kültürü'),
(9,'Beden Eğitimi'),
(10,'Edebiyat');



insert into ogretmenler(ogretmenİD,ogretmenKullaniciAd,ogretmenPassword,ogretmenAd,ogretmenSoyad,dogumTarihi,bransID) 
values
(1,'kernelMan','cpp1024es6jdk','Linus', 'Torvalds','1969-12-28',1),
(2,'codeBreaker1943','ff00256sdk','Alan','Turing','1912-06-23',1),
(3,'MathPoetry','cs404ffffcss','Ada' , 'Lovelace','1815-12-10',1),
(4,'TürkçeDili','jsmwbsql','Ömer' , 'Demircan','1935-10-02',2),
(5,'RadioActiveBadGirl6.63','cssfff00405','Marie', 'Curie','1867-11-07',3),
(6,'PhysicLover','xml404dll','Max', 'Planck','1858-04-23',4),
(7,'MicroBio','404poco405','Zekai Muammer' , 'Tunçman','1895-03-24',5),
(8,'Friedrich','bllumljs','Friedrich' , 'Nietzsche','1900-08-25',6),
(9,'iyiVatandaş','jsphp64','Hasan Ali', 'Yücel','1897-12-17',6),
(10,'CahilKiller','sqlcs8js','İlber', 'Ortaylı','1947-05-21',7),
(11,'Ottomaner','cppdll404','Halil' , 'İnalcık','1916-05-25',7),
(12,'AliE','xmlcs32js','Ali', 'Erbaş','1961-10-15',8),
(13,'archerBoy','css1024cpp','Mete', 'Gazoz','1999-6-08',9),
(14,'pocketHercule','javajson404','Naim', 'Süleymanoğlu','1967-01-23',9),
(15,'BraveNewWorld','jssdkmwb','Aldous', 'Huxley','1894-07-26',10),
(16,'TurkisLitaratist','cppff00cc','Halide' , 'Edib Adıvar','1882-11-15',10);




insert into siniflar(sinifİD,sube,mevcutKisi,ogretmenİD)
values
(1,'9A',35,3),
(2,'10A',42,2),
(3,'11A',40,4),
(4,'12A',32,1),
(5,'9B',34,5),
(6,'10B',25,6),
(7,'11B',30,7),

(8,'12B',34,8),
(9,'9C',25,9),
(10,'10C',33,10),
(11,'11C',43,11),

(12,'12C',30,12);


insert into dersler(dersİD,dersAD,ogretmenİD)
values
(1,'Temel Matematik1',1),
(2,'Temel Matematik2',2),
(3,'İleri Matematik1',3),
(4,'İleri Matematik2',2),
(5,'Edebiyat1',16),
(6,'temel fizik',6),
(7,'ileri fizik',6);



insert into ogrenciler(ogrenciİD,ogrenciKullaniciAd,ogrenciKullaniciPassword,ogrenciAd,ogrenciSoyad,tc,dogumTarihi,sinifİD)

values
(1,'dotnetMan','hdsjds2e3','Fatih','Işılgan',20801286816,'2001-05-13',10),
(2,'Flutterist','hjdds321s2e3','Muhammed Fatih','Aktaş',23221312231,'1984-06-12',10),
(3,'QuuenLover','hsds232','Enes','Karabacak',20832322321,'2001-03-31',1);




insert into obs(islemİD,dersNotu,notNo,dersİD,ogretmenİD,ogrenciİD)
values
(1,95,1,2,1,1),
(2,75,2,2,1,1),
(3,60,1,3,2,2);

Select * from obs o inner join dersler ders on o.dersİD=ders.dersİD 


select * from ogretmenler o inner join brans b on o.bransİD=b.bransİD

select * from ogrenciler o inner join obs ob on o.ogrenciİD = ob.ogrenciİD



Select * from dersler  left join Ogretmenler on dersler.ogretmenİD=Ogretmenler.ogretmenİD  left join
siniflar on ogretmenler.OgretmenİD=siniflar.ogretmenİD left join ogrenciler on siniflar.sinifİD=ogrenciler.sinifİD left join obs 
 on ogrenciler.ogrenciİD =obs.ogrenciİD



