import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="visibility"
export default class extends Controller {
  static targets = [ "hideable", "nameInput", "name" ]

  showTargets() {
    this.hideableTargets.forEach(el => {
      el.hidden = false
    });
  }

  hideTargets() {
    this.hideableTargets.forEach(el => {
      el.hidden = true
    });
  }

  toggleTargets(evt) {
    evt.preventDefault()
    this.nameTarget.innerHTML = this.nameInputTarget.value

    this.hideableTargets.forEach((el) => {
      el.hidden = !el.hidden
    });
  }
}
