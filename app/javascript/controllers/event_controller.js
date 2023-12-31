import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "title", "description", "start", "end", "photo","address"]

  previewTitle(event) {
    this.titleTarget.innerText = event.target.value
  }

  previewDescription(event) {
    console.log("coucou description")
    this.descriptionTarget.innerText = event.target.value
  }

  previewStart(event) {
    this.startTarget.innerText = event.target.value
  }

  previewAddress(event) {
    this.addressTarget.innerText = event.target.value
  }

  previewEnd(event) {
    this.endTarget.innerText = event.target.value
  }

  previewPhoto(event) {
    this.reader = new FileReader();
    var list = new DataTransfer();
    window.lol = event

    // if (event.target.files[0]) {
      //   var file = event.target.items[0].getAsFile()
      // } else {
        // }
        var file = event.target.files[0]
        list.items.add(file)

        // this.inputTarget.files = list.files

    this.reader.onload = (ev) => {
          // const valueString = `url('${ev.currentTarget.result}')`
      console.log('pouet', ev, this.photoTarget)
      console.log('la data url oui', ev.target.result)
      window.lolol = ev
      this.photoTarget.src = ev.target.result
      console.log(this.photoTarget)
    }
    this.reader.readAsDataURL(event.target.files[0])
  }
}
