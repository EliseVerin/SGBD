/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 19c                            */
/* Date de création :  30/12/2022 09:48:40                      */
/*==============================================================*/

/*==============================================================*/
/* Table : FACTURE                                              */
/*==============================================================*/

CREATE TABLE table_factures(
code_compteur VARCHAR2(100),
nom_compteur VARCHAR2(108),
date_facture DATE,
fluide VARCHAR2(30),
fournisseur VARCHAR2(30),
conso_kWh_total number(10),
date_debu_conso DATE,
date_fin_conso DATE,
facture_HTVA Float(2),
facture_TTC Float(2),
ID_du_site VARCHAR2(100),
UAI VARCHAR2(25),
nom_etablissement VARCHAR2(100));


/*==============================================================*/
/* Table : COMPTEUR                                             */
/*==============================================================*/

CREATE TABLE table_info_compteurs(
UAI VARCHAR2(25),
nom_etablissement VARCHAR2(100),
ID_du_site VARCHAR2(100),
nom_site VARCHAR2(100),
code_compteur VARCHAR2(100),
nom_compteur VARCHAR2(108),
com_compteur_2 VARCHAR2(100),
fournisseur VARCHAR2(100),
finencer_par VARCHAR2(100),
code_chorus number(20),
ratio FLOAT(3),
fluide VARCHAR2(30),
accord_cadre VARCHAR2(30) ,
debut_accord DATE,
fin_accord DATE,
marche_subsequent VARCHAR2(100),
debut_marche_subsequent DATE,
fin_marche_subsequent DATE,
debut_contrat DATE,
fin_contrat DATE,
adresse VARCHAR2(100),
code_postal number(5),
ville VARCHAR2(100),
puissance_raccordement number(20),
tension VARCHAR2(100),
tension_livraison VARCHAR2(100),
tech_compteur VARCHAR2(100),
mesure_distance VARCHAR2(100),
num_acces_GSM number (20),
key_acces_GSM number (20),
type_tarif VARCHAR2(100),
puissance_souscite Float(2),
puissance_souscrite_pointe number (20),
puissance_souscrite_HPH number (20),
puissance_souscrite_HCH number (20),
puissance_souscrite_HPE number (20),
puissance_souscrite_HCE number (20),
der_modif_tarif VARCHAR2(100),
der_abonnement_augmentation_tarrif VARCHAR2(100),
der_dim_puissance_souscrite VARCHAR2(100),
segment VARCHAR2(100),
ID_compteur number (20),
communicant VARCHAR2(100),
heures VARCHAR2(20),
heures_pointe VARCHAR2(20),
futur_heure_creuse VARCHAR2(20),
conso_annuelle_reff number (20),
profil VARCHAR2(100),
opt_tariff VARCHAR2(100),
CAR_MWh_GrDF Float (25),
CJA_MWh_j_GrDF Float(25),
soc_distri_local VARCHAR2(100));

/*==============================================================*/
/* Table : CONSOMMATION MENSUELLE                               */
/*==============================================================*/
CREATE TABLE table_conso_mens(
date_conso_mens DATE,
code_compteur VARCHAR2(100),
nom_compteur VARCHAR2(108),
ID_du_site VARCHAR2(100),
nom_site VARCHAR2(100),
fluide VARCHAR2(30),
fournisseur VARCHAR2(30),
consso Float(8),
conssomation_eau_m3 Float(8),
fature_HTVA Float(3),
facture_TTC Float(3),
UAI VARCHAR2(25));

/*==============================================================*/
/* Table : CONSOMMATION ANUELLE                                 */
/*==============================================================*/

CREATE TABLE table_conso_anuelle(
annee DATE,
PDL VARCHAR2(100),
nom_compteur VARCHAR2(100),
nom_compteur_2 VARCHAR2(50),
ID_du_site VARCHAR2(50),
Nom_du_site VARCHAR2(70),
financement VARCHAR2(50),
fluide VARCHAR2(50),
fournisseur VARCHAR2(50),
conssomation_kWh Float(8),
conssomation_eau_m3 Float(8),
fature_HTVA Float(3),
facture_TTC Float(3),
fatcture_men_HTVA Float(8),
fatcture_men_TTC Float(8),
accord_cadre VARCHAR2(15),
date_debut_cadre DATE,
date_fin_cadre DATE,
marche_subseq VARCHAR2(15),
debut_marche_subseq DATE,
fin_marche_subseq DATE,
UAI VARCHAR2(25),
adresse VARCHAR2(100),
code_postale number(5));


/*==============================================================*/
/* Table : Gaz                                                  */
/*==============================================================*/
CREATE TABLE Gaz_table AS (
    SELECT UAI,
           ID_du_site,
           code_compteur,
           nom_compteur,
           fournisseur,
           date_debu_conso,
           date_fin_conso,
           facture_HTVA,
           facture_TTC
    FROM table_factures
    WHERE fluide = 'Gaz'
);

/*==============================================================*/
/* Table : Electricite                                          */
/*==============================================================*/

CREATE TABLE Electricite_table AS (
    SELECT UAI,
           ID_du_site,
           code_compteur,
           nom_compteur,
           fournisseur,
           date_debu_conso,
           date_fin_conso,
           facture_HTVA,
           facture_TTC
    FROM table_factures
    WHERE fluide = 'ELECTRICITE'
);

/*==============================================================*/
/* Table : ETABLISSEMENT                                        */
/*==============================================================*/
CREATE TABLE table_info_sites(
ID_du_site VARCHAR2(50),
Nom_du_site VARCHAR2(70),
type_site VARCHAR2(25),
adresse VARCHAR2(100),
code_postale number(5),
ville VARCHAR2(100),
UAI VARCHAR2(25),
nom_etablissement VARCHAR2(100),
ID_territoire VARCHAR2(30),
cite_scolaire VARCHAR2(10),
code_departement number(2),
surface_m2 Float(2),
effectif_etablissement number(4),
annee_constructions DATE,
insee_code number(5),
type_chauffage_prcp VARCHAR2(30),
type_chauffage_sec VARCHAR2(30),
type_contrat VARCHAR2(10),
prof_energie VARCHAR2(20),
reseau_chaleur VARCHAR2(5));


/*==============================================================*/
/* Table : FOURNISSEUR                                          */
/*==============================================================*/
create table FOURNISSEUR (
   IDFOURNISSEUR        NUMBER(40)          
      generated as identity ( start with 1 nocycle noorder)  not null,
   ELECTRICITE          VARCHAR2(20),
   GAZ                  VARCHAR2(20),
   NOMFOURNISSEUR       VARCHAR2(40)          not null
);

/*==============================================================*/
/* Table : FOURNISSEUR                                          */
/*==============================================================*/
CREATE TABLE table_Associations(
ID_du_site VARCHAR2(100),
Nom_du_site VARCHAR2(100),
Code_UAI VARCHAR2(100),
Code_du_compteur VARCHAR2(100),
ratio Float(3));



/*==============================================================*/
/* Table : SITE                                                 */
/*==============================================================*/
create table SITE (
   IDSITE               NUMBER(40)          
      generated as identity ( start with 1 nocycle noorder)  not null,
   NOMSITE              VARCHAR2(40)          not null
);

/*==============================================================*/
/* Table : TEMPS                                                */
/*==============================================================*/
create table TEMPS (
   "DATE"               NUMBER(40)          
      generated as identity ( start with 1 nocycle noorder)  not null
);

