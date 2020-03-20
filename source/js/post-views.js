// No transpiler, so for modern browsers only ;)
(async () => {
  const pvCounterElements = {}

  document.querySelectorAll('article:not(.post-collapse) > .post-title a').forEach(e => {
    const slug = /^http.*\/([^\/]+)\//.exec(e.href)[1]
    pvCounterElements[slug] = {
      ele: e.parentElement.parentElement.querySelector('.post-meta .pv-counter')
    }
  })

  const query = Object.keys(pvCounterElements).join(',')
  const json = await fetch(`${window.post_views_api}?pages=${query}`).then(res => res.json())

  for (const slug in json.data) {
    const ele = pvCounterElements[slug] && pvCounterElements[slug].ele

    if (ele !== undefined && ele !== null) {
      ele.innerHTML = json.data[slug]
      ele.parentElement.style.visibility = 'visible'
      ele.parentElement.style.opacity = 1
    }
  }
})()
