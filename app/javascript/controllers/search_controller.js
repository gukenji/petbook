import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "allProfiles", "searchProfiles" ]
  showAll(){
    this.allProfilesTarget.className = ""
    this.searchProfilesTarget.className = "hidden"
  }
  hideAll(){
    this.allProfilesTarget.className = "hidden"
  }

}
