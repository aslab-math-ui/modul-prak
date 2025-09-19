# README Asisten Lab
19 September 2025

# Table of Contents
- [Local Setup](#local-setup)
- [Modul]()
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
git submodule update --init --recursive
```

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

Notes:
Apabila menemukan error seperti ini
```
WARN: Unable to resolve link target: modul\2024\genap\persamaan_diferensial_numerik\pdnum2024genap.qmd
```
menandakan modul yang dibuat bergantung pada modul tahun lalu. Peringatan 
ini dapat diabaikan. Apabila ingin diperbaiki, silahkan baca [Readme Git Manager](README-gitmanager.md)

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

### Upload Render Module ke Website
1. Buka git bash, pastikan berada di direktori ```modul-prak```
2. Pastikan git berada di branch ```aslab``` dengan mengetik ```git branch``` di terminal git bash
3. Copy hasil render ke folder lain (karena folder project akan ganti branch)
4. Pada terminal git bash jalankan

```
git submodule deinit -f --all
git switch website
```

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

Notes: Apabila render memerlukan beberapa aset, silahkan hubungi koordinator 

## Modifikasi Modul
Apabila sudah melakukan ```git commit``` dan ```git push``` modul ingin 
diperbaiki (dalam kurun waktu yang dekat) lakukan hal ini sebelum upload kembali.

Sebelum mengetik ```git add .```
1. Carilah nilai hash commit (biasanya dalam 7 digit hex seperti 2c4218a)
2. Ketik baris ini pada terminal
```
git reset --soft 2c4218a
```
3. Gunakan ```git push --force``` dan bukan ```git push``` yang biasa 

Hal ini perlu dilakukan untuk mencegah memori repo membengkak dan banyaknya commit yang tidak optimal.