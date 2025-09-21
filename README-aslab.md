# README Asisten Lab
20 September 2025

# Table of Contents
- [Local Setup](#local-setup)
- [Instalasi Just](#instalasi-just)
- [Inisialisasi](#inisialisasi)
- [Modul]()
  - [Melihat Modul](#melihat-modul)
  - [Membuat Modul](#membuat-modul)
  - [Render Modul](#render-modul)
  - [Upload Modul](#upload-modul)
- [Troubleshoot](#troubleshooting)


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

## Instalasi Just
PERINGATAN: Penerapan ```just``` masih dalam tahap pengujian. Apabila sedang melakukan pembuatan modul, pastikan file modul disimpan di lokasi lain sebelum menerapakan command ```just```. Lebih baik lagi, pelajari langsung cara menggunakan git basics dan submodules pada [README Git Manager](README-gitmanager.md)
1. Download just dari [Github Repo Just](https://github.com/casey/just/releases) Pilih yang ```x86_64-pc-windows-msvc.zip``` untuk windows

2. Extract folder
3. Pindahkan ke tempat yang aman dan simpan pathnya
4. Masuking pathnya kedalam environment variabless
5. Buka git bash dan ketik ```just version``` untuk memastikan just sudah ada.

Dengan ```just```, kalian tidak perlu ribet mengurus ```git``` dan ```submodules```

## Inisialisasi
Pastikan untuk menjalankan ```just init``` atau ```cd modul/tahun_ajaran && git switch main && git pull``` sebelum menyusun modul.

## Melihat Modul
Apabila sudah menjalankan [Local Setup](#local-setup) ada satu folder dalam ```modul```. 
Untuk melihat modul pada tahun yang lalu (misal 2023) ketik pada terminal bash
```
just see modul 2023
```

Apabila sudah puas melihat modul tahun lalu dan ingin menghapusnya dari projek lokal, ketik pada terminal bash
```
just unsee modul 2023
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

### Menyisipkan Gambar atau Asset Lainnya.
Gambar pada projek ini perlu di simpan pada repo ```asset``` terlebih dahulu. Silahkan cek repo ```asset``` untuk memastikan gambar sudah ada disana. Apabila belum, ikut langkah [Upload Gambar atau Dataset ke Repo Asset](#upload-gambar-atau-dataset-ke-repo-asset)

Untuk menyisipkan gambar pada modul, gunakan alamat lengkap dari repo ```asset```. Misalkan ingin menggunakan ```linked_list.png``` dari ```asset/struktur_data/static/linked_list.png```, maka pada modul 
sisipkan 
```
https://raw.githubusercontent.com/aslab-math-ui/asset/struktur_data/static/linked_list.png
```


## Render Modul
Misalkan akan dirender modul PSD tahun 2025 yang terletak di 
```modul/2025/ganjil/pengantar_sains_data/psd2025.qmd```
1. Buka git bash, pastikan berada di direktori ```modul-prak```
2. Pada terminal git bash jalankan

```
quarto render modul/2025/ganjil/pengantar_sains_data/psd2025.qmd
```
atau
```
just render modul/2025/ganjil/pengantar_sains_data/psd2025.qmd
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
just upload 2025 modul/2025/ganjil/struktur_data/modul1 modul1 qmd
```
untuk ```.qmd``` atau
```
just upload 2025 modul/2025/ganjil/struktur_data/modul1 modul1 ipynb
```
untuk ```.ipynb```

PERHATIKAN yang penting disini adalah 4 kata setelah ```upload```, 
Kata pertama menyatakan tahun modul. Kata kedua 
adalah path modul TANPA ekstensi file. Kata ketiga adalah 
nama modul yang disimpan. Kata terakhir (```qmd/ipynb```) menyatakan ekstensi file.

### Upload Gambar atau Dataset ke Repo Asset
1. Buka git bash, pastikan berada di direktori ```modul-prak```
2. Jalankan ```just seeAssets``` sehingga folder assets akan terkoneksi dengan repo ```asset```.
3. Tambahkan gambar atau dataset pada folder yang sesuai dalam folder ```assets```
2. Pada terminal git bash jalankan
```
just uploadAssets
```

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

## Troubleshooting

### Saya telah melakukan push ke github tapi ingin dibatalkan.
1. Pada github, cara nilai hash commit sebelumnya (biasanya dalam 7 digit hex seperti 2c4218a)
2. Pada terminal jalankan
```
git reset --soft 2c4218a
git push --force
```
3. Semua perubahan dari commit setelah 2c4218a disimpan secara lokal.

### Saat menjalankan just, saya mendapati error
Baca 3 baris terakhir errornya

Kasus 1: Ditemukan hal ini
```
Your branch is up to date with 'origin/website'
```
Penjelasan: Muncul ketika melakukan ```just upload```, terjadi karena 
anda ingin mengubah website namun tidak ada yang berubah. Potensi terjadi pada file ```.ipynb``` yang dimana konten didalamnya tidak berubah tapi source code ```.ipynb``` berubah. Saran: Pastikan ada perubahan yang dilakukan pada modul sebelum menjalankan ```just upload```.

Kasus 2: Ditemukan hal ini
```
Your branch is up to date with 'origin/main'.
```
Penjelasan: Muncul ketika melakukan ```just upload```, terjadi karena 
anda ingin mengubah repo ```modul``` atau ```modul-prak```, tetapi tidak ada yang berubah. Saran: Lakukan ```git reset --soft``` ke commit sebelumnya pada repo ```modul``` atau ```modul-prak``` dan ```git push --force``` sebelum menjalankan ```just upload``` kembali.

Kasus 3: Ditemukan hal ini
```
error: The following untracked working tree files would be overwritten by checkout:
        ganjil/struktur_data/modul_11.ipynb
Please move or remove them before you switch branches.
Aborting
error: Recipe `upload` failed on line 35 with exit code 1
```
Penjelasan: Terjadi ketika kalian melakukan pengubahan pada repo modul, tapi bukan pada branch main. Terjadi karena lupa melakukan [inisialisasi](#inisialisasi)

# ERRORS
Baca [Readme untuk Git Manager](README-gitmanager.md)