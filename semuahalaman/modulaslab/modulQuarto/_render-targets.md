## Render Targets

Secara default, semua input Quarto yang valid (.qmd, .ipynb, .md, .Rmd) di dalam direktori project akan di render, simpan salah satu dari:

1.  Sebuah file atau prefix direktori `.` (hidden files)

2.  Sebuah file atau prefix direktori `_` (secara tipe digunakan untuk file non top-level, yakni termasuk A file or directory prefix of `_` (typically used for non top-level files, yakni satu [included](https://quarto.org/docs/authoring/includes.html) di file lain)

3.  File bernama `README.md` atau `README.qmd` (yang mana secara tipe tidak aktual render targets tapi konten informational sedikit sumber kode untuk dilihat di dalam web UI version control).

Jika kalian tidak ingin render semua target dokumen di dalam sebuah project, atau kalian harapkan untuk urutan secara precise rendering, kalian dapat menambahkan`project: render: [files]` entry untuk metadata project kalian. Contoh:

``` yaml
project:
  render:
    - section1.qmd
    - section2.qmd
```

Perhatikan bahwa kalian dapat menggunakan wildcards ketikan mendefinisikan list `render`. Misalnya:

``` yaml
project:
  render:
    - section*.qmd
```

Kalian dapat juga menggunakan prefix (awalan `!` untuk menghiraukan beberapa file atau direktori dalam list `render`. 
Perhatikan bahwa kasus kalian butuh dimulai dengan menspesifikasikan *semua* yang kalian ingin render. Misalnya:

``` yaml
project:
  render:
    - "*.qmd"
    - "!ignored.qmd"
    - "!ignored-dir/"
```

::: callout-note
Jika sebuah nama dari file output membutuhkan dimulai dengan `.` atau `_` (misalnya `_index.md` untuk pengguna Hugo), Kalian harus memberi nama Quarto file input tanpa prefix (misalnya `index.qmd`) dan tambahkan secara eksplisit `output-file` parameter di dalam YAML seperti

``` yaml
---
output-file: _index.md
---
```
:::
