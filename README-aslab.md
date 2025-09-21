# README Asisten Lab
20 September 2025

# Table of Contents
- [Local Setup](#local-setup)
- [Instalasi Just](#instalasi-just)
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

## Instalasi Just
1. Download just dari [Github Repo Just](https://github.com/casey/just/releases) Pilih yang ```x86_64-pc-windows-msvc.zip``` untuk windows

2. Extract folder
3. Pindahkan ke tempat yang aman dan simpan pathnya
4. Masuking pathnya kedalam environment variabless
5. Buka git bash dan ketik ```just version``` untuk memastikan just sudah ada.

Dengan ```just```, kalian tidak perlu ribet mengurus ```git``` dan ```submodules```

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
just upload qmd modul/2025/ganjil/struktur_data/modul1 modul1
```
untuk ```.qmd``` atau
```
just upload ipynb modul/2025/ganjil/struktur_data/modul1 modul1
```
untuk ```.ipynb```

PERHATIKAN yang penting disini adalah 3 kata setelah ```upload```, 
kata pertama (```qmd/ipynb```) menyatakan ekstensi file. Kata kedua 
adalah path modul TANPA ekstensi file. Kata ketiga adalah 
nama modul yang disimpan.

### Upload Gambar atau Dataset ke Repo Asset
1. Buka git bash, pastikan berada di direktori ```modul-prak```
2. Jalankan ```just seeAssets``` sehingga folder assets akan terkoneksi dengan repo ```asset```.
3. Tambahkan gambar atau dataset pada folder yang sesuai dalam folder ```assets```
2. Pada terminal git bash jalankan
```
just uploadAssets
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