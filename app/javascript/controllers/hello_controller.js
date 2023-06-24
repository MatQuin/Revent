import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('coucoucoucouc')
    this.element.textContent = "Hello World!"
  }
}
