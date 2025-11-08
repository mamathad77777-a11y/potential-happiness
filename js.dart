/* Simple UI interactions and scroll reveal */

// Toggle mobile nav
const navToggle = document.getElementById('navToggle');
const nav = document.querySelector('.nav');
navToggle && navToggle.addEventListener('click', () => {
  if (!nav) return;
  nav.style.display = nav.style.display === 'flex' ? 'none' : 'flex';
  nav.style.flexDirection = 'column';
  nav.style.position = 'absolute';
  nav.style.right = '28px';
  nav.style.top = '64px';
  nav.style.background = 'rgba(3,6,12,0.9)';
  nav.style.padding = '12px';
  nav.style.borderRadius = '10px';
});

// Scroll reveal
const revealEls = document.querySelectorAll('.reveal-up, .reveal-fade');
const io = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
}, { threshold: 0.12 });

revealEls.forEach(el => io.observe(el));

// Simple contact form handler (no backend). Replace with EmailJS / Formspree if needed.
function handleForm(e) {
  e.preventDefault();
  const form = document.getElementById('contactForm');
  const status = document.getElementById('formStatus');
  // simulate send
  status.textContent = 'Sending…';
  setTimeout(() => {
    status.textContent = 'Thanks — message simulated (no backend). Email directly or connect on LinkedIn.';
    form.reset();
  }, 900);
  return false;
}
