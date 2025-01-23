import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "submitButton"];

  connect() {
    this.toggleSubmitButton();
  }

  toggleSubmit(event) {
    const input = this.inputTarget.value.trim();
    this.submitButtonTarget.disabled = input.length === 0;
  }
}
