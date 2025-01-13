-- Ștergerea tabelelor
DROP TABLE Sarcini_AMO PURGE;
DROP TABLE Vehicule_AMO PURGE;
DROP TABLE Contracte_AMO PURGE;
DROP TABLE Documente_AMO PURGE;
DROP TABLE Soferi_AMO PURGE;
DROP TABLE Utilizatori_AMO PURGE;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Crearea tabelelor
-- 1.
CREATE TABLE Utilizatori_AMO(
   UtilizatorID NUMBER(4),
   Nume VARCHAR2(50),
   Prenume VARCHAR2(50),
   NumeUtilizator VARCHAR2(50) CONSTRAINT uq_NumeUtilizator_AMO UNIQUE,
   Email VARCHAR2(100) CONSTRAINT uq_EmailUtilizator_AMO UNIQUE,
   Telefon VARCHAR2(15) CONSTRAINT uq_TelefonUtilizator_AMO UNIQUE,
   Parola VARCHAR2(100),
      CONSTRAINT pk_UtilizatorID PRIMARY KEY(UtilizatorID)
);

-- 2.
CREATE TABLE Sarcini_AMO(
   SarcinaID NUMBER(4),
   NumeSarcina VARCHAR2(100) CONSTRAINT nn_NumeSarcina NOT NULL,
   DescriereSarcina VARCHAR2(150) CONSTRAINT nn_DescriereSarcina NOT NULL,
   TermenLimitaSarcina DATE CONSTRAINT nn_TermenLimitaSarcina NOT NULL,
   UtilizatorID NUMBER(4),
      CONSTRAINT pk_SarcinaID PRIMARY KEY(SarcinaID),
      CONSTRAINT fk_UtilizatorID_Sarcini_AMO FOREIGN KEY(UtilizatorID) REFERENCES Utilizatori_AMO(UtilizatorID)
);

-- 3.
CREATE TABLE Soferi_AMO(
   SoferID NUMBER(4),
   Nume VARCHAR2(50),
   Prenume VARCHAR2(50),
   DataNasterii DATE CONSTRAINT nn_DataNasterii NOT NULL,
   DataAngajarii DATE,
   DataSalariu DATE,
   Telefon VARCHAR2(15) CONSTRAINT uq_TelefonSofer_AMO UNIQUE,
   Email VARCHAR2(100) CONSTRAINT uq_EmailSofer_AMO UNIQUE,
   DataEmiterePermis DATE,
   DataExpirarePermis DATE,
   DataInceputConcediu DATE,
   DataSfarsitConcediu DATE,
   UtilizatorID NUMBER(4),
      CONSTRAINT pk_SoferID PRIMARY KEY(SoferID),
      CONSTRAINT fk_UtilizatorID_Soferi_AMO FOREIGN KEY(UtilizatorID) REFERENCES Utilizatori_AMO(UtilizatorID)
);

-- 4.
CREATE TABLE Vehicule_AMO(
   VehiculID NUMBER(4),
   NumarInmatriculare VARCHAR2(20) CONSTRAINT uq_NumarInmatriculare UNIQUE,
   MarcaModel VARCHAR2(50) CONSTRAINT nn_MarcaModel NOT NULL,
   AnFabricatie DATE,
   Culoare VARCHAR2(30),
   TipCombustibil VARCHAR2(30),
   DataInceputITP DATE CONSTRAINT nn_DataInceputITP NOT NULL,
   DataSfarsitITP DATE CONSTRAINT nn_DataSfarsitITP NOT NULL,
   DataInceputAsigurare DATE,
   DataSfarsitAsigurare DATE,
   SoferID NUMBER(4),
   UtilizatorID NUMBER(4),
      CONSTRAINT pk_VehiculID PRIMARY KEY(VehiculID),
      CONSTRAINT fk_SoferID FOREIGN KEY(SoferID) REFERENCES Soferi_AMO(SoferID),
      CONSTRAINT fk_UtilizatorID_Vehicule_AMO FOREIGN KEY(UtilizatorID) REFERENCES Utilizatori_AMO(UtilizatorID)
);

-- 5.
CREATE TABLE Contracte_AMO(
   ContractID NUMBER(4),
   NumeContract VARCHAR2(100) CONSTRAINT nn_NumeContract NOT NULL,
   TipContract VARCHAR2(50) CONSTRAINT nn_TipContract NOT NULL,
   DataInceputContract DATE CONSTRAINT nn_DataInceputContract NOT NULL,
   DataSfarsitContract DATE CONSTRAINT nn_DataSfarsitContract NOT NULL,
   UtilizatorID NUMBER(4),
      CONSTRAINT pk_ContractID PRIMARY KEY(ContractID),
      CONSTRAINT fk_UtilizatorID_Contracte_AMO FOREIGN KEY(UtilizatorID) REFERENCES Utilizatori_AMO(UtilizatorID)
);

-- 6.
CREATE TABLE Documente_AMO(
   DocumentID NUMBER(4),
   NumeDocument VARCHAR2(100) CONSTRAINT nn_NumeDocument NOT NULL,
   TipDocument VARCHAR2(50) CONSTRAINT nn_TipDocument NOT NULL,
   DataIncarcareDocument DATE CONSTRAINT nn_DataIncarcareDocument NOT NULL,
   CaleFisierDocument VARCHAR2(255),
   UtilizatorID NUMBER(4),
      CONSTRAINT pk_DocumentID PRIMARY KEY(DocumentID),
      CONSTRAINT fk_UtilizatorID_Documente_AMO FOREIGN KEY(UtilizatorID) REFERENCES Utilizatori_AMO(UtilizatorID)
);


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserarea de valori
-- 1.
INSERT INTO Utilizatori_AMO (UtilizatorID, Nume, Prenume, NumeUtilizator, Email, Telefon, Parola) 
VALUES (1, 'Popescu', 'Ion', 'popescu_ion', 'popescu.ion@example.com', '0721123456', 'parola123');

INSERT INTO Utilizatori_AMO (UtilizatorID, Nume, Prenume, NumeUtilizator, Email, Telefon, Parola)
VALUES (2, 'Ionescu', 'Maria', 'maria_ionescu', 'mionescu@example.com', '0732123456', 'parola456');

INSERT INTO Utilizatori_AMO (UtilizatorID, Nume, Prenume, NumeUtilizator, Email, Telefon, Parola)
VALUES (3, 'Radu', 'Andrei', 'radu_andrei', 'aradu@example.com', '0743123456', 'parola789');

INSERT INTO Utilizatori_AMO (UtilizatorID, Nume, Prenume, NumeUtilizator, Email, Telefon, Parola)
VALUES (4, 'Georgescu', 'Ana', 'ana_georgescu', 'ana.georgescu@example.com', '0754123456', 'parola321');

INSERT INTO Utilizatori_AMO (UtilizatorID, Nume, Prenume, NumeUtilizator, Email, Telefon, Parola)
VALUES (5, 'Popa', 'Diana', 'diana_popa', 'diana.popa@example.com', '0765123456', 'parola654');

SELECT * FROM Utilizatori_AMO;

-- 2.
INSERT INTO Soferi_AMO (SoferID, Nume, Prenume, DataNasterii, DataAngajarii, DataSalariu, Telefon, Email, DataEmiterePermis, DataExpirarePermis, DataInceputConcediu, DataSfarsitConcediu, UtilizatorID)
VALUES (1, 'Popescu', 'Ion', TO_DATE('1985-05-15', 'YYYY-MM-DD'), TO_DATE('2022-01-10', 'YYYY-MM-DD'), TO_DATE('2022-02-01', 'YYYY-MM-DD'), '0721123456', 'popescu_ion@example.com', TO_DATE('2022-01-15', 'YYYY-MM-DD'), TO_DATE('2025-01-15', 'YYYY-MM-DD'), NULL, NULL, 1);

INSERT INTO Soferi_AMO (SoferID, Nume, Prenume, DataNasterii, DataAngajarii, DataSalariu, Telefon, Email, DataEmiterePermis, DataExpirarePermis, DataInceputConcediu, DataSfarsitConcediu, UtilizatorID)
VALUES (2, 'Ionescu', 'Maria', TO_DATE('1990-07-20', 'YYYY-MM-DD'), TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-04-01', 'YYYY-MM-DD'), '0732123456', 'mionescu@example.com', TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2025-02-15', 'YYYY-MM-DD'), NULL, NULL, 1);

INSERT INTO Soferi_AMO (SoferID, Nume, Prenume, DataNasterii, DataAngajarii, DataSalariu, Telefon, Email, DataEmiterePermis, DataExpirarePermis, DataInceputConcediu, DataSfarsitConcediu, UtilizatorID)
VALUES (3, 'Radu', 'Andrei', TO_DATE('1988-11-10', 'YYYY-MM-DD'), TO_DATE('2022-02-20', 'YYYY-MM-DD'), TO_DATE('2022-03-20', 'YYYY-MM-DD'), '0743123456', 'aradu@example.com', TO_DATE('2022-02-25', 'YYYY-MM-DD'), TO_DATE('2025-02-25', 'YYYY-MM-DD'), NULL, NULL, 1);

INSERT INTO Soferi_AMO (SoferID, Nume, Prenume, DataNasterii, DataAngajarii, DataSalariu, Telefon, Email, DataEmiterePermis, DataExpirarePermis, DataInceputConcediu, DataSfarsitConcediu, UtilizatorID)
VALUES (4, 'Georgescu', 'Ana', TO_DATE('1995-03-25', 'YYYY-MM-DD'), TO_DATE('2022-04-05', 'YYYY-MM-DD'), TO_DATE('2022-05-05', 'YYYY-MM-DD'), '0754123456', 'ana.georgescu@example.com', TO_DATE('2022-04-10', 'YYYY-MM-DD'), TO_DATE('2025-04-10', 'YYYY-MM-DD'), NULL, NULL, 2);

INSERT INTO Soferi_AMO (SoferID, Nume, Prenume, DataNasterii, DataAngajarii, DataSalariu, Telefon, Email, DataEmiterePermis, DataExpirarePermis, DataInceputConcediu, DataSfarsitConcediu, UtilizatorID)
VALUES (5, 'Popa', 'Diana', TO_DATE('1993-09-12', 'YYYY-MM-DD'), TO_DATE('2022-05-10', 'YYYY-MM-DD'), TO_DATE('2022-06-10', 'YYYY-MM-DD'), '0765123456', 'diana.popa@example.com', TO_DATE('2022-05-15', 'YYYY-MM-DD'), TO_DATE('2025-05-15', 'YYYY-MM-DD'), NULL, NULL, 3);

SELECT * FROM Soferi_AMO;

-- 3.
INSERT INTO Documente_AMO (DocumentID, NumeDocument, TipDocument, DataIncarcareDocument, CaleFisierDocument, UtilizatorID)
VALUES (1, 'Contract de munc?', 'Contract', TO_DATE('2022-01-10', 'YYYY-MM-DD'), '/cale/documente/contract_munca.pdf', 1);

INSERT INTO Documente_AMO (DocumentID, NumeDocument, TipDocument, DataIncarcareDocument, CaleFisierDocument, UtilizatorID)
VALUES (2, 'Permis de conducere', 'Licen??', TO_DATE('2022-01-15', 'YYYY-MM-DD'), '/cale/documente/permis_conducere.pdf', 2);

INSERT INTO Documente_AMO (DocumentID, NumeDocument, TipDocument, DataIncarcareDocument, CaleFisierDocument, UtilizatorID)
VALUES (3, 'Asigurare auto', 'Asigurare', TO_DATE('2022-02-10', 'YYYY-MM-DD'), '/cale/documente/asigurare_auto.pdf', 3);

INSERT INTO Documente_AMO (DocumentID, NumeDocument, TipDocument, DataIncarcareDocument, CaleFisierDocument, UtilizatorID)
VALUES (4, 'Certificat de na?tere', 'Act de identitate', TO_DATE('2022-03-05', 'YYYY-MM-DD'), '/cale/documente/certificat_nastere.pdf', 3);

INSERT INTO Documente_AMO (DocumentID, NumeDocument, TipDocument, DataIncarcareDocument, CaleFisierDocument, UtilizatorID)
VALUES (5, 'Diplom? de absolvire', 'Diplom?', TO_DATE('2022-04-20', 'YYYY-MM-DD'), '/cale/documente/diploma_absolvire.pdf', 3);

SELECT * FROM Documente_AMO;

-- 4.
INSERT INTO Contracte_AMO (ContractID, NumeContract, TipContract, DataInceputContract, DataSfarsitContract, UtilizatorID)
VALUES (1, 'Contract de munc?', 'Munc?', TO_DATE('2022-01-10', 'YYYY-MM-DD'), TO_DATE('2023-01-10', 'YYYY-MM-DD'), 1);

INSERT INTO Contracte_AMO (ContractID, NumeContract, TipContract, DataInceputContract, DataSfarsitContract, UtilizatorID)
VALUES (2, 'Contract de �nchiriere', '�nchiriere', TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2023-02-15', 'YYYY-MM-DD'), 2);

INSERT INTO Contracte_AMO (ContractID, NumeContract, TipContract, DataInceputContract, DataSfarsitContract, UtilizatorID)
VALUES (3, 'Contract de asigurare', 'Asigurare', TO_DATE('2022-03-20', 'YYYY-MM-DD'), TO_DATE('2023-03-20', 'YYYY-MM-DD'), 2);

INSERT INTO Contracte_AMO (ContractID, NumeContract, TipContract, DataInceputContract, DataSfarsitContract, UtilizatorID)
VALUES (4, 'Contract de consultan??', 'Consultan??', TO_DATE('2022-04-25', 'YYYY-MM-DD'), TO_DATE('2023-04-25', 'YYYY-MM-DD'), 3);

INSERT INTO Contracte_AMO (ContractID, NumeContract, TipContract, DataInceputContract, DataSfarsitContract, UtilizatorID)
VALUES (5, 'Contract de v�nzare-cump?rare', 'V�nzare-Cump?rare', TO_DATE('2022-05-30', 'YYYY-MM-DD'), TO_DATE('2023-05-30', 'YYYY-MM-DD'), 4);

SELECT * FROM Contracte_AMO;

-- 5.
INSERT INTO Vehicule_AMO (VehiculID, NumarInmatriculare, MarcaModel, AnFabricatie, Culoare, TipCombustibil, DataInceputITP, DataSfarsitITP, DataInceputAsigurare, DataSfarsitAsigurare, SoferID, UtilizatorID)
VALUES (1, 'B-123-ABC', 'Ford Focus', TO_DATE('2018-01-01', 'YYYY-MM-DD'), 'Ro?u', 'Benzin?', TO_DATE('2022-01-10', 'YYYY-MM-DD'), TO_DATE('2023-01-10', 'YYYY-MM-DD'), TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2023-02-15', 'YYYY-MM-DD'), 1, 1);

INSERT INTO Vehicule_AMO (VehiculID, NumarInmatriculare, MarcaModel, AnFabricatie, Culoare, TipCombustibil, DataInceputITP, DataSfarsitITP, DataInceputAsigurare, DataSfarsitAsigurare, SoferID, UtilizatorID)
VALUES (2, 'B-456-DEF', 'Volkswagen Golf', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 'Alb', 'Motorin?', TO_DATE('2022-02-20', 'YYYY-MM-DD'), TO_DATE('2023-02-20', 'YYYY-MM-DD'), TO_DATE('2022-03-25', 'YYYY-MM-DD'), TO_DATE('2023-03-25', 'YYYY-MM-DD'), 2, 2);

INSERT INTO Vehicule_AMO (VehiculID, NumarInmatriculare, MarcaModel, AnFabricatie, Culoare, TipCombustibil, DataInceputITP, DataSfarsitITP, DataInceputAsigurare, DataSfarsitAsigurare, SoferID, UtilizatorID)
VALUES (3, 'B-789-GHI', 'Audi A4', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'Negru', 'Benzin?', TO_DATE('2022-03-30', 'YYYY-MM-DD'), TO_DATE('2023-03-30', 'YYYY-MM-DD'), TO_DATE('2022-04-25', 'YYYY-MM-DD'), TO_DATE('2023-04-25', 'YYYY-MM-DD'), 3, 2);

INSERT INTO Vehicule_AMO (VehiculID, NumarInmatriculare, MarcaModel, AnFabricatie, Culoare, TipCombustibil, DataInceputITP, DataSfarsitITP, DataInceputAsigurare, DataSfarsitAsigurare, SoferID, UtilizatorID)
VALUES (4, 'B-987-JKL', 'BMW 3 Series', TO_DATE('2021-01-01', 'YYYY-MM-DD'), 'Albastru', 'Motorin?', TO_DATE('2022-04-10', 'YYYY-MM-DD'), TO_DATE('2023-04-10', 'YYYY-MM-DD'), TO_DATE('2022-05-15', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'), 4, 3);

INSERT INTO Vehicule_AMO (VehiculID, NumarInmatriculare, MarcaModel, AnFabricatie, Culoare, TipCombustibil, DataInceputITP, DataSfarsitITP, DataInceputAsigurare, DataSfarsitAsigurare, SoferID, UtilizatorID)
VALUES (5, 'B-654-MNO', 'Mercedes-Benz C-Class', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'Argintiu', 'Benzin?', TO_DATE('2022-05-20', 'YYYY-MM-DD'), TO_DATE('2023-05-20', 'YYYY-MM-DD'), TO_DATE('2022-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 5, 3);

SELECT * FROM Vehicule_AMO;

-- 6.
INSERT INTO Sarcini_AMO (SarcinaID, NumeSarcina, DescriereSarcina, TermenLimitaSarcina, UtilizatorID)
VALUES (1, 'Implementare func?ionalitate', 'Implementarea unei noi func?ionalit??i �n aplica?ie', TO_DATE('2022-01-20', 'YYYY-MM-DD'), 1);

INSERT INTO Sarcini_AMO (SarcinaID, NumeSarcina, DescriereSarcina, TermenLimitaSarcina, UtilizatorID)
VALUES (2, 'Testare software', 'Testarea ?i depanarea erorilor �n aplica?ie', TO_DATE('2022-02-25', 'YYYY-MM-DD'), 1);

INSERT INTO Sarcini_AMO (SarcinaID, NumeSarcina, DescriereSarcina, TermenLimitaSarcina, UtilizatorID)
VALUES (3, 'Raport lunar', 'Generarea rapoartelor de activitate lunar?', TO_DATE('2022-03-15', 'YYYY-MM-DD'), 2);

INSERT INTO Sarcini_AMO (SarcinaID, NumeSarcina, DescriereSarcina, TermenLimitaSarcina, UtilizatorID)
VALUES (4, '�nt�lnire cu clien?ii', 'Organizarea unei �nt�lniri pentru discutarea cerin?elor clien?ilor', TO_DATE('2022-04-05', 'YYYY-MM-DD'), 3);

INSERT INTO Sarcini_AMO (SarcinaID, NumeSarcina, DescriereSarcina, TermenLimitaSarcina, UtilizatorID)
VALUES (5, 'Optimizare baz? de date', 'Optimizarea performan?ei bazei de date', TO_DATE('2022-05-10', 'YYYY-MM-DD'), 3);

SELECT * FROM Sarcini_AMO;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cuprins
-- PARTEA A III-A: IMPLEMENTAREA BDR UTILIZÂND ORACLE PL/ SQL
-- a. EXEMPLIFICARE CONCEPTE PL/SQL:
--   a1. CURSOARE
--   a2. TRIGGERE
--   a3. FUNCȚII
--   a4. PROCEDURI ACTUALIZARE TABELE
--   a5. PROCEDURI DE (MATEMATICE) DE CALCUL
-- b. DEFINIRE APLICAȚII MATEMATICE/INFORMATICE: TEHNICI DE PROGRAMARE sau CERINȚE MATEMATICE/SOLUȚII INFORMATICE

set serveroutput on;
-- a. EXEMPLIFICARE CONCEPTE PL/SQL:
-- a1. CURSOARE;

-- 1/CURSOARE. Afișarea utilizatorilor cu sarcini restante
-- Cerință: Creează un cursor pentru a afișa utilizatorii care au sarcini al căror termen limită este depășit.

-- Soluție:
DECLARE
   CURSOR cur_SarciniRestante IS
      SELECT u.Nume, u.Prenume, s.NumeSarcina, s.TermenLimitaSarcina
      FROM Utilizatori_AMO u
      JOIN Sarcini_AMO s ON u.UtilizatorID = s.UtilizatorID
      WHERE s.TermenLimitaSarcina < SYSDATE;

   v_Nume VARCHAR2(50);
   v_Prenume VARCHAR2(50);
   v_NumeSarcina VARCHAR2(100);
   v_TermenLimita DATE;
BEGIN
   OPEN cur_SarciniRestante;
   LOOP
      FETCH cur_SarciniRestante INTO v_Nume, v_Prenume, v_NumeSarcina, v_TermenLimita;
      EXIT WHEN cur_SarciniRestante%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('Nume: ' || v_Nume || ', Prenume: ' || v_Prenume ||
                           ', Sarcina: ' || v_NumeSarcina || ', Termen: ' || v_TermenLimita);
   END LOOP;
   CLOSE cur_SarciniRestante;
END;

--------------------------------------------------------------------------------


-- 2/CURSOARE. Numărarea vehiculelor pe fiecare utilizator
-- Cerință: Creează un cursor care afișează utilizatorii și numărul de vehicule asociate fiecăruia.

-- Soluție:
DECLARE
   CURSOR cur_Vehicule IS
      SELECT u.Nume, u.Prenume, COUNT(v.VehiculID) AS NumarVehicule
      FROM Utilizatori_AMO u
      LEFT JOIN Vehicule_AMO v ON u.UtilizatorID = v.UtilizatorID
      GROUP BY u.Nume, u.Prenume;

   v_Nume VARCHAR2(50);
   v_Prenume VARCHAR2(50);
   v_NumarVehicule NUMBER;
BEGIN
   OPEN cur_Vehicule;
   LOOP
      FETCH cur_Vehicule INTO v_Nume, v_Prenume, v_NumarVehicule;
      EXIT WHEN cur_Vehicule%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('Nume: ' || v_Nume || ', Prenume: ' || v_Prenume ||
                           ', Numar Vehicule: ' || v_NumarVehicule);
   END LOOP;
   CLOSE cur_Vehicule;
END;


--------------------------------------------------------------------------------

-- 3/CURSOARE. Afișarea documentelor încărcate într-o anumită lună
-- Cerință: Creează un cursor care afișează documentele încărcate într-o anumită lună și anul corespunzător.

-- Soluție:
DECLARE
   CURSOR cur_DocumenteLuna IS
      SELECT NumeDocument, TipDocument, DataIncarcareDocument
      FROM Documente_AMO
      WHERE EXTRACT(MONTH FROM DataIncarcareDocument) = 1 -- Luna ianuarie
         AND EXTRACT(YEAR FROM DataIncarcareDocument) = 2022;

   v_NumeDocument VARCHAR2(100);
   v_TipDocument VARCHAR2(50);
   v_DataIncarcare DATE;
BEGIN
   OPEN cur_DocumenteLuna;

   LOOP
      FETCH cur_DocumenteLuna INTO v_NumeDocument, v_TipDocument, v_DataIncarcare;
      EXIT WHEN cur_DocumenteLuna%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('Document: ' || v_NumeDocument || ', Tip: ' || v_TipDocument ||
                           ', Încărcat la: ' || TO_CHAR(v_DataIncarcare, 'DD-MON-YYYY'));
   END LOOP;

   CLOSE cur_DocumenteLuna;
END;


--------------------------------------------------------------------------------


-- 4/CURSOARE. Afișarea șoferilor și vehiculelor asociate
-- Cerință: Creează un cursor care afișează șoferii și numărul de vehicule asociate fiecăruia.

-- Soluție:
DECLARE
   CURSOR cur_Soferi IS
      SELECT s.Nume, s.Prenume, COUNT(v.VehiculID) AS NumarVehicule
      FROM Soferi_AMO s
      LEFT JOIN Vehicule_AMO v ON s.SoferID = v.SoferID
      GROUP BY s.Nume, s.Prenume;

   v_Nume VARCHAR2(50);
   v_Prenume VARCHAR2(50);
   v_NumarVehicule NUMBER;
BEGIN
   OPEN cur_Soferi;
   LOOP
      FETCH cur_Soferi INTO v_Nume, v_Prenume, v_NumarVehicule;
      EXIT WHEN cur_Soferi%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('Nume: ' || v_Nume || ', Prenume: ' || v_Prenume ||
                           ', Numar Vehicule: ' || v_NumarVehicule);
   END LOOP;
   CLOSE cur_Soferi;
END;


--------------------------------------------------------------------------------


-- 5/CURSOARE. Numărarea șoferilor angajați într-un anumit an
-- Cerință: Creează un cursor care numără șoferii care au fost angajați într-un anumit an.

-- Soluție:
DECLARE
   CURSOR cur_SoferiAngajati IS
      SELECT Nume, Prenume, DataAngajarii
      FROM Soferi_AMO
      WHERE EXTRACT(YEAR FROM DataAngajarii) = 2022;
   v_Nume VARCHAR2(50);
   v_Prenume VARCHAR2(50);
   v_DataAngajarii DATE;
   v_Count NUMBER := 0;
BEGIN
   OPEN cur_SoferiAngajati;
   LOOP
      FETCH cur_SoferiAngajati INTO v_Nume, v_Prenume, v_DataAngajarii;
      EXIT WHEN cur_SoferiAngajati%NOTFOUND;
      v_Count := v_Count + 1;
      DBMS_OUTPUT.PUT_LINE('Șofer: ' || v_Nume || ' ' || v_Prenume ||
                           ', Angajat la: ' || TO_CHAR(v_DataAngajarii, 'DD-MON-YYYY'));
   END LOOP;
   CLOSE cur_SoferiAngajati;
   DBMS_OUTPUT.PUT_LINE('Numărul total de șoferi angajați în 2022 este: ' || v_Count);
END;


--------------------------------------------------------------------------------

-- 6/CURSOARE. Afișarea documentelor încărcate de utilizatori
-- Cerință: Creează un cursor care afișează documentele încărcate de utilizatori, împreună cu numele utilizatorilor.

-- Soluție:
DECLARE
   CURSOR cur_Documente IS
      SELECT d.NumeDocument, d.TipDocument, d.DataIncarcareDocument, u.Nume, u.Prenume
      FROM Documente_AMO d
      JOIN Utilizatori_AMO u ON d.UtilizatorID = u.UtilizatorID;

   v_NumeDocument VARCHAR2(100);
   v_TipDocument VARCHAR2(50);
   v_DataIncarcare DATE;
   v_Nume VARCHAR2(50);
   v_Prenume VARCHAR2(50);
BEGIN
   OPEN cur_Documente;
   LOOP
      FETCH cur_Documente INTO v_NumeDocument, v_TipDocument, v_DataIncarcare, v_Nume, v_Prenume;
      EXIT WHEN cur_Documente%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('Document: ' || v_NumeDocument || ', Tip: ' || v_TipDocument ||
                           ', Încărcat la: ' || v_DataIncarcare || 
                           ', De utilizator: ' || v_Nume || ' ' || v_Prenume);
   END LOOP;
   CLOSE cur_Documente;
END;


--------------------------------------------------------------------------------

-- 7/CURSOARE. Numărarea sarcinilor pentru fiecare utilizator
-- Cerință: Creează un cursor care afișează utilizatorii și numărul de sarcini asociate fiecăruia.

-- Soluție:
DECLARE
   CURSOR cur_Sarcini IS
      SELECT u.Nume, u.Prenume, COUNT(s.SarcinaID) AS NumarSarcini
      FROM Utilizatori_AMO u
      LEFT JOIN Sarcini_AMO s ON u.UtilizatorID = s.UtilizatorID
      GROUP BY u.Nume, u.Prenume;

   v_Nume VARCHAR2(50);
   v_Prenume VARCHAR2(50);
   v_NumarSarcini NUMBER;
BEGIN
   OPEN cur_Sarcini;
   LOOP
      FETCH cur_Sarcini INTO v_Nume, v_Prenume, v_NumarSarcini;
      EXIT WHEN cur_Sarcini%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('Nume: ' || v_Nume || ', Prenume: ' || v_Prenume ||
                           ', Sarcini: ' || v_NumarSarcini);
   END LOOP;
   CLOSE cur_Sarcini;
END;


--------------------------------------------------------------------------------

-- 8/CURSOARE. Afișarea sarcinilor cu termen limită apropiat
-- Cerință: Creează un cursor care afișează sarcinile care au termenul limită în următoarele 7 zile.

-- Soluție:
DECLARE
   CURSOR cur_SarciniApropiate IS
      SELECT NumeSarcina, DescriereSarcina, TermenLimitaSarcina
      FROM Sarcini_AMO
      WHERE TermenLimitaSarcina BETWEEN SYSDATE AND SYSDATE + 7;
   v_NumeSarcina VARCHAR2(100);
   v_DescriereSarcina VARCHAR2(150);
   v_TermenLimita DATE;
BEGIN
   OPEN cur_SarciniApropiate;
   LOOP
      FETCH cur_SarciniApropiate INTO v_NumeSarcina, v_DescriereSarcina, v_TermenLimita;
      EXIT WHEN cur_SarciniApropiate%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Sarcina: ' || v_NumeSarcina || ', Descriere: ' || v_DescriereSarcina ||
                           ', Termen limită: ' || TO_CHAR(v_TermenLimita, 'DD-MON-YYYY'));
   END LOOP;
   CLOSE cur_SarciniApropiate;
END;


--------------------------------------------------------------------------------

-- 9/CURSOARE. Calcularea vechimii șoferilor în companie
-- Cerință: Creează un cursor care calculează și afișează vechimea (în ani) a fiecărui șofer în companie.

-- Soluție:
DECLARE
   CURSOR cur_SoferiVechime IS
      SELECT Nume, Prenume, DataAngajarii
      FROM Soferi_AMO
      WHERE DataAngajarii IS NOT NULL;

   v_Nume VARCHAR2(50);
   v_Prenume VARCHAR2(50);
   v_DataAngajarii DATE;
   v_Vechime NUMBER;
BEGIN
   OPEN cur_SoferiVechime;
   LOOP
      FETCH cur_SoferiVechime INTO v_Nume, v_Prenume, v_DataAngajarii;
      EXIT WHEN cur_SoferiVechime%NOTFOUND;

      v_Vechime := ROUND(MONTHS_BETWEEN(SYSDATE, v_DataAngajarii) / 12, 1);

      DBMS_OUTPUT.PUT_LINE('Șofer: ' || v_Nume || ' ' || v_Prenume || ', Vechime: ' || v_Vechime || ' ani');
   END LOOP;
   CLOSE cur_SoferiVechime;
END;


--------------------------------------------------------------------------------

-- 10/CURSOARE. Afișarea contractelor și a utilizatorilor asociați
-- Cerință: Creează un cursor care afișează contractele împreună cu utilizatorii cărora le aparțin.

-- Soluție:
DECLARE
   CURSOR cur_Contracte IS
      SELECT c.NumeContract, c.TipContract, c.DataInceputContract, c.DataSfarsitContract, u.Nume, u.Prenume
      FROM Contracte_AMO c
      JOIN Utilizatori_AMO u ON c.UtilizatorID = u.UtilizatorID;

   v_NumeContract VARCHAR2(100);
   v_TipContract VARCHAR2(50);
   v_DataInceput DATE;
   v_DataSfarsit DATE;
   v_Nume VARCHAR2(50);
   v_Prenume VARCHAR2(50);
BEGIN
   OPEN cur_Contracte;
   LOOP
      FETCH cur_Contracte INTO v_NumeContract, v_TipContract, v_DataInceput, v_DataSfarsit, v_Nume, v_Prenume;
      EXIT WHEN cur_Contracte%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('Contract: ' || v_NumeContract || ', Tip: ' || v_TipContract ||
                           ', Perioadă: ' || v_DataInceput || ' - ' || v_DataSfarsit ||
                           ', Utilizator: ' || v_Nume || ' ' || v_Prenume);
   END LOOP;
   CLOSE cur_Contracte;
END;



------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cuprins
-- PARTEA A III-A: IMPLEMENTAREA BDR UTILIZÂND ORACLE PL/ SQL
-- a. EXEMPLIFICARE CONCEPTE PL/SQL:
--   a1. CURSOARE
--   a2. TRIGGERE
--   a3. FUNCȚII
--   a4. PROCEDURI ACTUALIZARE TABELE
--   a5. PROCEDURI DE (MATEMATICE) DE CALCUL
-- b. DEFINIRE APLICAȚII MATEMATICE/INFORMATICE: TEHNICI DE PROGRAMARE sau CERINȚE MATEMATICE/SOLUȚII INFORMATICE

set serveroutput on;
-- a. EXEMPLIFICARE CONCEPTE PL/SQL:
-- a2. TRIGGERE;

--------------------------------------------------------------------------------

-- 1/TRIGGERE. Logare utilizatori noi
-- Cerință: Creează un trigger care salvează în tabelul `LOG_Utilizatori` informații despre utilizatorii nou adăugați în `Utilizatori_AMO`.

-- Soluție:
CREATE TABLE LOG_Utilizatori (
   LogID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
   UtilizatorID NUMBER(4),
   DataAdaugare DATE DEFAULT SYSDATE
);

CREATE OR REPLACE TRIGGER trg_InsertLogUtilizatori
AFTER INSERT ON Utilizatori_AMO
FOR EACH ROW
BEGIN
   INSERT INTO LOG_Utilizatori (UtilizatorID) VALUES (:NEW.UtilizatorID);
END;


--------------------------------------------------------------------------------

-- 2/TRIGGERE. Prevenirea utilizatorilor cu același email
--Creează un trigger care verifică dacă un email există deja în tabelul `Utilizatori_AMO` înainte de inserare.

--Soluție:
CREATE OR REPLACE TRIGGER trg_CheckDuplicateEmail
BEFORE INSERT OR UPDATE ON Utilizatori_AMO
FOR EACH ROW
DECLARE
   v_Count NUMBER;
BEGIN
   SELECT COUNT(*)
   INTO v_Count
   FROM Utilizatori_AMO
   WHERE Email = :NEW.Email AND UtilizatorID != :NEW.UtilizatorID;

   IF v_Count > 0 THEN
      RAISE_APPLICATION_ERROR(-20001, 'Email-ul există deja!');
   END IF;
END;


--------------------------------------------------------------------------------

-- 3/TRIGGERE. Actualizare automată a salariului șoferilor
--Cerință: Creează un trigger care actualizează `DataSalariu` pentru șoferi la ultima zi a lunii dacă este modificată orice altă informație.

--Soluție:

CREATE OR REPLACE TRIGGER trg_UpdateDataSalariu
BEFORE UPDATE ON Soferi_AMO
FOR EACH ROW
BEGIN
   :NEW.DataSalariu := LAST_DAY(SYSDATE);
END;


--------------------------------------------------------------------------------

-- 4/TRIGGERE. Validarea datelor vehiculelor
-- Cerință: Creează un trigger care previne adăugarea unui vehicul cu `DataSfarsitITP` mai mică decât `DataInceputITP`.

-- Soluție:

CREATE OR REPLACE TRIGGER trg_ValidateVehiculeITP
BEFORE INSERT OR UPDATE ON Vehicule_AMO
FOR EACH ROW
BEGIN
   IF :NEW.DataSfarsitITP < :NEW.DataInceputITP THEN
      RAISE_APPLICATION_ERROR(-20002, 'DataSfarsitITP trebuie să fie mai mare decât DataInceputITP!');
   END IF;
END;


--------------------------------------------------------------------------------

-- 5/TRIGGERE. Logare ștergere documente
-- Cerință: Creează un trigger care salvează în tabelul `LOG_Documente` informații despre documentele șterse.

-- Soluție:

CREATE TABLE LOG_Documente (
   LogID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
   DocumentID NUMBER(4),
   DataStergere DATE DEFAULT SYSDATE
);

CREATE OR REPLACE TRIGGER trg_LogStergereDocumente
AFTER DELETE ON Documente_AMO
FOR EACH ROW
BEGIN
   INSERT INTO LOG_Documente (DocumentID) VALUES (:OLD.DocumentID);
END;


--------------------------------------------------------------------------------

--6/TRIGGERE. Prevenirea ștergerii unui utilizator activ
--Cerință: Creează un trigger care împiedică ștergerea unui utilizator dacă are vehicule, documente, sau sarcini asociate.

-- Soluție:
CREATE OR REPLACE TRIGGER trg_PreventDeleteUtilizator
BEFORE DELETE ON Utilizatori_AMO
FOR EACH ROW
DECLARE
   v_Count NUMBER;
BEGIN
   SELECT COUNT(*)
   INTO v_Count
   FROM Vehicule_AMO
   WHERE UtilizatorID = :OLD.UtilizatorID;

   IF v_Count > 0 THEN
      RAISE_APPLICATION_ERROR(-20003, 'Utilizatorul are vehicule asociate și nu poate fi șters!');
   END IF;
END;


--------------------------------------------------------------------------------

-- 7/TRIGGERE. Generare automată de parole temporare
--Cerință: Creează un trigger care generează o parolă temporară dacă utilizatorul este adăugat fără parolă.

-- Soluție:
CREATE OR REPLACE TRIGGER trg_GenerateTempPassword
BEFORE INSERT ON Utilizatori_AMO
FOR EACH ROW
BEGIN
   IF :NEW.Parola IS NULL THEN
      :NEW.Parola := DBMS_RANDOM.STRING('A', 10);
   END IF;
END;


--------------------------------------------------------------------------------

-- 8/TRIGGERE. Afișarea notificării pentru contractele expirate
-- Cerință: Creează un trigger care adaugă o notificare în tabelul `Notificari_AMO` dacă un contract este adăugat cu o dată de sfârșit deja expirată.

-- Soluție:
CREATE TABLE Notificari_AMO (
   NotificareID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
   Mesaj VARCHAR2(255),
   DataNotificare DATE DEFAULT SYSDATE
);

CREATE OR REPLACE TRIGGER trg_NotifyExpiredContracts
AFTER INSERT ON Contracte_AMO
FOR EACH ROW
BEGIN
   IF :NEW.DataSfarsitContract < SYSDATE THEN
      INSERT INTO Notificari_AMO (Mesaj)
      VALUES ('Contractul ' || :NEW.NumeContract || ' este deja expirat!');
   END IF;
END;


--------------------------------------------------------------------------------

-- 9/TRIGGERE. Prevenirea concediului simultan pentru șoferi
-- Cerință: Creează un trigger care verifică dacă un șofer este deja în concediu înainte de a seta `DataInceputConcediu`.

-- Soluție:
CREATE OR REPLACE TRIGGER trg_CheckSoferConcediu
BEFORE UPDATE ON Soferi_AMO
FOR EACH ROW
BEGIN
   IF :NEW.DataInceputConcediu IS NOT NULL AND :NEW.DataSfarsitConcediu IS NULL THEN
      RAISE_APPLICATION_ERROR(-20004, 'Șoferul este deja în concediu!');
   END IF;
END;


--------------------------------------------------------------------------------

-- 10/TRIGGERE. Prevenirea duplicării numărului de înmatriculare
-- Cerință: Creează un trigger care împiedică inserarea unui vehicul cu un număr de înmatriculare duplicat, ignorând spațiile sau literele mici/mari.

-- Soluție:
CREATE OR REPLACE TRIGGER trg_PreventDuplicateInmat
BEFORE INSERT OR UPDATE ON Vehicule_AMO
FOR EACH ROW
DECLARE
   v_Count NUMBER;
BEGIN
   SELECT COUNT(*)
   INTO v_Count
   FROM Vehicule_AMO
   WHERE UPPER(REPLACE(NumarInmatriculare, ' ', '')) = UPPER(REPLACE(:NEW.NumarInmatriculare, ' ', ''))
     AND VehiculID != :NEW.VehiculID;

   IF v_Count > 0 THEN
      RAISE_APPLICATION_ERROR(-20005, 'Numărul de înmatriculare există deja!');
   END IF;
END;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cuprins
-- PARTEA A III-A: IMPLEMENTAREA BDR UTILIZÂND ORACLE PL/ SQL
-- a. EXEMPLIFICARE CONCEPTE PL/SQL:
--   a1. CURSOARE
--   a2. TRIGGERE
--   a3. FUNCȚII
--   a4. PROCEDURI ACTUALIZARE TABELE
--   a5. PROCEDURI DE (MATEMATICE) DE CALCUL
-- b. DEFINIRE APLICAȚII MATEMATICE/INFORMATICE: TEHNICI DE PROGRAMARE sau CERINȚE MATEMATICE/SOLUȚII INFORMATICE

set serveroutput on;
-- a. EXEMPLIFICARE CONCEPTE PL/SQL:
-- a3. FUNCȚII

--------------------------------------------------------------------------------

-- 1/FUNCȚII. Calcularea vârstei unui șofer
-- Cerință: Creează o funcție care calculează vârsta unui șofer pe baza datei de naștere.

-- Soluție:
CREATE OR REPLACE FUNCTION CalculeazaVarstaSofer(
   p_DataNasterii DATE
) RETURN NUMBER IS
   v_Varsta NUMBER;
BEGIN
   v_Varsta := FLOOR(MONTHS_BETWEEN(SYSDATE, p_DataNasterii) / 12);
   RETURN v_Varsta;
END;

--Utilizare:
SELECT Nume, Prenume, CalculeazaVarstaSofer(DataNasterii) AS Varsta
FROM Soferi_AMO;

--------------------------------------------------------------------------------

-- 2/FUNCȚII. Calculul salariului anual al unui șofer
-- Cerință: Creează o funcție care calculează salariul anual pe baza unui salariu lunar dat.

-- Soluție:
CREATE OR REPLACE FUNCTION SalariuAnual(
   p_SalariuLunar NUMBER
) RETURN NUMBER IS
BEGIN
   RETURN p_SalariuLunar * 12;
END;

-- Utilizare:
SELECT Nume, Prenume, SalariuAnual(2500) AS Salariu_Anual
FROM Soferi_AMO;

--------------------------------------------------------------------------------

-- 3/FUNCȚII. Calculul mediei salariilor
-- Cerință: Creează o funcție care returnează media salariilor șoferilor.

-- Soluție:
CREATE OR REPLACE FUNCTION MediaSalariilor RETURN NUMBER IS
   v_Media NUMBER;
BEGIN
   SELECT AVG(EXTRACT(MONTH FROM SYSDATE) * 1000) INTO v_Media FROM Soferi_AMO;
   RETURN v_Media;
END;

--Utilizare:
SELECT MediaSalariilor() AS MediaSalarii FROM DUAL;

--------------------------------------------------------------------------------

-- 4/FUNCȚII. Verificarea existenței unui utilizator
-- Cerință: Creează o funcție care verifică dacă un utilizator cu un anumit ID există în tabel.

-- Soluție:
CREATE OR REPLACE FUNCTION ExistaUtilizator(
   p_UtilizatorID IN NUMBER
) RETURN VARCHAR2 IS
   v_Count NUMBER;
BEGIN
   SELECT COUNT(*) INTO v_Count FROM Utilizatori_AMO WHERE UtilizatorID = p_UtilizatorID;
   RETURN CASE WHEN v_Count > 0 THEN 'DA' ELSE 'NU' END;
END;

-- Utilizare:
SELECT ExistaUtilizator(3) AS Exista FROM DUAL;

--------------------------------------------------------------------------------

-- 5/FUNCȚII. Validarea unui număr de telefon
-- Cerință: Creează o funcție care verifică dacă un număr de telefon are lungimea de 10 caractere.

-- Soluție:
CREATE OR REPLACE FUNCTION ValideazaTelefon(
   p_Telefon VARCHAR2
) RETURN VARCHAR2 IS
BEGIN
   IF LENGTH(p_Telefon) = 10 THEN
      RETURN 'Valid';
   ELSE
      RETURN 'Invalid';
   END IF;
END;

-- Utilizare:
SELECT Telefon, ValideazaTelefon(Telefon) AS Validitate
FROM Utilizatori_AMO;

--------------------------------------------------------------------------------

-- 6/FUNCȚII. Obținerea vehiculelor pe bază de combustibil
-- Cerință: Creează o funcție care returnează numărul de vehicule care folosesc un anumit tip de combustibil.

-- Soluție:
CREATE OR REPLACE FUNCTION NumarVehiculeCombustibil(
   p_TipCombustibil IN VARCHAR2
) RETURN NUMBER IS
   v_Count NUMBER;
BEGIN
   SELECT COUNT(*) INTO v_Count FROM Vehicule_AMO WHERE TipCombustibil = p_TipCombustibil;
   RETURN v_Count;
END;

--Utilizare:
SELECT NumarVehiculeCombustibil('Benzină') AS Vehicule FROM DUAL;

--------------------------------------------------------------------------------

-- 7/FUNCȚII. Obținerea tipului unui document
-- Cerință: Creează o funcție care returnează tipul unui document pe baza ID-ului.

-- Soluție:
CREATE OR REPLACE FUNCTION TipDocument(
   p_DocumentID NUMBER
) RETURN VARCHAR2 IS
   v_Tip VARCHAR2(50);
BEGIN
   SELECT TipDocument
   INTO v_Tip
   FROM Documente_AMO
   WHERE DocumentID = p_DocumentID;
   RETURN v_Tip;
END;

-- Utilizare:
SELECT DocumentID, TipDocument(DocumentID) AS Tip
FROM Documente_AMO;

--------------------------------------------------------------------------------

-- 8/FUNCȚII. Calculul procentului documentelor încărcate într-un an
-- Cerință: Creează o funcție care calculează procentul documentelor încărcate într-un anumit an.

-- Soluție:
CREATE OR REPLACE FUNCTION ProcentDocumenteAn(
   p_An IN NUMBER
) RETURN NUMBER IS
   v_Total NUMBER;
   v_Anual NUMBER;
BEGIN
   SELECT COUNT(*) INTO v_Total FROM Documente_AMO;
   SELECT COUNT(*) INTO v_Anual FROM Documente_AMO WHERE EXTRACT(YEAR FROM DataIncarcareDocument) = p_An;

   RETURN (v_Anual / v_Total) * 100;
END;

-- Utilizare:
SELECT ProcentDocumenteAn(2022) AS Procent FROM DUAL;

--------------------------------------------------------------------------------

-- 9/FUNCȚII. Obținerea celei mai vechi înregistrări
-- Cerință: Creează o funcție care returnează ID-ul celei mai vechi înregistrări dintr-un tabel dat.

-- Soluție:
CREATE OR REPLACE FUNCTION CelMaiVechi(
   p_Tabel IN VARCHAR2,
   p_ColoanaData IN VARCHAR2,
   p_IDColoana IN VARCHAR2
) RETURN NUMBER IS
   v_ID NUMBER;
BEGIN
   EXECUTE IMMEDIATE 'SELECT ' || p_IDColoana || ' FROM ' || p_Tabel ||
                     ' WHERE ' || p_ColoanaData || ' = (SELECT MIN(' || p_ColoanaData || ') FROM ' || p_Tabel || ')'
   INTO v_ID;

   RETURN v_ID;
END;

--Utilizare:
SELECT CelMaiVechi('Documente_AMO', 'DataIncarcareDocument', 'DocumentID') AS VechiID FROM DUAL;

--------------------------------------------------------------------------------

-- 10/FUNCȚII. Calculul sumei sarcinilor per utilizator
-- Cerință: Creează o funcție care calculează suma sarcinilor asociate unui utilizator.

-- Soluție:
CREATE OR REPLACE FUNCTION SumaSarciniUtilizator(
   p_UtilizatorID IN NUMBER
) RETURN NUMBER IS
   v_Count NUMBER;
BEGIN
   SELECT COUNT(*) INTO v_Count FROM Sarcini_AMO WHERE UtilizatorID = p_UtilizatorID;
   RETURN v_Count;
END;

-- Utilizare:
SELECT SumaSarciniUtilizator(2) AS Sarcini FROM DUAL;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cuprins
-- PARTEA A III-A: IMPLEMENTAREA BDR UTILIZÂND ORACLE PL/ SQL
-- a. EXEMPLIFICARE CONCEPTE PL/SQL:
--   a1. CURSOARE
--   a2. TRIGGERE
--   a3. FUNCȚII
--   a4. PROCEDURI ACTUALIZARE TABELE
--   a5. PROCEDURI DE (MATEMATICE) DE CALCUL
-- b. DEFINIRE APLICAȚII MATEMATICE/INFORMATICE: TEHNICI DE PROGRAMARE sau CERINȚE MATEMATICE/SOLUȚII INFORMATICE

set serveroutput on;
-- a. EXEMPLIFICARE CONCEPTE PL/SQL:
--  a4. PROCEDURI ACTUALIZARE TABELE

--------------------------------------------------------------------------------

-- 1/PROCEDURI ACTUALIZARE TABELE. Actualizarea numelui complet al unui utilizator
-- Cerință: Creează o procedură care actualizează numele și prenumele unui utilizator pe baza ID-ului.

-- Soluție:
CREATE OR REPLACE PROCEDURE UpdateNumeUtilizator(
   p_UtilizatorID IN NUMBER,
   p_Nume IN VARCHAR2,
   p_Prenume IN VARCHAR2
) AS
BEGIN
   UPDATE Utilizatori_AMO
   SET Nume = p_Nume, Prenume = p_Prenume
   WHERE UtilizatorID = p_UtilizatorID;

   DBMS_OUTPUT.PUT_LINE('Numele utilizatorului a fost actualizat cu succes!');
END;

-- Utilizare:
EXEC UpdateNumeUtilizator(1, 'Ionescu', 'Vasile');

--------------------------------------------------------------------------------

-- 2/PROCEDURI ACTUALIZARE TABELE. Actualizarea salariului șoferilor
-- Cerință: Creează o procedură care actualizează salariul unui șofer pe baza ID-ului acestuia.

-- Soluție:
CREATE OR REPLACE PROCEDURE UpdateSalariuSofer(
   p_SoferID IN NUMBER,
   p_NouSalariu IN DATE
) AS
BEGIN
   UPDATE Soferi_AMO
   SET DataSalariu = p_NouSalariu
   WHERE SoferID = p_SoferID;

   DBMS_OUTPUT.PUT_LINE('Salariul șoferului a fost actualizat cu succes!');
END;

-- Utilizare:
EXEC UpdateSalariuSofer(2, TO_DATE('2025-01-01', 'YYYY-MM-DD'));

--------------------------------------------------------------------------------

-- 3/PROCEDURI ACTUALIZARE TABELE. Actualizarea detaliilor unui vehicul
-- Cerință: Creează o procedură care actualizează marca și modelul unui vehicul.

-- Soluție:
CREATE OR REPLACE PROCEDURE UpdateVehicul(
   p_VehiculID IN NUMBER,
   p_MarcaModel IN VARCHAR2
) AS
BEGIN
   UPDATE Vehicule_AMO
   SET MarcaModel = p_MarcaModel
   WHERE VehiculID = p_VehiculID;

   DBMS_OUTPUT.PUT_LINE('Detaliile vehiculului au fost actualizate cu succes!');
END;

-- Utilizare:
EXEC UpdateVehicul(1, 'Tesla Model S');

--------------------------------------------------------------------------------

-- 4/PROCEDURI ACTUALIZARE TABELE. Actualizarea termenului limită al unei sarcini
-- Cerință: Creează o procedură care modifică termenul limită al unei sarcini pe baza ID-ului.

--Soluție:
CREATE OR REPLACE PROCEDURE UpdateTermenLimita(
   p_SarcinaID IN NUMBER,
   p_NouTermen IN DATE
) AS
BEGIN
   UPDATE Sarcini_AMO
   SET TermenLimitaSarcina = p_NouTermen
   WHERE SarcinaID = p_SarcinaID;

   DBMS_OUTPUT.PUT_LINE('Termenul limită al sarcinii a fost actualizat!');
END;

-- Utilizare:
EXEC UpdateTermenLimita(3, TO_DATE('2025-01-15', 'YYYY-MM-DD'));

--------------------------------------------------------------------------------

-- 5/PROCEDURI ACTUALIZARE TABELE. Actualizarea datelor unui contract
-- Cerință: Creează o procedură care modifică tipul și perioada unui contract.

--Soluție:
CREATE OR REPLACE PROCEDURE UpdateContract(
   p_ContractID IN NUMBER,
   p_TipContract IN VARCHAR2,
   p_DataInceput IN DATE,
   p_DataSfarsit IN DATE
) AS
BEGIN
   UPDATE Contracte_AMO
   SET TipContract = p_TipContract,
       DataInceputContract = p_DataInceput,
       DataSfarsitContract = p_DataSfarsit
   WHERE ContractID = p_ContractID;

   DBMS_OUTPUT.PUT_LINE('Contractul a fost actualizat!');
END;

-- Utilizare:
EXEC UpdateContract(2, 'Consultanță', TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2026-02-01', 'YYYY-MM-DD'));

--------------------------------------------------------------------------------

-- 6/PROCEDURI ACTUALIZARE TABELE. Resetarea parolei unui utilizator
-- Cerință: Creează o procedură care resetează parola unui utilizator, setând o parolă temporară.

-- Soluție:
CREATE OR REPLACE PROCEDURE ResetParola(
   p_UtilizatorID IN NUMBER,
   p_ParolaNoua IN VARCHAR2
) AS
BEGIN
   UPDATE Utilizatori_AMO
   SET Parola = p_ParolaNoua
   WHERE UtilizatorID = p_UtilizatorID;

   DBMS_OUTPUT.PUT_LINE('Parola utilizatorului a fost resetată!');
END;

-- Utilizare:
EXEC ResetParola(1, 'ParolaNoua123');

--------------------------------------------------------------------------------

-- 7/PROCEDURI ACTUALIZARE TABELE. Actualizarea șoferului pentru un vehicul
-- Cerință: Creează o procedură care schimbă șoferul asociat unui vehicul.

-- Soluție:
CREATE OR REPLACE PROCEDURE UpdateSoferVehicul(
   p_VehiculID IN NUMBER,
   p_SoferID IN NUMBER
) AS
BEGIN
   UPDATE Vehicule_AMO
   SET SoferID = p_SoferID
   WHERE VehiculID = p_VehiculID;

   DBMS_OUTPUT.PUT_LINE('Șoferul vehiculului a fost actualizat!');
END;

-- Utilizare:
EXEC UpdateSoferVehicul(1, 3);

--------------------------------------------------------------------------------

-- 8/PROCEDURI ACTUALIZARE TABELE. Actualizarea datei ITP
-- Cerință: Creează o procedură care modifică datele de început și sfârșit ale inspecției tehnice periodice pentru un vehicul.

-- Soluție:
CREATE OR REPLACE PROCEDURE UpdateITP(
   p_VehiculID IN NUMBER,
   p_DataInceput IN DATE,
   p_DataSfarsit IN DATE
) AS
BEGIN
   UPDATE Vehicule_AMO
   SET DataInceputITP = p_DataInceput,
       DataSfarsitITP = p_DataSfarsit
   WHERE VehiculID = p_VehiculID;

   DBMS_OUTPUT.PUT_LINE('Datele ITP au fost actualizate!');
END;

-- Utilizare:
EXEC UpdateITP(1, TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2026-01-01', 'YYYY-MM-DD'));

--------------------------------------------------------------------------------

-- 9. Actualizarea tipului unui document
-- Cerință: Creează o procedură care modifică tipul unui document în funcție de ID-ul său.

-- Soluție:
CREATE OR REPLACE PROCEDURE UpdateTipDocument(
   p_DocumentID IN NUMBER,
   p_TipDocumentNou IN VARCHAR2
) AS
BEGIN
   UPDATE Documente_AMO
   SET TipDocument = p_TipDocumentNou
   WHERE DocumentID = p_DocumentID;

   DBMS_OUTPUT.PUT_LINE('Tipul documentului a fost actualizat!');
END;

-- Utilizare:
EXEC UpdateTipDocument(3, 'Certificat');

--------------------------------------------------------------------------------

-- 10/PROCEDURI ACTUALIZARE TABELE. Actualizarea detaliilor concediului unui șofer
-- Cerință: Creează o procedură care modifică datele de început și sfârșit ale concediului pentru un șofer.

-- Soluție:
CREATE OR REPLACE PROCEDURE UpdateConcediuSofer(
   p_SoferID IN NUMBER,
   p_DataInceput IN DATE,
   p_DataSfarsit IN DATE
) AS
BEGIN
   UPDATE Soferi_AMO
   SET DataInceputConcediu = p_DataInceput,
       DataSfarsitConcediu = p_DataSfarsit
   WHERE SoferID = p_SoferID;

   DBMS_OUTPUT.PUT_LINE('Datele concediului au fost actualizate!');
END;

-- Utilizare:
EXEC UpdateConcediuSofer(2, TO_DATE('2025-06-01', 'YYYY-MM-DD'), TO_DATE('2025-06-15', 'YYYY-MM-DD'));


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cuprins
-- PARTEA A III-A: IMPLEMENTAREA BDR UTILIZÂND ORACLE PL/ SQL
-- a. EXEMPLIFICARE CONCEPTE PL/SQL:
--   a1. CURSOARE
--   a2. TRIGGERE
--   a3. FUNCȚII
--   a4. PROCEDURI ACTUALIZARE TABELE
--   a5. PROCEDURI DE (MATEMATICE) DE CALCUL
-- b. DEFINIRE APLICAȚII MATEMATICE/INFORMATICE: TEHNICI DE PROGRAMARE sau CERINȚE MATEMATICE/SOLUȚII INFORMATICE

set serveroutput on;
-- a. EXEMPLIFICARE CONCEPTE PL/SQL:
--  a5. PROCEDURI DE (MATEMATICE) DE CALCUL

--------------------------------------------------------------------------------

-- 1/PROCEDURI DE (MATEMATICE) DE CALCUL. Calculul sumei salariilor șoferilor
-- Cerință: Creează o procedură care calculează suma salariilor tuturor șoferilor și o afișează.

-- Soluție:
CREATE OR REPLACE PROCEDURE CalculeazaSumaSalarii IS
   v_SumaSalarii NUMBER;
BEGIN
   SELECT SUM(EXTRACT(MONTH FROM SYSDATE) * 1000) INTO v_SumaSalarii FROM Soferi_AMO;
   DBMS_OUTPUT.PUT_LINE('Suma totală a salariilor șoferilor este: ' || v_SumaSalarii);
END;

-- Utilizare:
EXEC CalculeazaSumaSalarii;

--------------------------------------------------------------------------------

-- 2/PROCEDURI DE (MATEMATICE) DE CALCUL. Calculul duratei medii a contractelor
-- Cerință: Creează o procedură care calculează durata medie a contractelor din tabelul Contracte_AMO.

-- Soluție:
CREATE OR REPLACE PROCEDURE DurataMedieContracte IS
   v_DurataMedie NUMBER;
BEGIN
   SELECT AVG(DataSfarsitContract - DataInceputContract) INTO v_DurataMedie FROM Contracte_AMO;
   DBMS_OUTPUT.PUT_LINE('Durata medie a contractelor este: ' || v_DurataMedie || ' zile');
END;

-- Utilizare:
EXEC DurataMedieContracte;

--------------------------------------------------------------------------------

-- 3/PROCEDURI DE (MATEMATICE) DE CALCUL. Calculul numărului total de vehicule
-- Cerință: Creează o procedură care calculează numărul total de vehicule înregistrate în tabelul Vehicule_AMO.

-- Soluție:
CREATE OR REPLACE PROCEDURE NumarTotalVehicule IS
   v_NumVehicule NUMBER;
BEGIN
   SELECT COUNT(*) INTO v_NumVehicule FROM Vehicule_AMO;
   DBMS_OUTPUT.PUT_LINE('Numărul total de vehicule este: ' || v_NumVehicule);
END;

--Utilizare:
EXEC NumarTotalVehicule;

--------------------------------------------------------------------------------

-- 4/PROCEDURI DE (MATEMATICE) DE CALCUL. Calculul vârstei medii a șoferilor
-- Cerință: Creează o procedură care calculează vârsta medie a șoferilor.

-- Soluție:
CREATE OR REPLACE PROCEDURE VarstaMedieSoferi IS
   v_VarstaMedie NUMBER;
BEGIN
   SELECT AVG(FLOOR(MONTHS_BETWEEN(SYSDATE, DataNasterii) / 12)) INTO v_VarstaMedie FROM Soferi_AMO;
   DBMS_OUTPUT.PUT_LINE('Vârsta medie a șoferilor este: ' || v_VarstaMedie || ' ani');
END;

--Utilizare:
EXEC VarstaMedieSoferi;

--------------------------------------------------------------------------------

-- 5/PROCEDURI DE (MATEMATICE) DE CALCUL. Calculul procentului vehiculelor care folosesc benzină
-- Cerință: Creează o procedură care calculează procentul vehiculelor care folosesc benzină.

-- Soluție:
CREATE OR REPLACE PROCEDURE ProcentVehiculeBenzina IS
   v_TotalVehicule NUMBER;
   v_Benzina NUMBER;
   v_Procent NUMBER;
BEGIN
   SELECT COUNT(*) INTO v_TotalVehicule FROM Vehicule_AMO;
   SELECT COUNT(*) INTO v_Benzina FROM Vehicule_AMO WHERE TipCombustibil = 'Benzină';

   v_Procent := (v_Benzina / v_TotalVehicule) * 100;
   DBMS_OUTPUT.PUT_LINE('Procentul vehiculelor pe benzină este: ' || v_Procent || '%');
END;

--Utilizare:
EXEC ProcentVehiculeBenzina;

--------------------------------------------------------------------------------

-- 6/PROCEDURI DE (MATEMATICE) DE CALCUL. Calculul diferenței dintre cele mai lungi și cele mai scurte contracte
-- Cerință: Creează o procedură care calculează diferența în zile dintre contractul cel mai lung și cel mai scurt.

-- Soluție:
CREATE OR REPLACE PROCEDURE DiferentaDurataContracte IS
   v_MaxDurata NUMBER;
   v_MinDurata NUMBER;
   v_Diferenta NUMBER;
BEGIN
   SELECT MAX(DataSfarsitContract - DataInceputContract) INTO v_MaxDurata FROM Contracte_AMO;
   SELECT MIN(DataSfarsitContract - DataInceputContract) INTO v_MinDurata FROM Contracte_AMO;

   v_Diferenta := v_MaxDurata - v_MinDurata;
   DBMS_OUTPUT.PUT_LINE('Diferența de zile dintre cel mai lung și cel mai scurt contract este: ' || v_Diferenta);
END;

-- Utilizare:
EXEC DiferentaDurataContracte;

--------------------------------------------------------------------------------

-- 7/PROCEDURI DE (MATEMATICE) DE CALCUL. Calculul valorii maxime a salariului unui șofer
-- Cerință: Creează o procedură care returnează cel mai mare salariu din tabelul Soferi_AMO.

-- Soluție:
CREATE OR REPLACE PROCEDURE MaxSalariuSoferi IS
   v_MaxSalariu NUMBER;
BEGIN
   SELECT MAX(EXTRACT(MONTH FROM SYSDATE) * 1000) INTO v_MaxSalariu FROM Soferi_AMO;
   DBMS_OUTPUT.PUT_LINE('Salariul maxim al unui șofer este: ' || v_MaxSalariu);
END;

-- Utilizare:
EXEC MaxSalariuSoferi;

--------------------------------------------------------------------------------

-- 8/PROCEDURI DE (MATEMATICE) DE CALCUL. Calculul numărului de documente încărcate într-o lună
-- Cerință: Creează o procedură care calculează numărul de documente încărcate într-o anumită lună.

-- Soluție:
CREATE OR REPLACE PROCEDURE NumarDocumenteInLuna(
   p_Luna IN NUMBER
) IS
   v_Count NUMBER;
BEGIN
   SELECT COUNT(*) INTO v_Count FROM Documente_AMO WHERE EXTRACT(MONTH FROM DataIncarcareDocument) = p_Luna;
   DBMS_OUTPUT.PUT_LINE('Numărul de documente încărcate în luna ' || p_Luna || ' este: ' || v_Count);
END;

-- Utilizare:
EXEC NumarDocumenteInLuna(1);

--------------------------------------------------------------------------------

-- 9/PROCEDURI DE (MATEMATICE) DE CALCUL. Calculul sumelor vehiculelor pe șoferi
-- Cerință: Creează o procedură care calculează câte vehicule are fiecare șofer.

-- Soluție:
CREATE OR REPLACE PROCEDURE NumarVehiculePeSofer IS
   CURSOR cur IS
      SELECT s.Nume, s.Prenume, COUNT(v.VehiculID) AS NumarVehicule
      FROM Soferi_AMO s
      LEFT JOIN Vehicule_AMO v ON s.SoferID = v.SoferID
      GROUP BY s.Nume, s.Prenume;

   v_Nume VARCHAR2(50);
   v_Prenume VARCHAR2(50);
   v_NumarVehicule NUMBER;
BEGIN
   OPEN cur;
   LOOP
      FETCH cur INTO v_Nume, v_Prenume, v_NumarVehicule;
      EXIT WHEN cur%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('Șofer: ' || v_Nume || ' ' || v_Prenume || ', Vehicule: ' || v_NumarVehicule);
   END LOOP;
   CLOSE cur;
END;

-- Utilizare:
EXEC NumarVehiculePeSofer;

--------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cuprins
-- PARTEA A III-A: IMPLEMENTAREA BDR UTILIZÂND ORACLE PL/ SQL
-- a. EXEMPLIFICARE CONCEPTE PL/SQL:
--   a1. CURSOARE
--   a2. TRIGGERE
--   a3. FUNCȚII
--   a4. PROCEDURI ACTUALIZARE TABELE
--   a5. PROCEDURI DE (MATEMATICE) DE CALCUL
-- b. DEFINIRE APLICAȚII MATEMATICE/INFORMATICE: TEHNICI DE PROGRAMARE sau CERINȚE MATEMATICE/SOLUȚII INFORMATICE

set serveroutput on;
-- b. DEFINIRE APLICAȚII MATEMATICE/INFORMATICE: TEHNICI DE PROGRAMARE sau CERINȚE MATEMATICE/SOLUȚII INFORMATICE

--------------------------------------------------------------------------------

-- 1/DEFINIRE APLICAȚII MATEMATICE/INFORMATICE. Calcularea valorii maxime dintr-o listă de numere
-- Cerință: Creează o procedură care primește o listă de numere și returnează valoarea maximă.

--Soluție:
CREATE OR REPLACE FUNCTION GetMaxValue(
   p_Numbers IN SYS.ODCINUMBERLIST
) RETURN NUMBER IS
   v_MaxValue NUMBER;
BEGIN
   SELECT MAX(COLUMN_VALUE) INTO v_MaxValue FROM TABLE(p_Numbers);
   RETURN v_MaxValue;
END;

-- Utilizare:
SELECT GetMaxValue(SYS.ODCINUMBERLIST(3, 8, 1, 14, 6)) AS MaxValue FROM DUAL;

--------------------------------------------------------------------------------

-- 2/DEFINIRE APLICAȚII MATEMATICE/INFORMATICE. Calcularea sumei cifrelor unui număr
-- Cerință: Creează o funcție care calculează suma cifrelor unui număr dat.

-- Soluție:
CREATE OR REPLACE FUNCTION SumaCifrelor(
   p_Num IN NUMBER
) RETURN NUMBER IS
   v_Suma NUMBER := 0;
   v_Cifra NUMBER;
   v_Temp NUMBER := p_Num;
BEGIN
   WHILE v_Temp > 0 LOOP
      v_Cifra := MOD(v_Temp, 10);
      v_Suma := v_Suma + v_Cifra;
      v_Temp := FLOOR(v_Temp / 10);
   END LOOP;

   RETURN v_Suma;
END;

-- Utilizare:
SELECT SumaCifrelor(12345) AS Suma FROM DUAL;

--------------------------------------------------------------------------------

-- 3/DEFINIRE APLICAȚII MATEMATICE/INFORMATICE. Generarea unui șir Fibonacci
-- Cerință: Creează o funcție care generează al n-lea termen din șirul Fibonacci.

-- Soluție:
CREATE OR REPLACE FUNCTION Fibonacci(
   p_N IN NUMBER
) RETURN NUMBER IS
   v_A NUMBER := 0;
   v_B NUMBER := 1;
   v_Temp NUMBER;
BEGIN
   IF p_N = 0 THEN
      RETURN v_A;
   ELSIF p_N = 1 THEN
      RETURN v_B;
   ELSE
      FOR i IN 2..p_N LOOP
         v_Temp := v_A + v_B;
         v_A := v_B;
         v_B := v_Temp;
      END LOOP;
      RETURN v_B;
   END IF;
END;

--Utilizare:
SELECT Fibonacci(10) AS FibonacciValue FROM DUAL;

--------------------------------------------------------------------------------

-- 4/DEFINIRE APLICAȚII MATEMATICE/INFORMATICE. Determinarea dacă un număr este prim
-- Cerință: Creează o funcție care verifică dacă un număr este prim.

-- Soluție:
CREATE OR REPLACE FUNCTION IsPrime(
   p_Num IN NUMBER
) RETURN VARCHAR2 IS
   v_Factor NUMBER;
BEGIN
   IF p_Num <= 1 THEN
      RETURN 'NU';
   END IF;

   FOR v_Factor IN 2..FLOOR(SQRT(p_Num)) LOOP
      IF MOD(p_Num, v_Factor) = 0 THEN
         RETURN 'NU';
      END IF;
   END LOOP;

   RETURN 'DA';
END;

-- Utilizare:
SELECT IsPrime(17) AS EstePrim FROM DUAL;

--------------------------------------------------------------------------------

-- 5/DEFINIRE APLICAȚII MATEMATICE/INFORMATICE. Calcularea rădăcinii pătrate folosind metoda Babiloniană
-- Cerință: Creează o funcție care calculează rădăcina pătrată a unui număr folosind o abordare iterativă.

-- Soluție:
CREATE OR REPLACE FUNCTION SquareRoot(
   p_Num IN NUMBER
) RETURN NUMBER IS
   v_X NUMBER := p_Num / 2;
   v_Eps NUMBER := 0.00001;
BEGIN
   WHILE ABS(v_X * v_X - p_Num) > v_Eps LOOP
      v_X := (v_X + p_Num / v_X) / 2;
   END LOOP;

   RETURN v_X;
END;

-- Utilizare:
SELECT SquareRoot(49) AS Radical FROM DUAL;

--------------------------------------------------------------------------------

-- 6/DEFINIRE APLICAȚII MATEMATICE/INFORMATICE. Conversia unui număr din zecimal în binar
-- Cerință: Creează o funcție care convertește un număr întreg din sistemul zecimal în binar.

-- Soluție:
CREATE OR REPLACE FUNCTION ConvertToBinary(
   p_Num IN NUMBER
) RETURN VARCHAR2 IS
   v_Binary VARCHAR2(100) := '';
   v_Temp NUMBER := p_Num;
BEGIN
   WHILE v_Temp > 0 LOOP
      v_Binary := MOD(v_Temp, 2) || v_Binary;
      v_Temp := FLOOR(v_Temp / 2);
   END LOOP;

   RETURN v_Binary;
END;

-- Utilizare:
SELECT ConvertToBinary(10) AS Binar FROM DUAL;

--------------------------------------------------------------------------------

-- 7/DEFINIRE APLICAȚII MATEMATICE/INFORMATICE. Calcularea Factorialului unui Număr
-- Cerință: Creează o procedură care primește un număr ca parametru și returnează factorialul acestuia.

--Soluție:
CREATE OR REPLACE PROCEDURE CalculeazaFactorial(
   p_Num IN NUMBER,
   p_Factorial OUT NUMBER
) IS
   v_Result NUMBER := 1;
   v_Counter NUMBER;
BEGIN
   FOR v_Counter IN 1..p_Num LOOP
      v_Result := v_Result * v_Counter;
   END LOOP;

   p_Factorial := v_Result;

   DBMS_OUTPUT.PUT_LINE('Factorialul lui ' || p_Num || ' este: ' || p_Factorial);
END;

--Utilizare:
DECLARE
   v_Factorial NUMBER;
BEGIN
   CalculeazaFactorial(5, v_Factorial);
END;
/

--------------------------------------------------------------------------------

-- 8/DEFINIRE APLICAȚII MATEMATICE/INFORMATICE. Generarea unui număr aleator între două valori
-- Cerință: Creează o funcție care generează un număr aleator între două limite.

--Soluție:
CREATE OR REPLACE FUNCTION RandomNumber(
   p_Min IN NUMBER,
   p_Max IN NUMBER
) RETURN NUMBER IS
BEGIN
   RETURN TRUNC(DBMS_RANDOM.VALUE(p_Min, p_Max));
END;

--Utilizare:
SELECT RandomNumber(1, 100) AS RandomNumber FROM DUAL;

--------------------------------------------------------------------------------

-- 9/DEFINIRE APLICAȚII MATEMATICE/INFORMATICE. Calcularea ariei unui triunghi pe baza coordonatelor
-- Cerință: Creează o funcție care calculează aria unui triunghi dat de coordonatele celor trei vârfuri.

-- Soluție:
CREATE OR REPLACE FUNCTION TriangleArea(
   x1 IN NUMBER, y1 IN NUMBER,
   x2 IN NUMBER, y2 IN NUMBER,
   x3 IN NUMBER, y3 IN NUMBER
) RETURN NUMBER IS
BEGIN
   RETURN ABS((x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)) / 2);
END;

--Utilizare:
SELECT TriangleArea(0, 0, 4, 0, 0, 3) AS Aria FROM DUAL;

--------------------------------------------------------------------------------

-- 10/DEFINIRE APLICAȚII MATEMATICE/INFORMATICE. Calcularea sumei pătratelor numerelor dintr-un interval
-- Cerință: Creează o funcție care calculează suma pătratelor numerelor dintr-un interval dat.

-- Soluție:
CREATE OR REPLACE FUNCTION SumOfSquares(
   p_Min IN NUMBER,
   p_Max IN NUMBER
) RETURN NUMBER IS
   v_Suma NUMBER := 0;
BEGIN
   FOR i IN p_Min..p_Max LOOP
      v_Suma := v_Suma + (i * i);
   END LOOP;

   RETURN v_Suma;
END;

-- Utilizare:
SELECT SumOfSquares(1, 5) AS SumaPatrate FROM DUAL;
