<!DOCTYPE html>
<html lang="{{ config.language }}">
<head>
  <title>{% block title %}{% endblock %}</title>
  {% include '_partials/head-meta.swig' %}
</head>
<body>

<header>
  <div class="container">
    <div class="site-name">
      <a class="logo" href="{{ config.url }}">{{ config.title }}</a>
      <span class="description">{{ config.subtitle }}</span>
    </div>
  </div>
</header>

<main>
  <div class="container">
    <div class="row">
      <section class="content col-md-8 col-12 han-init-context">
        {% block content %}{% endblock %}
      </section>
      <aside class="sidebar col-md-3 offset-md-1 col-12">
        {% block widgets %}{% endblock %}
        {% include '_partials/sidebar.swig' %}
      </aside>
    </div>
  </div>
</main>

<footer>
  {% set year = date(Date.now(), "YYYY") %}
  <div class="container">
    <p>
      &copy; {{ year }} <a href="{{ config.url }}">{{ config.title }}</a>. Proudly published with <a href="https://hexo.io/" target="_blank">Hexo</a>.
      Theme <a href="https://github.com/printempw/hexo-theme-murasaki/" target="_blank">Murasaki</a> by printempw.
    </p>
  </div>
</footer>

{% include '_partials/scripts.swig' %}
</body>
</html>