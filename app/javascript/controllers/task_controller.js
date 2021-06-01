import { Controller } from "stimulus"

export default class extends Controller {
  
  static targets = []

  connect() {
    $(window).on('turbolinks:load', function(){
      $('select').select2({
          tags: true,
          tokenSeparators: [',', ' ']
        }
        );
    })
  }
}