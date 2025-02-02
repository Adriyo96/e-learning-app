
## Cara Instalasi dan Menjalankan Backend

### Prasyarat
- PHP >= 7.3
- Composer
- SQLite atau database lain yang didukung oleh Laravel

### Langkah-langkah
1. Clone repository ini:
    ```sh
    git clone https://github.com/username/e-learning-app.git
    ```
2. Pindah ke direktori backend:
    ```sh
    cd e-learning-app/backend
    ```
3. Instal dependensi menggunakan Composer:
    ```sh
    composer install
    ```
4. Salin file `.env.example` menjadi `.env`:
    ```sh
    cp .env.example .env
    ```
5. Konfigurasi file `.env` sesuai dengan pengaturan database Anda:
    ```plaintext
    DB_CONNECTION=sqlite
    DB_DATABASE=/path/to/database/database.sqlite
    ```
6. Buat file database SQLite:
    ```sh
    touch database/database.sqlite
    ```
7. Jalankan migrasi untuk membuat tabel:
    ```sh
    php artisan migrate
    ```
8. Jalankan server Laravel:
    ```sh
    php artisan serve
    ```

## Cara Instalasi dan Menjalankan Frontend

### Prasyarat
- Flutter SDK

### Langkah-langkah
1. Pindah ke direktori frontend:
    ```sh
    cd ../frontend
    ```
2. Instal dependensi menggunakan Flutter:
    ```sh
    flutter pub get
    ```
3. Jalankan aplikasi Flutter:
    ```sh
    flutter run
    ```

## Informasi Endpoint API

### Autentikasi
- `POST /register` - Registrasi pengguna baru
- `POST /login` - Login pengguna

### Manajemen Materi Pelajaran
- `GET /materials` - Menampilkan semua materi
- `POST /materials` - Menambahkan materi baru
- `PUT /materials/{id}` - Mengedit materi
- `DELETE /materials/{id}` - Menghapus materi

### Manajemen Ujian
- `GET /exams` - Menampilkan daftar ujian
- `POST /exams` - Menambahkan ujian baru
- `PUT /exams/{id}` - Mengedit ujian
- `DELETE /exams/{id}` - Menghapus ujian

### Mengerjakan Ujian
- `GET /exams/{id}/questions` - Mendapatkan soal ujian berdasarkan ID
- `POST /exams/{id}/submit` - Mengirim jawaban ujian

### Melihat Nilai Ujian
- `GET /grades` - Menampilkan daftar nilai ujian siswa

## Dokumentasi API
Untuk dokumentasi API yang lebih lengkap, Anda dapat menggunakan Postman atau Swagger.

---

Semoga panduan ini membantu Anda dalam menginstal dan menjalankan aplikasi e-learning ini. Jika ada pertanyaan atau masalah, jangan ragu untuk menghubungi saya!
