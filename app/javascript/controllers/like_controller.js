import { Controller } from "stimulus"
// import ax from "lib/http/client"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["likeButton"]

  connect() {
    if (this.element.dataset.liked === "true") {
      this.likeButtonTarget.textContent = "★"
    } else {
      this.likeButtonTarget.textContent = "☆"
    }
  }

  like_article() {
    // 用this.element可以找到data controller控制的元素
    const articleID = this.element.dataset.articleId;
  
    // axios 做的 rails也可以直接做到
  Rails.ajax({
      url: `/api/v1/articles/${articleID}/like`,
      type: "post",
      success: ({ state }) => {
        if (state === "liked") {
          this.likeButtonTarget.textContent = "★"
        } else {
          this.likeButtonTarget.textContent = "☆"
        }
      },
      error: (err) => {
        console.log(err)
      },
    })
    // axios 打API -> POST /api/v1/articles/6/like
    // ax.post(`/api/v1/articles/${articleID}/like`).then((resp) => {
    // console.log(resp.data);
    // })
  }
}
