import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "inputField" ]
  focus(){
    this.inputFieldTarget.lastElementChild.lastElementChild.children[1].lastElementChild.scrollIntoView()
    this.inputFieldTarget.lastElementChild.lastElementChild.children[1].lastElementChild.focus()
  }

}
