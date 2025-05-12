## 2.8 📄 Navigasi Antar Halaman

Kalau situs kamu punya banyak halaman dalam satu bagian atau sub-bagian, sangat membantu untuk menyediakan **navigasi antar halaman** di bagian bawah halaman — biar pembaca bisa langsung lanjut ke halaman berikutnya atau kembali ke sebelumnya 🧭.

Navigasi ini akan muncul secara otomatis di bagian bawah halaman **kalau memang ada** halaman sebelum atau sesudahnya (termasuk yang ada di bagian atau sub-bagian lain).

🟢 Fitur ini secara **default aktif untuk proyek bertipe buku**, tapi untuk situs biasa harus diaktifkan secara manual.

---

✅ Kamu bisa mengaktifkan fitur ini untuk seluruh situs menggunakan konfigurasi berikut:

```{.yaml filename="_quarto.yml"}
website:
  page-navigation: true
```

🧩 Ketika sudah diaktifkan, navigasi akan tampil otomatis di bagian bawah halaman, **selama memang ada halaman selanjutnya atau sebelumnya**. Fitur ini membuat pengalaman membaca jadi lebih mulus!

---

🔧 Kamu juga bisa **mengatur navigasi per halaman** dengan menambahkan `page-navigation` di YAML *front matter* halaman tertentu.


```{.yaml filename="basics.qmd"}
---
page-navigation: false
---
```

📂 Atau kalau kamu ingin mengatur semua halaman dalam satu folder sekaligus, kamu bisa menaruh pengaturan ini di file [`_metadata.yml`](https://quarto.org/docs/projects/quarto-projects.html#directory-metadata):

``` {.yaml filename="_metadata.yml"}
page-navigation: false
```
