import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "posts", "notifications" ]
  show(){
    this.postsTarget.className = "hidden"
    this.notificationsTarget.className = ""
  }
  hide(){
    this.postsTarget.className = ""
    this.notificationsTarget.className = "hidden"
  }
}
