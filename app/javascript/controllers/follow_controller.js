// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="follow"
// export default class extends Controller {
//   //  replaces document.querySelector
//   static targets = ["button"]
//   connect() {
//     // connect is to check if controller is well connected
//   }
//   // write the method for event listener of follow & unfollow
//   follow(event){
//     // prevents default behaviour to a new page, rather same page
//     event.preventDefault()
//     const userId = this.element.dataset.userId
//     const url = `/users/${userId}/follow`
//     this.performRequest(url, "POST")
//       .then(() => {
//         // Update the button to show "Unfollow"
//         this.updateButton("Unfollow");
//       })
//       .catch((error) => {
//         console.error("Error during Follow:", error);
//       });
//   }

//   unfollow(event){
//     event.preventDefault()
//     const userId = this.element.dataset.userId
//     const url = `/users/${userId}/unfollow`
//     this.performRequest(url, "DELETE")
//       .then(() => {
//         // Update the button to show "Unfollow"
//         this.updateButton("Follow");
//       })
//       .catch((error) => {
//         console.error("Error during Unfollow:", error);
//       });
//   }

//   async performRequest(url, method) {
//     const response = await fetch(url, {
//       method: method,
//       headers: {
//         "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
//         "Content-Type": "application/json",
//       },
//     });

//     if (!response.ok) {
//       throw new Error("Failed to perform action.");
//     }

//     return response.json();
//   }

//   // updateButton(text, action) {
//   //   const button = this.buttonTarget; // Target the button
//   //   button.textContent = text;
//   //   // button.classList.remove(removeClass);
//   //   // button.classList.add(addClass);
//   //   button.dataset.action = `click->follow#${action}`; // Update action dynamically
//   // }

//   // updateButton(text, action = 'toggle') {
//   //   const button = this.buttonTarget; // Target the button
//   //   button.textContent = text;
//   //   button.dataset.action = `click->follow#${action}`; // Update action dynamically
//   // }
// }



import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]

  connect() {
    // Initial setup can go here if needed
  }

  follow(event) {
    event.preventDefault()
    const userId = this.element.dataset.userId
    const url = `/users/${userId}/follow`

    this.performRequest(url, "POST")
      .then(() => {
        this.updateButtonToUnfollow();
      })
      .catch((error) => {
        console.error("Error during Follow:", error);
      });
  }

  unfollow(event) {
    event.preventDefault()
    const userId = this.element.dataset.userId
    const url = `/users/${userId}/unfollow`

    this.performRequest(url, "DELETE")
      .then(() => {
        this.updateButtonToFollow();
      })
      .catch((error) => {
        console.error("Error during Unfollow:", error);
      });
  }

  updateButtonToFollow() {
    const button = this.buttonTarget;
    button.textContent = "Follow";
    button.dataset.action = "click->follow#follow";
  }

  updateButtonToUnfollow() {
    const button = this.buttonTarget;
    button.textContent = "Unfollow";
    button.dataset.action = "click->follow#unfollow";
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
}
