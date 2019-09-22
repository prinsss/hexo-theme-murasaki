{% if theme.disqus %}

{# https://github.com/theme-next/hexo-theme-next/blob/master/layout/_third-party/comments/disqus.swig #}
<div class="comments" id="disqus_thread"></div>

<script>
  // RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
  // LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
  //
  // var disqus_config = function () {
  //   this.page.url = {{ page.permalink | json }};
  //   this.page.identifier = {{ page.path | json }};
  //   this.page.title = '{{ page.title | addslashes }}';
  // };

  function loadComments() {
    var d = document, s = d.createElement('script');
    s.src = 'https://{{ theme.disqus }}.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
  }

  // Lazy laod
  (function() {
    var offsetTop = document.getElementById('disqus_thread').offsetTop - window.innerHeight;
    if (offsetTop <= 0) {
      // load directly when there's no a scrollbar
      window.addEventListener('load', loadComments, false);
    } else {
      var disqus_scroll = () => {
        // offsetTop may changes because of manually resizing browser window or lazy loading images.
        var offsetTop = document.getElementById('disqus_thread').offsetTop - window.innerHeight;
        var scrollTop = window.scrollY;

        // pre-load comments a bit? (margin or anything else)
        if (offsetTop - scrollTop < 60) {
          window.removeEventListener('scroll', disqus_scroll);
          loadComments();
        }
      };
      window.addEventListener('scroll', disqus_scroll);
    }
  })();
</script>

{% endif %}
