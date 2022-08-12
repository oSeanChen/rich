import { Controller } from "stimulus"

export default class extends Controller {
  
  disconnect() {
    console.log("disconnected!!");
  }
  
  //  設定幾秒後執行特定
  // connect() {
  //   setTimeout(() => {
  //     this.element.remove()
  //   },2000)
  // }
  close() {
    this.element.remove()
  }
}
