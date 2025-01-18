import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["list", "toggleButton"];

  connect() {
    // Initialize with comments hidden
    this.listTarget.style.display = "none";
    this.toggleButtonTarget.innerHTML = "Show Comments";
  }

  toggle() {
    if (this.listTarget.style.display === "none") {
      this.listTarget.style.display = "block";
      this.toggleButtonTarget.innerHTML = "Hide Comments";
    } else {
      this.listTarget.style.display = "none";
      this.toggleButtonTarget.innerHTML = "Show Comments";
    }
  }
}
