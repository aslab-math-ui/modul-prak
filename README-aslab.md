# README Asisten Lab
20 September 2025

# Table of Contents
- [Local Setup](#local-setup)
- [Git Basics](#git-basics)
- [Git Submodules](#git-submodules)
- [Modul]()
  - [Melihat Modul](#melihat-modul)
  - [Membuat Modul](#membuat-modul)
  - [Render Modul](#render-modul)
  - [Upload Modul](#upload-modul)


## Local Setup
Requirements:
1. Git Bash
2. Quarto
3. Python/R

Pada terminal git bash, pindah ke direktori untuk inisialisasi projek.
Selanjutnya jalankan kode ini baris per baris
```
git clone https://github.com/aslab-math-ui/modul-prak.git
cd modul-prak
git submodule update --init --recursive modul/2025
```
Penjelasan:
git clone berfungsi untuk melakukan cloning project dari repo modul-prak ke local. ```git submodule update```

### R Environment Setup
Requirements:
1. R
2. Rtools

Pada terminal git bash, jalankan kode ini baris per baris
```
R
install.packages("renv")
renv::restore()
```

### Python Environment Setup

## Git Basics
Pemahaman tentang git diperlukan untuk memahami alur penyimpanan projek ini. Berikut beberapa perintah yang perlu diingat.

1. ```git clone alamat/repo.git nama_di_local```: Berfungsi untuk menduplikasi project github ke lokal
2. ```git pull```: Mengambil update terbaru project dari github. Fitur ini sangat disarankan untuk dijalankan setiap kali kalian membuka project secara lokal.
3. ```git add .```: Menyimpan semua perubahan kedalam tahap "staging" (perubahan lokal yang tidak bisa diupdate ke github)
4. ```git commit -m "Pesan commit"```: Menyimpan semua perubahan secara resmi (dalam bentuk commit) dan bisa di update ke github
5. ```git push```: Mendorong perubahan lokal ke github.

WARNING: Konflik yang sering terjadi adalah ketika banyak kontributor ingin melakukan perubahan dengan ```git push``` dalam kurun waktu yang dekat. Hal ini dapat diatasi dengan ```merge branch``` tapi untuk mencegah ini lebih baik melakukan ```git pull``` setiap kali membuka project secara lokal.

## Git Submodules
Projek ini memanfaatkan teknologi ```git submodules``` untuk mengatasi permasalahan alokasi memori pada github. Berikut beberapa perintah yang perlu diketahui

1. ```git submodule update --init nama-modul```: Jalankan perintah ini apabila local kalian belum terhubung dengan git repo ```modul``` atau ```assets```
2. ```git submodule update nama-modul```: Berfungsi serupa dengan ```git pull```, apabila ada perubahan pada submodul (semisal ```modul/2025```), jalankan ini untuk memperoleh update terbaru.
3. ```git submodule deinit nama-modul```: Berfungsi untuk menghapus submodule (secara lokal).

## Melihat Modul
Apabila sudah menjalankan [Local Setup](#local-setup) ada satu folder dalam ```modul```. 
Untuk melihat modul pada tahun yang lalu (misal 2023) ketik pada terminal bash
```
git submodule update --init modul/2023
```

Apabila sudah puas melihat modul tahun lalu dan ingin menghapusnya dari projek lokal, ketik pada terminal bash
```
git submodule deinit modul/2023
```

## Membuat Modul
Semua modul disimpan dalam folder ```modul/tahun_ajaran/semester/mata_kuliah```. Untuk membuat modul, ada 2 cara.

Cara 1:
1. Liat file modul ```.qmd``` tahun lalu pada direktori ```modul``` atau repo modul tahun lalu.
2. Copy ke dalam direktori ```modul``` tahun sekarang
3. Modifikasi sesuai keperluan asisten.

Cara 2: 
1. Buat file baru dengan ekstensi ```.qmd``` pada direktori yang sesuai (didalam ```modul```)
2. Silahkan menyusun modul dari awal

## Render Modul
Misalkan akan dirender modul PSD tahun 2025 yang terletak di 
```modul/2025/ganjil/pengantar_sains_data/psd2025.qmd```
1. Buka git bash, pastikan berada di direktori ```modul-prak```
2. Pada terminal git bash jalankan

```
quarto render modul/2025/ganjil/pengantar_sains_data/psd2025.qmd
```
3. Hasil render akan berada di ```docs/modul/2025/ganjil/pengantar_sains_data/psd2025.html```
4. Hasil ini dapat ditampilkan pada web browser.

Notes:
Apabila menemukan error seperti ini
```
WARN: Unable to resolve link target: modul\2024\genap\persamaan_diferensial_numerik\pdnum2024genap.qmd
```
menandakan modul yang dibuat bergantung pada modul tahun lalu. Peringatan 
ini dapat diabaikan. Ini dapat diperbaiki dengan mengkoneksi ```modul/2024``` ke project lokal (lihat [Melihat Modul](#melihat-modul)).

## Upload Modul
Misalkan saya telah menyelesaikan modul stuktur data 2025 di 
```modul/2025/ganjil/struktur_data/modul1.ipynb```

### Upload Source Modul ke Repo Tahunan
1. Buka git bash, pastikan berada di direktori ```modul-prak```
2. Pada terminal git bash jalankan
```
cd modul/2025
git switch main
git pull
git add .
git commit -m "Upload Modul 1 Struktur Data 2025"
git push
cd ../..
```
Penjelasan:
1. ```cd modul/2025``` mengubah direktori terminal ke dalam folder ```modul/2025```
2. ```git switch main``` memastikan kita berada di branch main pada repo ```modul_2025```
3. ```cd ../..``` mengembalikan kita kembali ke direktori utama pada terminal

### Upload Render Module ke Website
1. Buka git bash, pastikan berada di direktori ```modul-prak```
2. Pastikan git berada di branch ```main``` dengan mengetik ```git branch``` di terminal git bash
3. Copy hasil render ke folder lain (karena folder project akan ganti branch)
4. Pada terminal git bash jalankan

```
git submodule deinit -f --all
git switch website
```
Penjelasan: Baris pertama akan menghapus semua dependensi projek ke repo lain, lalu baris kedua akan memindahkan project ke branch ```website```

5. Sekarang project berada di branch website, copy hasil render ke
```docs/modul/2025/ganjil/struktur_data/```
6. Upload perubahan ini ke github melalui terminal git bash
```
git pull
git add .
git commit -m "Upload halaman modul strukur data 2025"
git push
```

7. Untuk kembali ke branch awal, jalankan kedua baris ini di terminal git bash
```
git switch main
git submodule update --init --recursive
```
### Upload Gambar atau Dataset ke Repo Asset
1. Buka git bash, pastikan berada di direktori ```modul-prak```
2. Jalankan ```git submodule update --init assets``` sehingga folder assets akan terkoneksi dengan repo ```asset```.
3. Tambahkan gambar atau dataset pada folder yang sesuai dalam folder ```assets```
2. Pada terminal git bash jalankan
```
cd assets
git switch main
git pull
git add .
git commit -m "Added assets for struktur_data"
git push
cd ..
```
Penjelasan:
1. ```cd assets``` mengubah direktori terminal ke dalam folder ```assets```
2. ```git switch main``` memastikan kita berada di branch main pada repo ```asset```
3. ```cd ..``` mengembalikan kita kembali ke direktori utama pada terminal

## Modifikasi Modul
Apabila sudah melakukan ```git commit``` dan ```git push``` modul ingin 
diperbaiki (dalam kurun waktu yang dekat) lakukan hal ini sebelum upload kembali.

Sebelum mengetik ```git add .```
1. Carilah nilai hash commit (biasanya dalam 7 digit hex seperti 2c4218a). Nilai ini bisa dilihat dengan ```git log``` pada terminal
2. Ketik baris ini pada terminal
```
git reset --soft 2c4218a
```
3. Gunakan ```git push --force``` dan bukan ```git push``` yang biasa 

Hal ini perlu dilakukan untuk mencegah memori repo membengkak dan banyaknya commit yang tidak optimal.