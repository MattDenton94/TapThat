import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import { start } from "@rails/ujs"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))

// Start Rails UJS for AJAX functionality
start();
