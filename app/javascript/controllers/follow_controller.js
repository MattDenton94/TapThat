import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="follow"
export default class extends Controller {
  //  replaces document.querySelector
  static targets = ["button"]
  connect() {
    // connect is to check if controller is well connected
  }
  // write the method for event listener of follow & unfollow
  follow(event){
    // prevents default behaviour to a new page, rather same page
    event.preventDefault()
    const userId = this.element.dataset.userId
    const url = `/users/${userId}/follow`
    this.performRequest(url, "POST")
      .then(() => {
        // Update the button to show "Unfollow"
        this.updateButton("Unfollow", "btn-danger");
      })
      .catch((error) => {
        console.error("Error during Follow:", error);
      });
  }

  unfollow(event){
    event.preventDefault()
    const userId = this.element.dataset.userId
    const url = `/users/${userId}/unfollow`
    this.performRequest(url, "DELETE")
      .then(() => {
        // Update the button to show "Unfollow"
        this.updateButton("Follow", "btn-primary");
      })
      .catch((error) => {
        console.error("Error during Unfollow:", error);
      });
  }

  async performRequest(url, method) {
    const response = await fetch(url, {
      method: method,
      headers: {
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
        "Content-Type": "application/json",
      },
    });

    if (!response.ok) {
      throw new Error("Failed to perform action.");
    }

    return response.json();
  }

  updateButton(text, addClass, removeClass, action) {
    const button = this.buttonTarget; // Target the button
    button.textContent = text;
    button.classList.remove(removeClass);
    button.classList.add(addClass);
    button.dataset.action = `click->follow#${action}`; // Update action dynamically
  }
}
