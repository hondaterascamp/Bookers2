// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

document.addEventListener("turbo:load", () => {
  document.querySelectorAll('.navbar-toggler').forEach((btn) => {
    const targetSelector = btn.getAttribute('data-bs-target')
    const targetEl = document.querySelector(targetSelector)
    if (targetEl) {
      bootstrap.Collapse.getOrCreateInstance(targetEl, { toggle: false })
    }
  })
})

document.addEventListener("turbo:before-cache", () => {
  document.querySelectorAll('.navbar-collapse.show').forEach((el) => {
    el.classList.remove('show')
  })
})