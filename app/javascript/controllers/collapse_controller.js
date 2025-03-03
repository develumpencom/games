import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="collapse"
export default class extends Controller {
  static targets = [ "element", "more", "less" ]

  connect() {
    if (this.elementTargets.length > 3) {
      this.showLess()
    } else {
      this.moreTarget.classList.add("hidden")
    }
  }

  showAll() {
    this.elementTargets.forEach(element => {
      element.classList.remove("hidden")
    })
    this.moreTarget.classList.add("hidden")
    this.lessTarget.classList.remove("hidden")
  }

  showLess() {
    for (let i = 3; i < this.elementTargets.length; i++) {
      this.elementTargets[i].classList.add("hidden")
    }
    this.moreTarget.classList.remove("hidden")
    this.lessTarget.classList.add("hidden")
  }
}
