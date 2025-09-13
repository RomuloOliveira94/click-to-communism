import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="click-sound-effect"
export default class extends Controller {
  connect() {
    this.audio = new Audio(RAILS_ASSET_URL("/click.ogg"));
  }

  playSound() {
    if (this.audio.currentTime > 0) {
      this.audio.currentTime = 0;
    }
    this.audio.volume = 0.2;
    this.audio.play();
  }
}
