window.document.addEventListener("DOMContentLoaded", function () {
  if (document.getElementById('arsip-praktikum')) {
    // PERUBAHAN DI SINI: valueNames disederhanakan
    var options = {
      valueNames: [ 
        'nama-praktikum', 
        'deskripsi', 
        'tahun',      // Langsung baca teks dari class .tahun
        'semester'    // Langsung baca teks dari class .semester
      ]
    };

    var praktikumList = new List('arsip-praktikum', options);

    // Fungsi untuk filter tetap sama, tetapi sekarang akan bekerja
    window.filterPraktikum = function(button) {
      const filter = button.getAttribute('data-filter');
      
      praktikumList.filter(function(item) {
        if (filter === 'all') {
          return true;
        } else {
          // Membandingkan nilai teks yang dibaca dari class .tahun
          return item.values().tahun.trim() === filter;
        }
      });

      // Update active button state
      document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');
    };
  }
});