document.addEventListener("DOMContentLoaded", () => {
  // ===== Intensité café =====
  const intensityContainer = document.querySelector(".product-intensity");
  const beansContainer = intensityContainer.querySelector(".beans");
  const intensity = parseInt(intensityContainer.dataset.intensity) || 0;

  for (let i = 1; i <= 10; i++) {
    const span = document.createElement("span");
    span.classList.add("bean");
    span.textContent = "☕";
    if (i <= intensity) span.classList.add("active");
    beansContainer.appendChild(span);
  }

  // ===== Sélection grammage =====
  const weightInputs = document.querySelectorAll(
    ".product-weight input[type='radio']"
  );
  const weightLabels = document.querySelectorAll(".product-weight label");
  const priceEl = document.querySelector(".product-price strong");

  const basePrice = 12.9; // prix pour 250g de base

  weightInputs.forEach((input) => {
    input.addEventListener("change", () => {
      // Mise à jour du prix selon le grammage
      let multiplier = 1;
      if (input.value === "500") multiplier = 2;
      if (input.value === "1000") multiplier = 4;

      const newPrice = (basePrice * multiplier).toFixed(2);
      priceEl.textContent = `${newPrice} €`;

      // Effet visuel sur le bouton sélectionné
      weightLabels.forEach((label) => label.classList.remove("active"));
      const selectedLabel = input.nextElementSibling;
      if (selectedLabel) selectedLabel.classList.add("active");
    });
  });

  // ===== Initialisation =====
  weightInputs.forEach((input) => {
    if (input.checked) {
      const selectedLabel = input.nextElementSibling;
      if (selectedLabel) selectedLabel.classList.add("active");
    }
  });
});
