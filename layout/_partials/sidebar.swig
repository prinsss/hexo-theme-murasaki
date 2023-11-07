{% if theme.sidebar.recent_posts and is_home() %}
<section class="widget" id="widget-recent-posts">
  <h3 class="widget-title">最新文章</h3>
  <ul class="menu">
    {# Swig template does not support method chaining #}
    {% set recent_posts = site.posts.sort('-date') %}
    {% set recent_posts = recent_posts.limit(5) %}
    {% for post in recent_posts %}
      <li class="menu-item">
        <a href="{{ url_for(post.path) }}">{{ post.title }}</a>
      </li>
    {% endfor %}
  </ul>
</section>
{% endif %}

{% if theme.sidebar.categories %}
<section class="widget" id="widget-categories">
  <h3 class="widget-title">分类</h3>
  {% set categories = list_categories({ show_count: false }) %}
  {% if categories %}
    {{ categories }}
  {% else %}
    <p>无分类</p>
  {% endif %}
</section>
{% endif %}

{% if theme.sidebar.pages %}
<section class="widget" id="widget-pages">
  <h3 class="widget-title">页面</h3>
  <ul class="menu">
    {% for name, item in theme.menu_pages %}
      {% set itemName = name.toLowerCase() %}
      <li class="menu-item menu-item-{{ itemName }}">
        <a href="{{ url_for(item.path) }}" title="{{ item.title }}">{{ item.name }}</a>
      </li>
    {% endfor %}
  </ul>
</section>
{% endif %}

{% if theme.sidebar.links %}
<section class="widget" id="widget-links">
  <h3 class="widget-title">链接</h3>
  <ul class="menu">
    {% for name, item in theme.menu_links %}
      {% set itemName = name.toLowerCase() %}
      <li class="menu-item menu-item-{{ itemName }}">
        <a href="{{ url_for(item.path) }}" title="{{ item.title }}" target="_blank">{{ item.name }}</a>
      </li>
    {% endfor %}
  </ul>
</section>
{% endif %}

{% if theme.sidebar.tagcloud and is_home() %}
<section class="widget" id="widget-tagcloud">
  <h3 class="widget-title">标签云</h3>
  {{ tagcloud() }}
</section>
{% endif %}
