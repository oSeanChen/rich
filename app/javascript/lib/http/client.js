import ax from "axios";

const metaToken = document.querySelector("meta[name=csrf-token]")
 
if (metaToken) {
  const token = metaToken.content
  ax.defaults.headers.common["X-CSRF-Token"] = token

}

export default ax 