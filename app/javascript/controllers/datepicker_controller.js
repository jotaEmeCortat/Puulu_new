import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    // First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.
    // const startDateInput = document.getElementById('booking_start_date');
    // const endDateInput = document.getElementById('booking_end_date');

    // const playerDateOfBirth = document.getElementById('player_player_date_of_birth');
    // const playerAvailabiliityPeriod = document.getElementById('player_player_availability_period');

    const gameStartDate = document.getElementById('game_date');

    flatpickr(gameStartDate, {
      altInput:     true,
      minDate:      "today",
      altFormat:    "F j, Y",
      dateFormat:   "Y-m-d",
    });

    // Check that the query selector id matches the one you put around your form.
    // if (startDateInput) {
    // const unavailableDates = JSON.parse(document.querySelector('#player-booking-dates').dataset.unavailable)
    // endDateInput.disabled = true

    // flatpickr(startDateInput, {
    //   minDate: "today",
    //   disable: unavailableDates,
    //   dateFormat: "Y-m-d",
    // });

    console.log('flatpickr dans la place !')

    // startDateInput.addEventListener("change", (e) => {
    //   if (startDateInput != "") {
    //     endDateInput.disabled = false
    //   }
    //   flatpickr(endDateInput, {
    //     minDate: e.target.value,
    //     disable: unavailableDates,
    //     dateFormat: "Y-m-d",
    //     });
    //   });
    // };

    // flatpickr(playerDateOfBirth, {
    //   altInput:        true,
    //   maxDate:         "today",
    //   altFormat:       "F j, Y",
    //   dateFormat:      "Y-m-d",
    // });

    // flatpickr(playerAvailabiliityPeriod, {
    //   altInput:        true,
    //   altFormat:       "F j, Y",
    //   mode:            "range",
    //   minDate:         "today",
    //   dateFormat:      "Y-m-d",
    // });
  }
}
