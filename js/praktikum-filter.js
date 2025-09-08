window.document.addEventListener("DOMContentLoaded", function () {
  if (document.getElementById('arsip-praktikum')) {
    var options = {
      valueNames: [ 
        'nama-praktikum', 
        'deskripsi', 
        { data: ['tahun', 'semester'] } 
      ]
    };

    var praktikumList = new List('arsip-praktikum', options);

    // Fungsi untuk filter
    window.filterPraktikum = function(button) {
      const filter = button.getAttribute('data-filter');
      
      praktikumList.filter(function(item) {
        if (filter === 'all') {
          return true;
        } else {
          // Filter berdasarkan tahun
          return item.values().tahun.includes(filter);
        }
      });

      // Update active button state
      document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');
    };
  }
});