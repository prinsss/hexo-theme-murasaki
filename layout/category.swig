{% extends '_layout.swig' %}

{% block title %}分类: {{ page.category }} - {{ config.title }}{% endblock %}

{% block content %}
  <article>
    <h1 class="post-title">
      <a href="{{ url_for(page.path) }}">分类: {{ page.category }}</a>
    </h1>
    <div class="post-meta">
      <span class="post-meta-item">此分类下共计 {{ site.categories.findOne({name: page.category}).length }} 篇文章</span>
    </div>
    <div class="post-content">
      {% for post in page.posts %}
        {{ partial('_partials/post-collapse.swig', {'post': post}) }}
      {% endfor %}
    </div>
  </article>

  {% include '_partials/pagination.swig' %}
{% endblock %}
