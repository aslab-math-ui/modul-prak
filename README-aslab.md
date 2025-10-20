# README Asisten Lab
2 Oktober 2025

# Table of Contents
- [Pengantar](#pengantar)
- [Local Setup](#local-setup)
- [Workflow direct super-repo](#workflow-langsung-git-submodule-dari-super-repo)
- [Workflow indirect](#workflow-tidak-langsung-git-submodule-dari-super-repo)
- [Workflow Just](#instalasi-just)
- [Inisialisasi](#inisialisasi)
- [Modul]()
  - [Melihat Modul](#melihat-modul)
  - [Membuat Modul](#membuat-modul)
  - [Render Modul](#render-modul)
  - [Upload Modul](#upload-modul)
- [Troubleshoot](#troubleshooting)

## Pengantar

Halo, Asisten Lab. Panduan ini akan membantumu untuk pengelolaan website Laboratorium. Ada beberapa alur kerja mengelola website ini. 

1. **Submodule** langsung dari *super-repo*
2. **Submodule** tidak langsung atas berbagai repositori yang dibutuhkan.
3. Menggunakan bantuan just.
4. Deploy ke Website


## Local Setup
Requirements:
1. Git Bash
2. Quarto
3. Python/R

Pada terminal git bash, pindah ke direktori untuk inisialisasi projek.
Selanjutnya jalankan kode ini baris per baris

```bash
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

Pada R console, jalankan kode ini baris per baris
```r
install.packages("renv")
renv::restore()
```

## Workflow langsung Git Submodule dari **super-repo**

### Konsep Inti: Submodule langsung adalah "Shortcut" Berversi

Bayangkan **super-repo** kamu adalah sebuah folder utama. Di dalamnya, submodule bukanlah salinan dari repo lain, melainkan sebuah **"shortcut" atau penunjuk (pointer)**.

Shortcut ini sangat spesifik: ia tidak menunjuk ke repo-nya secara umum, tapi menunjuk ke satu **commit hash** yang pasti. Sederhananya konsep ini kita sebut **submodule** itu  **"dipaku"** (pinned) ke **super-repo**.

- **Keuntungan:** Kamu bisa memastikan bahwa proyek utamamu selalu menggunakan versi library atau komponen yang sudah teruji (commit `abc123`), meskipun library tersebut terus di-update oleh pengembangnya.

- **Konsekuensi:** Super-repo tidak peduli dengan branch, history, atau perubahan lain di dalam submodule. Ia hanya peduli pada satu hal: "Untuk proyek ini, gunakan kode dari submodule tepat di commit `abc123`."

### Berikut adalah alur kerja langsung git submodule

1. Tentukan bebas direktori local.
2. Git clone modul-prak utama.
3. Change Directory ke modul-prak.

```bash
cd modul-prak
```

Nah, nanti kita akan melihat direktori dan file ini.

```
.
├── .gitmodules
├── README-aslab.md
├── README-gitmanager.md
├── README.md
├── assets
├── modul
│   ├── 2022
│   ├── 2023
│   ├── 2024
│   ├── 2025
│   └── _spesial
│   

dan seterusnya
```

4. Daftarkan submodule ke direktori yang dituju.

```bash
git submodule --init --recursive --remote path/dituju
```

Tinggal ganti `path/dituju` sesuai kebutuhan.

Jika butuh assets, maka ganti `path/dituju` dengan `assets`.

Jika butuh modul/2025, maka ganti `path/dituju` dengan `modul/2025`. Dan seterusnya.

5. Ingin melakukan perubahan: Change Directory ke `path/dituju`.

```bash
# Misal ingin ubah isi modul/2025
cd modul/2025
```

6. Ingin melakukan perubahan: Ganti hash commit ke branch lain.

Sebelumnya kita punya tanda.

```
~/modul-prak (main)
```

setelah berpindah menjadi

```
~/modul-prak/modul/2025 ((eaeffb6...))
```

Perhatikan secara teknis, kamu bisa membuat perubahan dan bahkan commit di sini. Tapi, commit itu akan "mengambang" dan tidak terikat pada branch manapun. Commit ini sangat mudah hilang dan tidak akan tercatat dalam sejarah pengembangan submodule secara benar.

Pindah hash commit.

```bash
git checkout main
```

nanti akan menjadi seperti

```
~/modul-prak/modul/2025 (main)
```

7. Ingin melakukan perubahan: Lakukan perubahan. 

Kita bisa lakukan perubahan sesuai dengan keinginan kita. Siklus kerja Git normal di sini. Perubahan ini di-push ke remote repository **milik submodule**.

Karena sudah ada di brach main. Bisa lakukan seperti biasa.

```bash
git fetch # pastikan kita berada di pointer paling baru
git pull # ambil pembaruan
```
Atau jika ingin di branch tertentu dipersilahkan. Lakukan perubahan kalian. Setelah selesai, alurnya normal seperti biasa.

```bash
git add nama_file # Kalau sekaligus banyak, gunakan .
```
Commit message seperti biasa dan push.

```bash
git commit -m "Pesan Commit kalian"
git push origin main # Push ke remote submodule.
```

Sampai sini sudah selesai menambahkan di repositori modul/2025.

8. Perbarui Commit Hash modul-prak.

Sekarang, kembali ke super-repo dan beri tahu bahwa ada versi submodule `modul/2025` yang lebih baru yang harus digunakan.

```bash
cd ../../ # perhatikan kalau dari assets mundur sekali
git status
```

Outputnya akan seperti ini

```
modified:   modul/2025 (new commits)
```

Terakhir, push ke remote.

```bash
git add modul/2025
git commit -m "feat: Mengintegrasikan fungsi X dari modul 2025 PSD"
git push # Push ke remote super-repo
```

## Workflow tidak langsung Git Submodule dari **super-repo**

### Konsep Inti: Submodule tidak langsung seperti mengganti versi "Shortcut"

Bayangkan **super-repo** kamu adalah sebuah folder utama. Di dalamnya, submodule bukanlah salinan dari repo lain, melainkan sebuah **"shortcut" atau penunjuk (pointer)**.

Shortcut ini sangat spesifik: ia tidak menunjuk ke repo-nya secara umum, tapi menunjuk ke satu **commit hash** yang pasti. Sederhananya konsep ini kita sebut **submodule** itu  **"dipaku"** (pinned) ke **super-repo**.

Cara kerja **paku** ini membuat kamu bisa clone saja direktori yang dituju. Lakukan segala perubahan direktori itu. Ketika sudah selesai, maka perbarui **"paku"** yang berada di **super-repo**.

- **Keuntungan:** Kamu tidak perlu khawatir git yang ditambahkan di direktori akan ditambahkan ke **super-repo** atau **submodule**.
- **Konsekuensi:** Kamu tidak bisa langsung `quarto render`. 

### Berikut adalah alur kerja tidak langsung git submodule

1. Tentukan bebas direktori local.
2. Git clone modul-prak utama dan modul yang ingin dituju (misal `modul/2025`)

```bash
git clone https://github.com/aslab-math-ui/modul-prak.git # super-repo
git clone https://github.com/aslab-math-ui/modul_2025.git # ubah modul/2025
git clone https://github.com/aslab-math-ui/asset.git # ubah asset
```

3. Change Directory ke modul yang ingin dituju.

```
cd modul_2025 # misalkan ingin melakukan perubahan di modul 2025
```

4. Lakukan siklus kerja Git Normal disini.

- Menarik Pembaruan
```bash
git fetch
git pull
```

- Lakukan perubahan yang dibutuhkan
- Push ke remote
```bash
git add <nama_file> # untuk sekaligus gunakan .
git commit -m "added: tugas 1 PSD"
git push # remote modul/2025
```

5. Perbarui **hash commit** super-repo (ganti paku terbaru)

Pindah ke modul-prak.

```bash
# jika masih berasal modul_2025. kita mundur dulu 1, lalu masuk ke modul-prak
cd ../modul-prak
```

6. Ambil pembaruan modul/2025

untuk pertama kali clone, daftarkan dahulu
```bash
# daftarkan folder pertama kali
git submodule update --init --recursive modul/2025 # daftarkan modul 2025
```

lalu, ambil pembaruan yang dibuat
```bash
git submodule update --remote modul/2025
```

7. Tuntaskan pembaruan ke remote

Setelah pembaruan terambil. Maka, tersisa kita paku hash terbaru (push ke remote).

```bash
# lihat ada yang berubah
git status
# nanti ada yang termodifikasi
```

lalu, tuntaskan publish ke remote
```bash
git add .
git commit -m "chore: modified modul PSD pekan 3"
git push
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

### Inisialisasi
Pastikan untuk menjalankan ```just init``` atau ```cd modul/tahun_ajaran && git switch main && git pull``` sebelum menyusun modul.

### Melihat Modul
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