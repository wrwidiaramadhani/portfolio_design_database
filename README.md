# Design Database of Hotel Reservation
## Project Workflow
### 1. Mission Statement
Identifikasi subjek apa saja yang dibutuhkan dalam reservasi hotel. Identifikasi subjek ini akan menghasilkan entitas/table dan kolom, serta atribut.  Kasus ini memiliki beberapa subjek, diantaranya:
- Pengelolaan Fasilitas Kamar
- Customer Melakukan Reservasi
- Pengelolaan Pembayaran Reservasi
### 2. Create Table Structure
Tahap ini meliputi pembuatan field, atribut, serta tipe data atribut pada setiap table/entitas/subjek yang sudah diidentifikasi sebelumnya.
### 3. Determine Table Relationship
Tahap ini memahami hubungan antar table yang sudah dibentuk sebelumnya. Hubungan kardinalitas antar table meliputi:
- One to One
- One to Many
- Many to One
- Many to Many
Berikut adalah identifikasi relasi antar table hotel reservasi:
#### a. Mengelola Fasilitas
- setiap room_type (parent) memiliki banyak room (child)												: 1 to 1
- setiap room_type (parent) memiliki banyak amenity (child)											: 1 to M

#### b.  Customer Dapat Melakukan Reservasi
- setiap customer (parent) dapat melakukan banyak reservation (child)									: 1 to M
- setiap reservation (parent) memiliki satu atau lebih kamar yang dipesan reservation_room (child)	: 1 to M
- satu room dapat dipesan dalam beberapa reservasi yang berbeda reservation_room (child)				: 1 to M

#### c. Mengelola Pembayaran Reservasi 
- setiap reservation (parent) memerlukan satu kali payment (child)										: 1 to 1
### 4. Create Table Query Execution of Structure Table
Tahap ini adalah pembangunan tabel berdasarkan structure yang sudah dibuat sebelumnya dengan query postgreSQL. Tabel yang dibuat belum termasuk penginputan data.
### 5. Inserting Data
Tahap ini adalah proses penginputan data ke dalam tabel yang sudah dibangun sebelumnya. Pada kasus ini, data sudah disediakan oleh pihak course/bootcamp yang sedang saya ikuti pelatihannya.
### 6. Business Rules & Constraint
Ini merupakan tahapan pemberian batasan berdasarkan kesepakatan bisnis (studi kasus) terkait integritas dan konsistensi data yang diinginkan ketika data diinput ke dalam database. Misalnya: 
- Data tidak boleh null (IS NOT NULL_
- Data harus unik (UNIQUE)
- Data nomor maksimal 13 digit (VARCHAR(13))
- dan lain sebagainya
### 7. Design Table Relationship
Tahap ini adalah proses generate query yang sudah dibuat menjadi design table relationship atau ERD. Hal ini untuk mempermudah mengenali hubungan/relasi struktur data antar table.
### 8. Test Plan
Tahap ini adalah tahap pengujian atas business rules & constraint yang sudah diimplementasikan sebelumnya. Apakah batasan tersebut berlaku atau tidak? Misalnya, dengan mengisi data null, apakah database akan menerima atau tidak? Jika tidak menerima/gagal/error, maka constraint berhasil diberlakukan.
