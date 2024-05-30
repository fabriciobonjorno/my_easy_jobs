// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "flowbite/dist/flowbite.turbo.js"
import Datepicker from 'flowbite-datepicker/Datepicker'
import 'flowbite-datepicker'
import 'flowbite/dist/datepicker.turbo.js'


document.addEventListener('turbo:load', () => {
  const datepickerEl = document.getElementById('datepicker');
  if (datepickerEl) {
    new Datepicker(datepickerEl, {
      autohide: true,
    });
  }
});
