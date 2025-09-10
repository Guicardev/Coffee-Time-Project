// Sélection des éléments
const filterBtn = document.querySelector(".catalogue__filter-btn");
const filtersPanel = document.getElementById("filtersPanel");

// Toggle du panneau
filterBtn.addEventListener("click", (e) => {
  e.stopPropagation(); // éviter la propagation
  filtersPanel.classList.toggle("is-visible");
});

// Fermer si clic à l’extérieur
document.addEventListener("click", (e) => {
  if (
    filtersPanel.classList.contains("is-visible") &&
    !filtersPanel.contains(e.target) &&
    !filterBtn.contains(e.target)
  ) {
    filtersPanel.classList.remove("is-visible");
  }
});
