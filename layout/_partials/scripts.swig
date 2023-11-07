<script src="{{ theme.vendors.hancss_script }}"></script>
<script src="{{ theme.vendors.highlightjs }}"></script>
<script src="{{ theme.vendors.medium_zoom }}"></script>
<script src="{{ theme.vendors.vanilla_lazyload }}"></script>
<script>
  hljs.initHighlightingOnLoad();
  Han(document.querySelector('section.content')).setRoutine([
    'initCond', 'renderElem', 'renderJiya', 'correctBasicBD', 'substCombLigaWithPUA'
    // 'renderHanging', 'renderHWS'
  ]).render();
  new LazyLoad({
    elements_selector: '.post-content img',
    callback_loaded: function (el) {
      el.parentNode.nodeName.toLowerCase() === 'a' || mediumZoom(el, { margin: 24 });
    }
  });
</script>

{%- if theme.google_analytics.enable %}
  {%- if theme.google_analytics.api %}
    <script>
      window.ga_tid = '{{ theme.google_analytics.tracking_id }}';
      window.ga_api = '{{ theme.google_analytics.api }}';
    </script>
    <script src="{{ theme.vendors.cfga }}"></script>
  {%- else %}
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', '{{ theme.google_analytics.tracking_id }}', 'auto');
      ga('send', 'pageview');
    </script>
  {%- endif %}
{%- endif %}

{%- if theme.post_views_counter.enable %}
  <script>
    window.post_views_api = '{{ theme.post_views_counter.api }}';
  </script>
  <script src="{{ url_for('js/post-views.js') }}"></script>
{%- endif %}

{%- if theme.umami.enable %}
  <script async src="{{ theme.umami.script_url }}"
    data-website-id="{{ theme.umami.website_id }}">
  </script>
{%- endif %}
