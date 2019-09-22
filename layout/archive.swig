{% extends '_layout.swig' %}

{% block title %}归档 - {{ config.title }}{% endblock %}

{% block content %}
  <article>
    <h1 class="post-title">
      <a href="{{ url_for(page.path) }}">归档</a>
    </h1>
    <div class="post-meta">
      <span class="post-meta-item">目前共计 {{ site.posts.length }} 篇文章</span>
    </div>
    <div class="post-content">
      {% for post in page.posts %}

        {% set year %}
        {% set post.year = date(post.date, 'YYYY') %}

        {% if post.year !== year %}
          {% set year = post.year %}
          <h2 class="archive-year-collection" id="archive-year-{{ year}}">{{ year }}</h2>
        {% endif %}

        {{ partial('_partials/post-collapse.swig', {'post': post}) }}

      {% endfor %}
    </div>
  </article>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block widgets %}
  {% set list = list_archives({ show_count: false }) %}
  <section class="widget">
    <h3 class="widget-title">归档</h3>
    {% if list %}
      {% autoescape false %}{{ list }}{% endautoescape %}
    {% else %}
      <p>None.</p>
    {% endif %}
  </section>
{% endblock %}
