-- CASE: HOTEL RESERVATION

-- Overview
/*
PacHotel adalah sebuah hotel bintang 5 di Kota Yogyakarta yang meneydiakan 3
pilihan kamar yaitu: 1)Premier, 2)Deluxe, dan 3)Executive Room dengan berbagai
pilihan jenis ranjang sesuai denagn kebutuhan customer
*/

-- Case Description
/*
PacHotel ingin mengembangkan bisnis hotelnya dengan membuat sebuah website yang 
dapat memabntu customer untuk melakukan reservasi secara online.

Bantu PacHotel untuk merancang desain database!
*/





-- 1. MISSION STATEMENT
/*
1.1 Case Description
PacHotel ingin mengembangkan bisnis hotel dengan membuat sebuah website dan dashboard
yang bertujuan untuk:
a. PacHotel ingin agar dapat mengelola reservasi dan fasilitas dengan baik
b. Customer mudah melakukan reservasi dengan mudah

1.2. Mission Statement
a. Mengelola fasilitas kamar hotel
b. Customer dapat melakukan reservasi
c. Mengelola pembayaran reservasi
*/





-- 2. CREATE TABLE STRUCTURE: Identifying Subjects

-- 2.1 Menentukan Subjek/Table
/*
A. Mengelola Fasilitas Kamar
- room			: Menyimpan informasi tentang fasilitas kamar atau ruangan yang disewakan
- room_type	: Menyimpan informasi tentang tipe atau jenis kamar milik PacHotel
- amenity		: Menyimpan informasi tentang fasilitas setiap tipe kamar PacHotel

Keterangan:
	room---MEMILIKI---room_type---MEMILIKI---amenity


B. Customer dapat Melakukan Reservasi
- customer			:Menyimpan informasi data diri customer PacHotel
- reservation		:Menyimpan informasi reservasi yang dilakukan oleh customer
- reservation_room	:Menyimpan informasi kamar yang dipesan oleh customer (reservation & room)

Keterangan:
	customer---MELAKUKAN---reservation---MEMILIKI---reservation_room


C. Mengelola Pembayaran Reservasi
- payment			: Menyimpan informasi detail pembayaran atas reservasi yang dilakukan

Keterangan:
	reservation---MEMERLUKAN---payment
*/



-- 2.2 Creating Field & Data Type

/*
A. Mengelola Fasilitas dan Kamar
--> Table room
	a. Description:
	Menyimpan informasi tentang fasilitas kamar atau ruangan yang disewakan
	
	b. Field Name & Data Type:
	Informasi apa yang tersedia untuk object room atau kamar?
	- room_id		: int (Menyimpan data nomor kamar)
	- room_type_id	: int (Menyimpan data tipe kamar)
	- room_floor	: int (Menyimpan data posisi lantai kamar)
	- availability	: boolean (Menyimpan informasi apakah kamar sedang tersedia atau dipesan)

--> Table room_type
	a. Description:
	Menyimpan informasi tentang tipe atau jenis kamar milik PacHotel

	b. Field Name & Data Type:
	Informasi apa yang tersedia unutk obect room atau kamar?
	- room_type_id	: int 			(menyimpan data id tipe kamar)
	- name_type		: varchar(20)	(menyimpan data nama tipe kamar)
	- max_occupacy	: int			(menyimpan jumlah maksimal orang di dalam kamar)
	- price			: numeric		(menyimpan harga pesan kamar)
	- description	: text			(menyimpan deskripsi tipe kamar)

--> Table amenity
	a. Description:
	Menyimpan informasi tentang fasilitas setiap tipe kamar PacHotel
	
	b. Field Name and Data Type
	Fasilitas di dalam kamar apa saja yang diberikan oleh PacHotel?
	- amenity_id		: int 			(menyimpan data id fasilitas kamar)
	- room_type_id		: int 			(menyimpan data id tipe kamar)
	- bed_type			: varchar(20)	(menyimpan informasi tipe ranjang yang tersedia
									Ex: Twin, Double, King)
	- size				: varchar(25)	(menyimpan informasi ukuran kamar P x L)
	- air_conditioner	: boolean		(menyimpan informasi apakah kamar memiliki AC)
	- refrigrator		: boolean		(menyimpan informasi apakah kamar memiliki refrigrator)
	- microwave			: boolean		(menyimpan informasi apakah kamar memiliki microwave)
	- coffe_machine		: boolean		(menyimpan informasi apakah kamar memiliki coffe_machine)
	- television		: boolean		(menyimpan informasi apakah kamar memiliki television)
	- jacuzzi			: boolean		(menyimpan informasi apakah kamar memiliki jacuzzi)


B. Customer Dapat Melakukan Reservasi
--> Table customer
	a. Description
	Menyimpan infromasi data diri customer PacHotel
	
	b. Field Name & Data Type
	Data diri apa saja yang dibutuhkan untuk memesan kamar?
	- customer_id		: int 			(menyimpan data id customer)
	- first_name		: varchar(100)	(menyimpan nama depan customer)
	- last_name			: varchar(100)	(menyimpan nama belakang customer)
	- email				: varchar(100)  (menyimpan email customer)
	- phone				: varchar(100)  (menyimpan nomor telephone customer)
	
--> Table reservation
	a. Description
	Menyimpan informasi reservasi yang dilakukan customer
	
	b. Field Name & Data Type
	Informasi apa saja yang dibutuhkan untuk memesan kamar?
	- reservaion_id		: int	(menyimpan data id reservasi)
	- customer_id		: int	(menyimpan data id customer)
	- reservation_date	: timestamp (menyimpan tanggal reservasi dibuat)
	- start_date		: timestamp	(menyimpan tanggal check in customer)
	- end_date			: timestamp (menyimpan tanggal check out customer)
	- total_price		: numeric 	(menyimpan total harga yang harus dibayar customer)
	
--> Table reservation_room
	a. Description
	Menyimpan informasi kamar yang dipesan oleh customer
	
	b. Field Name & Data Type
	Informasi apa saja yang dibutuhkan untuk kamar yang dipesan?
	- reservation_id	: int (menyimpann data id reservasi)
	- room_id			: int (menyimpan data nomor kamar yang dipesan)

	
C. Mengelola Pembayaran
--> Table payment
	a. Description
	Menyimpan informasi detail pembayaran atas reservasi yang dialkukan oleh customer
	
	b. Field Name & Data Type
	Informasi apa saja yang dibutuhkan untuk melakukan pembayaran atas reservasi
	yang dilakukan?
	- payment_id		: int 			(menyimpan data id payment)
	- reservation_id	: int 			(menyimpan data id reservasi)
	- privider			: varchar(100)	(menyimpan data provider atau metode pembayaran)
	- account_number	: varchar(100)	(menyimpan account number tujuan pembyaran (milik PacHotel))
	- payment_status	: varchar(20)	(menyimpan status pembayaran. Ex: waiting, success, failed)
	- payment_date		: timestamp		(menyimpan tanggal pembayaran berhasil dilakukan)
	- expire_date		: timestamp		(menyimpan tanggal kadaluarsa pembayaran untuk dibayarkan)
*/



-- 2.3 Choosing Candidate Key & Primary Key
/*
a. Table room:
	- room_id		: CK --> PK

b Table room_type:
	- room_type_id	: CK --> PK
	- name_type		: CK --> AK

c. Table amenity
	- amenity_id	: CK --> PK

d. Table customer
	- customer_id	: CK	--> PK
	- first_name	: CCK1	--> CAK1
	- last_name		: CCK1	--> CAK1
	- email			: CK	--> AK

e. Table reservation
	- reservaion_id	: CK

f. Table reservation_room
	- reservation_room_id	: ACK	--> PK
	- reservation_id		: CCK1	--> CAK1
	- room_id				: CCK1	--> CAK1

g. Table payment
	- payment_id		: CK	--> PK
	- reservation_id	: CK	--> AK
*/





-- 3. DETERMINE TABLE RELATIONSHIP 

-- Identifying Relationship
/*
--> Menentukan Tipe Relasi:
- 1 : 1		--> One to One
- 1 : M		--> One to Many
- M : N		--> Many to Many

--> Eksekusi Identifying Relationship
a. Mengelola Fasilitas
	- setiap room_type (parent) memiliki banyak room (child)												: 1 to 1
	- setiap room_type (parent) memiliki banyak amenity (child)											: 1 to M

b.  Customer Dapat Melakukan Reservasi
	- setiap customer (parent) dapat melakukan banyak reservation (child)									: 1 to M
	- setiap reservation (parent) memiliki satu atau lebih kamar yang dipesan reservation_room (child)	: 1 to M
	- satu room dapat dipesan dalam beberapa reservasi yang berbeda reservation_room (child)				: 1 to M

c. Mengelola Pembayaran Reservasi 
	- setiap reservation (parent) memerlukan satu kali payment (child)										: 1 to 1

Keterangan:
Terdapat relasi M:N pada relasi tabel reservation dan tabel room
- satu pesanan/reservation dapat memesan banyak room
- dan satu room dapat dipesan oleh banyak reservation/pesanan
*/  





-- 4. CREATE TABLE: QUERY EXECUTION OF STRUCTURE TABLE
/*
Implementasikan struktur tabel PacHotel ke dalam PostgreSQL menggunakan DDL
dengan ketentuan:
- Primary Key yang tidak bersifat Auto IncrementL Table room, reservation, dan payment
	Selain itu, primary key bersifat auto increment

- Beberapa Field memiliki nilai DEFAULT
	- Field availability pada tabel room, nilai defaultnya TRUE
	- Semua Field bertipe boolean pada tabel amenity, nilai defaultnya TRUE
*/

/*
- Cek tabel yang telah dibuat pada Browser pgAdmin4
	(Database --> Nama Database --> Schema --> Tables --> Columns & Constraint)

- Atau syntax:
	SELECT
		table_name,
		column_name,
		data_type,
		is_nullable
	FROM
		information_schema.columns
	WHERE
		table_name	= 'room' or
		table_name	= 'room_type' or
		table_name	= 'amenity' or
		table_name	= 'customer' or
		table_name	= 'reservation' or
		table_name	= 'reservation_room' or
		table_name	= 'payment';
*/

-- 1. Mengelola Fasilitas Kamar Hotel
CREATE TABLE room (
	room_id INTEGER PRIMARY KEY,
	room_type_id INTEGER,
	room_floor INTEGER,
	availability BOOLEAN DEFAULT TRUE
);

CREATE TABLE room_type_id(
	room_type_id SERIAL PRIMARY KEY,
	name_type VARCHAR(20) NOT NULL UNIQUE,
	max_occupcy INTEGER,
	price NUMERIC,
	description TEXT
);
ALTER TABLE 
room_type_id 
RENAME TO 
room_type

ALTER TABLE 
room_type 
RENAME COLUMN 
max_occupcy 
TO max_occupacy

CREATE TABLE amenity(
	amenity_id SERIAL PRIMARY KEY,
	room_type_id INTEGER,
	bed_type VARCHAR(20),
	size VARCHAR(25),
	air_conditioner BOOLEAN DEFAULT TRUE,
	refrigerator BOOLEAN DEFAULT TRUE,
	microwave BOOLEAN DEFAULT TRUE,
	coffe_machine BOOLEAN DEFAULT TRUE,
	television BOOLEAN DEFAULT TRUE,
	jacuzzi BOOLEAN DEFAULT TRUE
);


-- 2. Customer Dapat Melakukan Reservasi
CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100),
	email VARCHAR(100) UNIQUE NOT NULL,
	phone VARCHAR(100),
	UNIQUE(first_name, last_name)
);

CREATE TABLE reservation(
	reservation_id INTEGER PRIMARY KEY,
	customer_id INTEGER,
	reservation_date TIMESTAMP,
	start_date TIMESTAMP,
	end_date TIMESTAMP,
	total_price NUMERIC
);

CREATE TABLE reservation_room(
	reservation_room_id SERIAL PRIMARY KEY,
	reservation_id INTEGER NOT NULL,
	room_id INTEGER NOT NULL,
	UNIQUE(reservation_id, room_id)	
);


-- 3. Mengelola Pembayaran
CREATE TABLE payment(
	payment_id INTEGER PRIMARY KEY,
	reservation_id INTEGER UNIQUE NOT NULL,
	provider VARCHAR(100),
	account_number VARCHAR(100),
	payment_status VARCHAR(20),
	payment_date  TIMESTAMP,
	expire_date TIMESTAMP
);






-- 5. INSERTING DATA
INSERT INTO room_type(name_type, max_occupacy, price, description)
VALUES('Premier', 2, 720000, 'Premier Rooms include the amenities you will need for a comfortable stay, such as an LED TV with international and local channels, comfortable beds and pillows with 100% cotton bed sheets and duvet, individual room AC, and a soothing rain shower. Coffee & tea making facilities are provided, No charge to Minibar Service, Super fast WiFi internet access is available throughout the hotel for you to enjoy.'),
('Deluxe', 2, 987000, 'Deluxe Premier Room offering a city view has a larger living area fitted with a seating area and writing desk. The rooms are convenient for any discerning  traveller who desires sufficient space for doing business.'),
('Executive', 2, 1450000, 'Spacious room suite features a foyer leading to a sitting area furnished with a sofa, coffee table, and writing desk. From the windows, the guests has an option to enjoy view of calm city streets or relaxing swimming pool. The bathroom is completed with a walk-in closet and bathtub. The guests stay include complimentary high speed Wi-Fi');

SELECT * FROM room_type;

INSERT INTO room(room_id, room_type_id, room_floor, availability)
VALUES(101, 1, 2, TRUE),
(102, 1, 2, TRUE),
(103, 1, 2, TRUE),
(104, 1, 2, FALSE),
(105, 1, 2, TRUE),
(106, 1, 2, TRUE),
(107, 1, 2, TRUE),
(108, 1, 2, TRUE),
(109, 1, 2, TRUE),
(110, 1, 2, TRUE),
(201, 1, 3, TRUE),
(202, 1, 3, FALSE),
(203, 1, 3, TRUE),
(204, 1, 3, TRUE),
(205, 1, 3, TRUE),
(206, 2, 3, TRUE),
(207, 2, 3, TRUE),
(208, 2, 3, TRUE),
(209, 2, 3, FALSE),
(210, 2, 3, TRUE);

SELECT * FROM room;

INSERT INTO customer(first_name, last_name, email, phone)
VALUES('Budi', 'Gunawan', 'budi123@mail.com', '0812345678'),
('Amalia', 'Ayu Hidayah', 'amel.hidayah@mail.com', NULL),
('Ayu', 'Ningtias Putri', 'ayuputri@mail.com', '0822345678'),
('Muhammad Abdi', 'Najat', 'abdi98@yaho.com', '0819999678'),
('Rayhan', 'Malik Prakasa', 'malik234@mail.com', NULL),
('Shania', 'Maulidah Hasanah', 'shania.mh@mail.com', NULL);

SELECT * FROM customer;

INSERT INTO amenity(room_type_id, bed_type, size, air_conditioner, refrigerator, microwave, coffe_machine, television, jacuzzi)
VALUES(1, 'Twin', '6x4 m', TRUE , TRUE, TRUE, FALSE, TRUE, FALSE),
(2, 'Queen', '7x4 m', TRUE , TRUE, TRUE, TRUE, TRUE, FALSE),
(3, 'King', '10x5 m', TRUE , TRUE, TRUE, TRUE, TRUE, TRUE);
 
SELECT * FROM amenity;

INSERT INTO reservation(reservation_id, customer_id, reservation_date, start_date, end_date, total_price)
VALUES(1400020317, 2, '2017-09-10 12:00:00+03', '2017-09-10 12:00:00+03', '2017-09-12 13:00:00+03', 1974000),
(1400051317, 3,'2017-10-22 12:00:00+03' , '2017-10-22 12:00:00+03', '2017-10-24 13:00:00+03', 3948000),
(1400021317, 1, '2017-11-01 12:00:00+03', '2017-11-01 12:00:00+03', '2017-11-04 13:00:00+03', 2160000),
(1400051917, 5, '2017-11-17 12:00:00+03', '2017-11-17 12:00:00+03', '2017-11-18 13:00:00+03', 1440000);

SELECT * FROM reservation;

INSERT INTO reservation_room(reservation_id, room_id)
VALUES(1400020317, 206),
(1400051317, 207),
(1400051317, 208),
(1400021317, 109),
(1400051917, 102),
(1400051917, 103);

SELECT * FROM reservation_room;

INSERT INTO payment(payment_id, reservation_id, provider, account_number, payment_status, payment_date, expire_date)
VALUES(290807, 1400020317, 'BNI', '09085567', 'Success', '2017-09-08 12:00:00+03', '2017-09-09 12:00:00+03'),
(310107, 1400051317, 'BCA', '11276912987' , 'Success', '2017-10-10 12:00:00+03', '2017-10-11 12:00:00+03'),
(320207, 1400021317, 'BNI', '09085567', 'Success', '2017-10-20 12:00:00+03', '2017-10-21 12:00:00+03'),
(330307, 1400051917, 'BNI', '09085567', 'Failed', NULL, '2017-11-18 12:00:00+03');

SELECT * FROM payment;






-- 6. BUSINESS RULES & CONSTRAINT
/*
Berikut ini adalah business rule untuk kasus PacHotel

a. ROOM TABLE
Business Rules:
	- Informasi untuk setiap ruangan harus lengkap, memiliki informasi 
		1)nomor ruangan, 2)tipe, 3)lokasi, 4)lantai ruangan, dan 5) ketersediaan
		
	- Jadi, relasinya dengan tabel room_type adalah MANDATORY
	
	- Data di room_type dapat dihapus jika tidak ada data room yang berelasi
	
	- Jika baris di tabel induk dihapus dan ada baris di tabel anak yang merujuk 
		ke baris tersebut, maka operasi penghapusan di tabel induk akan gagal
		(ON DELETE NO ACTION)
		
Constraint:
	- NOT NULL untuk field:
		- room_type_id
		- room_floor
		- availability

	- Parameter relasi tabel room dan room_type adalah ON DELETE NO ACTION



b. ROOM_TYPE TABLE
Business Rules:
	- Informasi mengenai nama tipe, jumlah maksimal, penghuni, dan harga harus terisi
	- Field price nilainya di atas 0 rupiah

Constraint:
	- NOT NULL untuk field:
		- name_type
		- max_occupacy
		- price

	- Using CHECK for price:
		CHECK price > 0



b. AMENITY TABLE
Business Rules:
	- Informasi mengenai jenis ranjang harus ada
	- Relasinya dengan tabel room_type adalah MANDATORY
	- Data room_type tidak dapat dihapus karena menunjukkan informasi	
		amenity ruangan tersebut

Constraint:
	- NOT NULL untuk field: 
		- bed_type
		- room_type_id
	- Parameter relasi tabel room_type dengan amenity adalah ON DELETE NO ACTION



c. CUSTOMER TABLE
Business Rules:
	- Tidak ada constraint tambahan



d. RESERVATION TABLE
Business Rules:
	- Semua informasi dalam tabel harus terisi
	- Total price bernilai lebih dari 0 rupiah
	- Relasinya dengan tabel customer adalah MANDATORY.
	- Data di customer dapat dihapus jika tidak ada data
		reservation yang berelasi

Constraint:
	- NOT NULL untuk field:
		- reservation_id
		- customer_id
		- reservation_date
		- start_date
		- end_date
		- total_price

	- CHECK total_price > 0

	- Parameter relasi tabel customer dengan tabel reservation adalah ON DELETE NO ACTION



e. RESERVATION_ROOM TABLE
Business Rules:
	- Semua informasi dalam tabel harus terisi
	- Relasinya dengan tabel reservation adalah MANDATORY.
		Data di reservation dapat dihapus, dan data di reservation_room
		akan ikut terhapus
	- Relasinya dengan tabel room adalah MANDATORY.
		Data di tabel room dapat dihapus jika tidak ada
		data reservation_room yang berelasi.

Constraint:
	- NOT NULL untuk field:
		- reservation_room_id
		- reservation_id
		- room_id

	- Parameter relasi tabel reservation dengan reservation_room adalah ON DELETE CASCADE

	- Parameter relasi tabel room dengan reservation_room adalah ON DELETE NO ACTION



f. PAYMENT TABLE
Business Rules:
	- Semua informasu dalam tabel herus terisi, kecuali payment_date
	- Nilai payment_status: waiting, success, failed
	- Relasinya dengan tabel reservation adalah MANDATORY
		Data di reservation dapat dihapus, dan data payment yang berelasi
		akan ikut terhapus

Constraint:
	- NOT NULL untuk field:
		- payment_id
		- reservation_id
		- provider_id
		- account_number
		- payment_status
		- expire_date

	- CHECK(payment_status IN('Waiting', 'Success', 'Failed'))

	- Parameter relasi tabel reservation dengan payment adalah ON DELETE CASCADE
*/





-- 7. MODIFYING TABLE STRUTURE: Add Relations and Constraint
/*
Modifikasi tabel yang sudah dimplementasikan ke pgSQL dengan menambahkan 
relasi antar tabel serta constraintnya:

a. ROOM TABLE
Relasi:
	- Buat relasi antar tabel room dan tabel room_type
	
Constraint:
	- NOT NULL untuk field:
		- room_type_id
		- room_floor
		- availability

	- Parameter relasi tabel room dan room_type ON DELETE NO ACTION



b. ROOM_TYPE TABLE
Relasi:
	- Buat relasi antar tabel room dan tabel room_type
	
Constraint:
	- NOT NULL untuk field:
		- name_type
		- max_occupacy
		- price

	- CHECK price > 0



c. AMENITY TABLE
Relasi:
	- Buat relasi antar tabel amenity dan tabel room_type
	
Constraint:
	- NOT NULL untuk field:
		- room_type_id
		- bed_type

	- Parameter relasi tabel amenity dan room_type



d. RESERVATION TABLE
Relasi:
	- Buat relasi antara tabel reservation dan tabel customer
	
Constraint:
	- NOT NULL untuk field:		
		- customer_id
		- reservation_date
		- start_date
		- end_date
		- total_price

	- CHECK total_price > 0

	- Parameter relasi tabel reservation dan customer adalah ON DELETE ACTION



e. RESERVATION_ROOM TABLE
Relasi:
	- Buat relasi antara tabel reservation_room dan tabel reservation
	- BUat relasi antara tabel reservation_room dan tabel room
	
Constraint:
	- NOT NULL untuk field:
		- reservation_id
		- room_id

	- Parameter relasi tabel reservation dengan reservation_room adalah ON DELETE CASCADE

	- Parameter relasi tabel room dengan reservation_room adalah ON DELETE NO ACTION



f. PAYMENT TABLE
Relasi: 
	- Buat relasi antara tabel payment dan tabel reservation

Constraint:
	- NOT NULL untuk field:
		- payment_id
		- reservation_id
		- provider_id
		- account_number
		- payment_status
		- expire_date

	- CHECK(payment_status IN('Waiting', 'Success', 'Failed'))

	- Parameter relasi tabel reservation dengan payment adalah ON DELETE CASCADE
*/
-- 1. Mengelola Fasilitas & Kamar

--> ROOM
	-- Relasi Antar Tabel room & room_type
	ALTER TABLE room
	ADD CONSTRAINT fk_room_type
		FOREIGN KEY(room_type_id)
		REFERENCES room_type(room_type_id)
		ON DELETE NO ACTION
		
	-- NOT NULL Constraint
	ALTER TABLE room
	ALTER COLUMN room_id SET NOT NULL,
	ALTER COLUMN room_type_id SET NOT NULL,
	ALTER COLUMN room_floor SET NOT NULL,
	ALTER COLUMN availability SET NOT NULL;

--> ROOM TYPE
	-- Constraint CHECK
	ALTER TABLE room_type
	ADD CONSTRAINT price CHECK (price > 0)

	-- NOT NULL Field
	ALTER TABLE room_type
	ALTER COLUMN max_occupacy SET NOT NULL,
	ALTER COLUMN price SET NOT NULL;

--> AMENITY
	-- NOT NULL Field
	ALTER TABLE amenity
	ALTER COLUMN bed_type SET NOT NULL,
	ALTER COLUMN room_type_id SET NOT NULL

	-- Relasi Antar Tabel room_type dan tabel amenity
	ALTER TABLE amenity
	ADD CONSTRAINT fk_room_type
		FOREIGN KEY (room_type_id)
		REFERENCES room_type(room_type_id)
		ON DELETE RESTRICT

	ALTER TABLE amenity
	RENAME CONSTRAINT fk_room_type TO fk_room_type_amenity



--> CUSTOMER
	-- Tidak ada constraint tambahan

--> RESERVATION
	-- Relasi Antar tabel customer dan tabel reservation
	ALTER TABLE reservation
	ADD CONSTRAINT fk_customer
		FOREIGN KEY(customer_id)
		REFERENCES customer(customer_id)
		ON DELETE NO ACTION

	ALTER TABLE reservation
	RENAME CONSTRAINT fk_customer TO fk_customer_reservation
		
	-- NOT NULL Field
	ALTER TABLE reservation
	ALTER COLUMN reservation_id SET NOT NULL,
	ALTER COLUMN customer_id SET NOT NULL,
	ALTER COLUMN reservation_date SET NOT NULL,
	ALTER COLUMN start_date SET NOT NULL,
	ALTER COLUMN end_date SET NOT NULL,
	ALTER COLUMN total_price SET NOT NULL

	-- Constraint CHECK
	ALTER TABLE reservation
	ADD CONSTRAINT total_price CHECK (total_price > 0)

--> RESERVATION ROOM
	-- Relasi Antar tabel reservation & room
	ALTER TABLE reservation_room 
	ADD CONSTRAINT fk_reservation
		FOREIGN KEY(reservation_id)
		REFERENCES reservation(reservation_id)
		ON DELETE CASCADE,
	ADD CONSTRAINT fk_room
		FOREIGN KEY(room_id)
		REFERENCES room(room_id)
		ON DELETE NO ACTION

	-- NOT NULL Field
	ALTER TABLE reservation_room
	ALTER COLUMN reservation_id SET NOT NULL,
	ALTER COLUMN room_id SET NOT NULL

--> PAYMENT
	-- Relasi Antar tabel reservation dan tabel payment
	ALTER TABLE payment
	ADD CONSTRAINT fk_reservation_payment
		FOREIGN KEY(reservation_id)
		REFERENCES reservation(reservation_id)
		ON DELETE CASCADE

	-- NOT NULL Field & CHECK Constraint
	ALTER TABLE payment
	ALTER COLUMN payment_id SET NOT NULL,
	ALTER COLUMN reservation_id SET NOT NULL,
	ALTER COLUMN provider SET NOT NULL,
	ALTER COLUMN account_number SET NOT NULL,
	ALTER COLUMN payment_status SET NOT NULL,
	ALTER COLUMN expire_date SET NOT NULL,
	ADD CONSTRAINT payment_status 
	CHECK (payment_status IN ('Success', 'Waiting', 'Failed'))
		









-- 8. DESIGN TABLE RELATIONSHIP (Generate ERD)
/*
--> Generate ERD 
	- Klil kanan database
	- Pilih opsi ERD for database


--> Check Constraint
	- Klik Database
	- Pilih nama database
	- Schema
	- Tables
	- Constraints
*/




-- 9. TEST PLAN
/*
Melakukan INSERT & DELETE DATA untuk mengecek apakah constraint sudah
terimplementasikan dengan baik dan berfungsi.

A. INSERTING DATA
	a. Check constraint NOT NULL pada tabel reservation
		- Insert data berikut:
			INSERT INTO reservation(reservation_id, customer_id, reservation_date, start_date, end_date, total_price)
			VALUES(1400061311, 2, NULL, '2017-09-10 12:00:00+03', '2017-09-12 13:00:00+03', 1974000);
		- Apakah data dapat diinputkan?


	b. Check Constraint CHECK total_price > 0 pada tabel reservation
		- Insert data berikut:
			INSERT INTO reservation(reservation_id, customer_id, reservation_date, start_date, end_date, total_price)
			VALUES(1400061301, 2,'2017-09-08 12:00:00+03', '2017-09-10 12:00:00+03', '2017-09-12 13:00:00+03', 0);
		- Apakah data dapat diinputkan?
*/
	-- KETERANGAN:
	-- Check constraint NOT NULL pada tabel reservation
	INSERT INTO reservation(reservation_id, customer_id, reservation_date, start_date, end_date, total_price)
	VALUES(1400061311, 2, NULL, '2017-09-10 12:00:00+03', '2017-09-12 13:00:00+03', 1974000);
	
	/*
	Data di atas tidak bisa diinputkan atau ERROR karena terdapat NULL VALUE pada field reservation_date.
	Sementara itu, field reservation_date memiliki constraint NOT NULL
	*/

	-- Check Constraint CHECK total_price > 0 pada tabel reservation
	INSERT INTO reservation(reservation_id, customer_id, reservation_date, start_date, end_date, total_price)
	VALUES(1400061301, 2,'2017-09-08 12:00:00+03', '2017-09-10 12:00:00+03', '2017-09-12 13:00:00+03', 0);
	/*
	Data di atas tidak bisa diinputkan atau ERROR karena value pada field price bernilai = 0.
	Sementara itu, constraint pada field price > 0
	*/


/*	
B. DELETE DATA
	a. Check apakah ketika suatu data di tabel reservation dihapus, maka data
		reservation_room dan payment yang berelasi juga terhapus --> ON DELETE CASCADE?

		- Hapus reservation_id = 1400020317 di tabel reservation
		- Apakah data reservation_id = 1400020317 di tabel reservation_room
			dan payment ikut terhapus?

	b. Check apakah yang terjadi jika data di tabel room_type dihapus --> ON DELETE RESTRICT
		- Hapus room_type_id = 1
		- Apa yang terjadi pada tabel amenity?

	c. Check apa yang terjadi jika data customer yang tidak pernah melakukan reservasi dihapus --> ON DELETE NO ACTION
		- Hapus data customer_id = 6 di tabel customer
		- Apa yang terjadi pada tabel reservation?
*/
	-- KETERANGAN:
	-- Check Constraint ON DELETE CASCADE
	DELETE FROM reservation
	WHERE reservation_id = 1400020317

	SELECT reservation_id
	FROM reservation_room
	WHERE id = 1400020317

	SELECT reservation_id
	FROM payment
	WHERE id = 1400020317
	/*
	Constraint ON DELETE CASCADE pada tabel reservation_room terhadap table reservation BERHASIL. 
	Hal ini dibuktikan dengan data ketika pada suatu field di tabel parent (reservation),
	maka data pada tabel child (reservation_room) ikut TERHAPUS.
	*/

	-- Check Constraint ON DELETE RESTRICT
	DELETE FROM room_type
	WHERE room_type_id = 1

	SELECT *
	FROM amenity
	WHERE room_type_id = 1

	SELECT *
	FROM room
	WHERE room_type_id = 1
	/*
	Constraint ON DELETE RESTRICT pada tabel amenity terhadap tabel room_type BERHASIL.
	Hal ini dibuktikan dengan output yang ERROR ketika menghapus data pada tabel parent (room_type).
	Hal ini terjadi karena masih ada data atau nilai pada field di tabel child (amenity & room) dan karena
	data pada tabel child (amenity & room) bergantung pada tabel parent (room_type), sehingga record
	dengan room_type_id pada tabel child (amenity & room) masih ada.
	*/

	-- Check Constraint ON DELETE NO ACTION 
	DELETE FROM customer
	WHERE customer_id = 6
	
	SELECT *
	FROM reservation
	WHERE customer_id = 6
	/*
	Data customer_id = 6 dapat dihapus karena custoemr tersebut tidak pernah melakukan
	reservasi atau tidak ada data yang bergantung dengan customer_id = 1 pada tabel reservation
	terhadap tabel customer dan ON DELETE NO ACTION BERHASIL
	*/
	
	





-- 10. CREATING INDEX
/*
Preparation:
	Inputkan data baru pada tabel berikut ini:
		- room
		- customer
		- reservation
		- payment


Case 1:
	- PacHotel semakin berkembang. PacHotel menambah kamar hotelnya serta
		membangun lantai tingkat baru

	- Hal ini menyebabkan bertambahnya jumlah data di tabel room semakin banyak dan
		menyebabkan lamanya proses query data

	- Query yang sering dilakukan adalah mencari ruangan berdasarkan tipe ruangannya

	- Buatlah INDEX pada field room_type_id di tabel room untuk menangani masalah tersebut
*/
	-- Menonaktifikan sequential scan (seqscan) saat menjalankan query
	-- pgSQL akan lebih memilih index scan drpd membaca tabel secara berutuan (sequantial scan)
	set enable_seqscan to off 
	-- Jika ingin mengaktifkan seqscan lagi, tinggal ganti dari 'off' ke 'on'


	-- Menerapkan INDEX
	CREATE INDEX idx_room_type
	ON room_type USING btree(room_type_id)

	EXPLAIN SELECT *
	FROM room_type
	WHERE room_type_id = 150
	

/*
Case 2:
	- Customer yang akan melakukan check in akna diperiksa atas nama siapa reservasi
		dilakukan

	- Resepsioanis akan mengecek apakah nama yang diucapkan customer sesuai dengan reservasinya

	- Untuk mempercepat proses ini, buatlah index terhadap kombinasi first_name
		dan last_name di tabel customers
*/
	CREATE INDEX idx_composite_name
	ON customer USING btree (first_name, last_name)

	EXPLAIN SELECT *
	FROM customer
	WHERE first_name = 'Damar' and last_name = "Adriansyah Putra"




-- 11. CREATING PARTITION
/*
Case:
	- PacHotel semakin berkembang, jumlah customer yang melakukan reservasi naik
		setiap bulan secara stabil

	- Hal ini menyebabkan bertambhanya jumlah data di tabel reservation semakin banyak
		dan menyebabkan lamanya proses query data untuk melakukan analisa

	- Buatlah PARTITION untuk menangani masalah tersebut


Case 1:
	- Buat partisi-partisi yang membagi tabel reservation berdasarkan quarter setiap tahunnya
		pada field start_date
		- 2017 Q1, 2017 Q2, 2017 Q3, 2017 Q4	
		- 2018 Q1, 2018 Q2, 2018 Q3, 2018 Q4	
		- 2019 Q1, 2019 Q2, 2019 Q3, 2019 Q4	


Case 1:
	- Setelah membuat PARTITIONED TABLE, inputkan data pada tabel reservation ke 
		PARTITIONED TABLE yang sudah dibuat
		
	- Gunakan perintah:
		INSERT INTO partitioned_table_name
		SELECT * FROM reservation

	- Perintah tersebut adalah untuk mengcopy data di tabel reservation ke
		PARTITIONED TABLE yang sudah dibuat


Case 1:
	- Dapatkan data reservation pada tahun 2017 quarter kedua melalui tabel partisi
*/

	CREATE TABLE reservation_partition(
		reservation_id INTEGER,
		customer_id INTEGER,
		reservation_date TIMESTAMP,
		start_date TIMESTAMP,
		end_date TIMESTAMP,
		total_price NUMERIC
	) PARTITION BY RANGE (start_date)

	CREATE TABLE reservation_2017_Q1 PARTITION OF reservation_partition
	FOR VALUES FROM ('2017-01-01') TO ('2017-04-01');

	CREATE TABLE reservation_2017_Q2 PARTITION OF reservation_partition
	FOR VALUES FROM ('2017-04-01') TO ('2017-07-01');

	CREATE TABLE reservation_2017_Q3 PARTITION OF reservation_partition
	FOR VALUES FROM ('2017-07-01') TO ('2017-10-01');

	CREATE TABLE reservation_2017_Q4 PARTITION OF reservation_partition
	FOR VALUES FROM ('2017-10-01') TO ('2017-12-01')

	-- Insert Data Partition
	INSERT INTO reservation_partition
	SELECT * FROM reservation

	-- Query dari Tabel Partition
	SELECT *
	FROM reservation_partition
/*
Case 2:
	- BUat partisi2 yang membagi tabel payment berdasarkan status paymentnya
		- success
		- waiting
		- failed

Case 2:
	- Setelah membuat PARTITIONED TABLE, inputkan data pada tabel payment ke 
		PARTITIONED TABLE yang sudah dibuat
		
	- Gunakan perintah:
		INSERT INTO partitioned_table_name
		SELECT * FROM payment

	
	- Perintah tersebut adalah untuk mengcopy data di tabel payment ke
		PARTITIONED TABLE yang sudah dibuat

Case 2:
	- Dapatkan data payment yang gagal bayar melalui tabel partisi

*/

	CREATE TABLE payment_partition(
		payment_id INTEGER,
		reservation_id INTEGER,
		provider VARCHAR(100),
		account_number VARCHAR(100),
		payment_status VARCHAR(100),
		payment_date TIMESTAMP,
		expire_date TIMESTAMP
	) PARTITION BY LIST (payment_status)

	CREATE TABLE payment_status_success PARTITION OF payment_partition
	FOR VALUES IN ('Success');

	CREATE TABLE payment_status_waiting PARTITION OF payment_partition
	FOR VALUES IN ('Waiting');

	CREATE TABLE payment_status_failed PARTITION OF payment_partition
	FOR VALUES IN ('Failed');

	-- Insert Data Partition
	INSERT INTO payment_partition
	SELECT * FROM payment

	-- Query Tabel Partition
	SELECT *
	FROM payment_partition









