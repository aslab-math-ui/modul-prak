window.document.addEventListener("DOMContentLoaded", function () {
  if (document.getElementById('arsip-praktikum')) {
    var options = {
      valueNames: [ 
        'nama-praktikum', 
        'deskripsi', 
        'tahun',      
        'semester'    
      ]
    };

    var praktikumList = new List('arsip-praktikum', options);

    window.filterPraktikum = function(button) {
      const filter = button.getAttribute('data-filter');
      
      praktikumList.filter(function(item) {
        if (filter === 'all') {
          return true;
        } else {
          return item.values().tahun.trim() === filter;
        }
      });

      document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');
    };
  }
});