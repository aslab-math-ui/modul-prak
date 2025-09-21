document.addEventListener("DOMContentLoaded", () => {
  fetch("../data/modul.json")
    .then(response => response.json())
    .then(data => {
      const container = document.getElementsByClassName("kartu_matkul")[0];

      generateCards(container, data)
    })
    .catch(err => console.error("Error loading JSON:", err));
});

const filterPraktikum = (button) => {
    const filter = button.getAttribute('data-filter');
    fetch("../data/modul.json")
    .then(response => response.json())
    .then(data => {
      const container = document.getElementsByClassName("kartu_matkul")[0];
      container.innerHTML = ""

      const filtered = data.filter((item) => {
        if (filter == 'all') {
          return true
        } else {
          return item.tahun_ajaran == filter
        }
      })
      generateCards(container, filtered)
      document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');
    })
    .catch(err => console.error("Error loading JSON:", err));   
};

const generateCards = (container, data) => {
    data.forEach(doc => {
        const card = document.createElement("div");
        card.className = "g-col-12 g-col-md-6 g-col-lg-4";
        card.innerHTML = `
        <div class="card h-100 praktikum-card">
        <div class="card-body">
            <h5 class="card-title nama-praktikum">${doc.mata_kuliah}</h5>
            <p class="card-text small deskripsi">Kurikulum ${doc.kurikulum}</p>
        </div>
        <div class="card-footer">
            <p class="subjects">
            </p>
        </div>
        <div class="card-footer">
            <p>
            <span class="badge bg-info semester">${doc.semester}</span>
            <span class="badge bg-secondary tahun" data-tahun="2025">${doc.tahun_ajaran}</span>
            </p>

            <p>
            <a href=${doc.link} class="stretched-link"></a>
            </p>    
        </div>
        </div>
        `;
        const subject = card.getElementsByClassName("subjects")[0];
        subject.innerHTML = doc.subjects
          .map(subject => `<span class="badge badge-${subject}">${subject.charAt(0).toUpperCase() + subject.slice(1)}</span>`)
          .join(" ");
        container.appendChild(card);
      });
}

searchJSON = () => {
    const query = document.getElementById("search").value;
    if (query.trim() === "") return;
    const regex = new RegExp(query, "i");

    fetch("../data/modul.json")
    .then(response => response.json())
    .then(data => {
      const container = document.getElementsByClassName("kartu_matkul")[0];
      container.innerHTML = ""

      const matches = data.filter(item => regex.test(item.mata_kuliah));
      generateCards(container, matches)
    })
}