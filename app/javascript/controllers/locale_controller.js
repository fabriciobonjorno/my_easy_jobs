import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="locale"
export default class extends Controller {
  connect() {
    console.log("Locale controller connected!");
    this.loadLocaleFromStorage();
  }

  updateLocale(event) {
    const newLocale = event.target.value;
    console.log("New locale selected:", newLocale);
    this.saveLocaleToStorage(newLocale);
    this.updateLocaleOnServer(newLocale);
  }

  loadLocaleFromStorage() {
    const storedLocale = localStorage.getItem("locale");
    if (storedLocale) {
      this.element.value = storedLocale;
    }
  }

  saveLocaleToStorage(locale) {
    localStorage.setItem("locale", locale);
  }

  updateLocaleOnServer(locale) {
    fetch("/update_locale", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({ locale: locale }),
      search() {
        this.element.requestSubmit()
      }
    });
  }
}
