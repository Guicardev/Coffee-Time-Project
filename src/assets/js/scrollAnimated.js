// scrollAnimated.js
document.addEventListener("DOMContentLoaded", () => {
  const sections = document.querySelectorAll(".fade-in-section");

  const observerOptions = {
    threshold: 0.1,
  };

  const observer = new IntersectionObserver((entries, obs) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const section = entry.target;
        section.classList.add("is-visible");

        const children = section.querySelectorAll(".fade-in-child");
        children.forEach((child, index) => {
          child.style.transitionDelay = `${index * 0.2}s`;
        });

        obs.unobserve(section); // Stop observing once visible
      }
    });
  }, observerOptions);

  sections.forEach((section) => observer.observe(section));
});
