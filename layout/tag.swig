{% extends '_layout.swig' %}

{% block title %}标签: {{ page.tag }} - {{ config.title }}{% endblock %}

{% block content %}
  <article>
    <h1 class="post-title">
      <a href="{{ url_for(page.path) }}">标签: {{ page.tag }}</a>
    </h1>
    <div class="post-meta">
      <span class="post-meta-item">此标签下共计 {{ site.tags.findOne({name: page.tag}).length }} 篇文章</span>
    </div>
    <div class="post-content">
      {% for post in page.posts %}
        {{ partial('_partials/post-collapse.swig', {'post': post}) }}
      {% endfor %}
    </div>
  </article>

  {% include '_partials/pagination.swig' %}
{% endblock %}
