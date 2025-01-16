// src/controllers/clipboard_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "source" ]
  static values = { url:String }
  copy() {
    navigator.clipboard.writeText(this.urlValue)
  }
}
