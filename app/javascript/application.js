
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/active-storage"
import "channels"

import '@popperjs/core'
import 'bootstrap/js/dist/dropdown'

Rails.start()
Turbolinks.start()
ActiveStorage.start()