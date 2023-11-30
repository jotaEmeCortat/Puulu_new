import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game"
export default class extends Controller {
  static targets = ['player', 'opponent', 'kind', 'kindExtra', 'position', 'result']

  currentPlayer = null;
  currentOpponent = null;
  currentKind = null;
  currentKindExtra = null;

  toggleKind(evt) {
    // console.log(evt.target.dataset.gameTarget)

    if (evt.target.dataset.gameTarget === "kind") {
      this.currentKind = evt.target.value;
      this.kindExtraTargets.forEach(element => {
        element.disabled = true;
      });
    }else {
      this.currentKindExtra = evt.target.value;
      this.kindTargets.forEach(element => {
        element.disabled = true;
      });
    }
  }

  togglePlayer(evt) {
    // console.log(evt.target.dataset.gameTarget)

    if (evt.target.dataset.gameTarget === "player") {
      this.currentPlayer = evt.target.value;
      this.opponentTargets.forEach(element => {
        element.disabled = true;
      });
    }else {
      this.currentOpponent = evt.target.value;
      this.playerTargets.forEach(element => {
        element.disabled = true;
      });
    }
  }

  toggleResult(evt) {
    // console.log(evt.target.value)
    // console.log("Current Player:", this.currentPlayer);
    // console.log("Current Opponent:", this.currentOpponent);
    // console.log("Current Kind:", this.currentKind);
    // console.log("Current KindExtra:", this.currentKindExtra);
    // if (this.shotResult())

    if (evt.target.dataset.gameTarget === "position" &&
        ((this.currentPlayer || this.currentOpponent) &&
        ((this.currentKind === 'SHOT' || this.currentKind === 'COUNTER ATTACK') ||
        (this.currentKind === 'DIRECT FREE THROW' || this.currentKind === 'EXTRA PLAYER SHOT')))) {
      this.resultTargets.forEach(element => {
        element.disabled = false;
      });
    }
  }


}
