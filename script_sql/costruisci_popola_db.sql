CREATE DATABASE progetto;

USE progetto;

CREATE TABLE Supermercato (
  ID             int(10) NOT NULL AUTO_INCREMENT, 
  ReferenteID    int(10) NOT NULL, 
  Nome           varchar(255), 
  Catena         varchar(255), 
  OrarioApertura time, 
  OrarioChiusura time, 
  Indirizzo      varchar(255), 
  ModPromozione  tinyint(1), 
  PRIMARY KEY (ID));

CREATE TABLE Prodotto (
  ID                    int(10) NOT NULL AUTO_INCREMENT, 
  CarrelloID            int(10), 
  DescrizioneProdottoID int(10) NOT NULL, 
  SupermercatoID        int(10), 
  DataScadenza          date, 
  Sconto                double, 
  Stato                 varchar(255), 
  Prezzo                double,
  PRIMARY KEY (ID));

CREATE TABLE Cliente (
  ID             int(10) NOT NULL AUTO_INCREMENT, 
  Nome           varchar(255), 
  Password       varchar(255), 
  Indirizzo      varchar(255), 
  NumeroTelefono varchar(255), 
  PRIMARY KEY (ID));

CREATE TABLE Ordine (
  ID             int(10) NOT NULL AUTO_INCREMENT, 
  CarrelloID     int(10), 
  NomeRider      varchar(255), 
  OrarioConsegna time, 
  Stato          varchar(255), 
  PRIMARY KEY (ID));

CREATE TABLE DescrizioneProdotto (
  ID        int(10) NOT NULL AUTO_INCREMENT, 
  Nome   varchar(255),
  Marca     varchar(255), 
  Categoria varchar(255), 
  Barcode   varchar(255), 
  PRIMARY KEY (ID));

CREATE TABLE Referente (
  ID       int(10) NOT NULL AUTO_INCREMENT, 
  Nome     varchar(255), 
  Password varchar(255), 
  PRIMARY KEY (ID));

CREATE TABLE Carrello (
  ID        int(10) NOT NULL AUTO_INCREMENT, 
  ClienteID int(10) NOT NULL, 
  Costo     double, 
  Stato     varchar(255), 
  PRIMARY KEY (ID));

ALTER TABLE Prodotto ADD CONSTRAINT FKProdotto895993 FOREIGN KEY (SupermercatoID) REFERENCES Supermercato (ID);

ALTER TABLE Prodotto ADD CONSTRAINT FKProdotto136261 FOREIGN KEY (DescrizioneProdottoID) REFERENCES DescrizioneProdotto (ID);

ALTER TABLE Prodotto ADD CONSTRAINT FKProdotto335931 FOREIGN KEY (CarrelloID) REFERENCES Carrello (ID);

ALTER TABLE Supermercato ADD CONSTRAINT FKSupermerca488746 FOREIGN KEY (ReferenteID) REFERENCES Referente (ID);

ALTER TABLE Ordine ADD CONSTRAINT FKOrdine715081 FOREIGN KEY (CarrelloID) REFERENCES Carrello (ID);

ALTER TABLE Carrello ADD CONSTRAINT FKCarrello2606 FOREIGN KEY (ClienteID) REFERENCES Cliente (ID);

INSERT INTO `progetto`.`referente` (`ID`,`Nome`,`Password`) VALUES (1,"Mario","pass");
INSERT INTO `progetto`.`referente` (`ID`,`Nome`,`Password`) VALUES (2,"Luca","pass");
INSERT INTO `progetto`.`referente` (`ID`,`Nome`,`Password`) VALUES (3,"Antonio","pass");
INSERT INTO `progetto`.`referente` (`ID`,`Nome`,`Password`) VALUES (4,"Peppe","pass");
INSERT INTO `progetto`.`referente` (`ID`,`Nome`,`Password`) VALUES (5,"Francesco","pass");

INSERT INTO `progetto`.`supermercato`(`ID`,`ReferenteID`,`Nome`,`Catena`,`OrarioApertura`,`OrarioChiusura`,`Indirizzo`,`ModPromozione`)VALUES (1,1,"Carrefour Express","Carrefour",'17:00','00:00',"Via Brombeis",0);
INSERT INTO `progetto`.`supermercato`(`ID`,`ReferenteID`,`Nome`,`Catena`,`OrarioApertura`,`OrarioChiusura`,`Indirizzo`,`ModPromozione`)VALUES (2,2,"Carrefour Antonio","Carrefour",'18:00','23:00',"Via Ruoppolo",0);
INSERT INTO `progetto`.`supermercato`(`ID`,`ReferenteID`,`Nome`,`Catena`,`OrarioApertura`,`OrarioChiusura`,`Indirizzo`,`ModPromozione`)VALUES (3,3,"Sole Express","Sole 365",'19:00','23:00',"Via Giotto",0);
INSERT INTO `progetto`.`supermercato`(`ID`,`ReferenteID`,`Nome`,`Catena`,`OrarioApertura`,`OrarioChiusura`,`Indirizzo`,`ModPromozione`)VALUES (4,4,"Conad Fast","Conad",'17:00','00:00',"Via Mascagni",1);
INSERT INTO `progetto`.`supermercato`(`ID`,`ReferenteID`,`Nome`,`Catena`,`OrarioApertura`,`OrarioChiusura`,`Indirizzo`,`ModPromozione`)VALUES (5,5,"Conad Luca","Conad",'17:00','00:00',"Via Machiavelli",0);


INSERT INTO `progetto`.`descrizioneprodotto`(`ID`,`Nome`,`Marca`,`Categoria`,`Barcode`)VALUES (1,"Insalata Mista","Bonduelle","Verdura","001");
INSERT INTO `progetto`.`descrizioneprodotto`(`ID`,`Nome`,`Marca`,`Categoria`,`Barcode`)VALUES (2,"Insalata Riccia","Bonduelle","Verdura","002");
INSERT INTO `progetto`.`descrizioneprodotto`(`ID`,`Nome`,`Marca`,`Categoria`,`Barcode`)VALUES (3,"Yogurt Magro","Yomo","Latticini","003");
INSERT INTO `progetto`.`descrizioneprodotto`(`ID`,`Nome`,`Marca`,`Categoria`,`Barcode`)VALUES (4,"Mela","Melinda","Frutta","004");
INSERT INTO `progetto`.`descrizioneprodotto`(`ID`,`Nome`,`Marca`,`Categoria`,`Barcode`)VALUES (5,"Pera","Perinda","Verdura","005");


INSERT INTO `progetto`.`prodotto`(`ID`,`CarrelloID`,`DescrizioneProdottoID`,`SupermercatoID`,`DataScadenza`,`Sconto`,`Stato`,`Prezzo`)VALUES(1,NULL,1,1,'202-2-1',20,"DISPONIBILE",2);
INSERT INTO `progetto`.`prodotto`(`ID`,`CarrelloID`,`DescrizioneProdottoID`,`SupermercatoID`,`DataScadenza`,`Sconto`,`Stato`,`Prezzo`)VALUES(2,NULL,2,1,'2020-7-28',20,"DISPONIBILE",3);
INSERT INTO `progetto`.`prodotto`(`ID`,`CarrelloID`,`DescrizioneProdottoID`,`SupermercatoID`,`DataScadenza`,`Sconto`,`Stato`,`Prezzo`)VALUES(3,NULL,2,1,'2020-7-28',40,"DISPONIBILE",4);

INSERT INTO `progetto`.`prodotto`(`ID`,`CarrelloID`,`DescrizioneProdottoID`,`SupermercatoID`,`DataScadenza`,`Sconto`,`Stato`,`Prezzo`)VALUES(4,NULL,2,2,'2020-7-30',20,"DISPONIBILE",5);
INSERT INTO `progetto`.`prodotto`(`ID`,`CarrelloID`,`DescrizioneProdottoID`,`SupermercatoID`,`DataScadenza`,`Sconto`,`Stato`,`Prezzo`)VALUES(5,NULL,3,3,'2020-7-28',30,"DISPONIBILE",6);
INSERT INTO `progetto`.`prodotto`(`ID`,`CarrelloID`,`DescrizioneProdottoID`,`SupermercatoID`,`DataScadenza`,`Sconto`,`Stato`,`Prezzo`)VALUES(6,NULL,4,4,'2020-8-4',50,"DISPONIBILE",7);
INSERT INTO `progetto`.`prodotto`(`ID`,`CarrelloID`,`DescrizioneProdottoID`,`SupermercatoID`,`DataScadenza`,`Sconto`,`Stato`,`Prezzo`)VALUES(7,NULL,5,5,'2020-9-12',10,"DISPONIBILE",8);

INSERT INTO `progetto`.`cliente` (`ID`,`Nome`,`Password`,`Indirizzo`,`NumeroTelefono`) VALUES (2,"Mario Rossi","pass","Via Mario Fiore","3312774638");
INSERT INTO `progetto`.`carrello` (`ID`,`ClienteID`,`Costo`,`Stato`) VALUES (2,2,null,"CORRENTE");
INSERT INTO `progetto`.`cliente` (`ID`,`Nome`,`Password`,`Indirizzo`,`NumeroTelefono`) VALUES (3,"Mario Biondi","pass","Via Mario Fiore","3312774638");
INSERT INTO `progetto`.`carrello` (`ID`,`ClienteID`,`Costo`,`Stato`) VALUES (3,3,null,"CORRENTE");
