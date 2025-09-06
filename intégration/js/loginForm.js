const loginBtn = document.getElementById('loginBtn');
const loginForm = document.getElementById('loginForm');

loginBtn.addEventListener('click', (e) => {
  e.stopPropagation(); // empêche la fermeture immédiate
  loginForm.style.display = loginForm.style.display === 'block' ? 'none' : 'block';
});

document.addEventListener('click', () => {
  loginForm.style.display = 'none';
});

loginForm.addEventListener('click', (e) => {
  e.stopPropagation(); // empêche le clic dans le formulaire de le fermer
});