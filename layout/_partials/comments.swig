{% if theme.disqus.enable %}

<div class="comments" id="disqus_thread"></div>

<link rel="stylesheet" href="{{ theme.vendors.disqusjs_style }}">
<script src="{{ theme.vendors.disqusjs }}"></script>
<script>
  // Load comments with DisqusJS
  function loadComments() {
    window.dsqjs = new DisqusJS({
      shortname: '{{ theme.disqus.shortname }}',
      siteName: '{{ config.title }}',
      identifier: {{ page.path | json }}.replace('index.html', '').replace(/\/$/, ''),
      url: {{ page.permalink | json }}.replace('index.html', ''),
      title: '{{ page.title | addslashes }}',
      api: '{{ theme.disqus.api }}',
      apikey: '{{ theme.disqus.apikey }}',
      admin: '{{ theme.disqus.admin }}',
      adminLabel: '{{ theme.disqus.admin_label }}'
    });
  }

  // Lazy load {# Credit: https://github.com/theme-next/hexo-theme-next/blob/master/layout/_third-party/comments/disqus.swig #}
  (function () {
    var offsetTop = document.getElementById('disqus_thread').offsetTop - window.innerHeight;
    if (offsetTop <= 0) {
      // Load directly when there's no scrollbar
      window.addEventListener('load', loadComments, false);
    } else {
      var disqusScroll = function () {
        // offsetTop may changes because of manually resizing browser window or lazy loading images
        var offsetTop = document.getElementById('disqus_thread').offsetTop - window.innerHeight;
        var scrollTop = window.scrollY;

        // Pre-load comments a bit? (margin or anything else)
        if (offsetTop - scrollTop < 60) {
          window.removeEventListener('scroll', disqusScroll);
          loadComments();
        }
      };
      window.addEventListener('scroll', disqusScroll);
    }
  })();

  // Scroll to comments automatically if #comment-xxx anchor specified
  if (location.hash.indexOf('#comment-') !== -1) {
    document.getElementById('disqus_thread').scrollIntoView();
  }
</script>

{% endif %}
