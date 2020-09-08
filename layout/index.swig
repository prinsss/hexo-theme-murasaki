{% extends '_layout.swig' %}

{% block title %}{{ config.title }} - {{ config.subtitle }}{% endblock %}

{% block content %}
  {% for post in page.posts %}
    <article class="post">
      <h2 class="post-title">
        <a href="{{ url_for(post.path) }}">{{ post.title | default('无标题') }}</a>
      </h2>
      <div class="post-meta">
        {{ partial('_partials/post-meta.swig', {'post': post}) }}
      </div>
      <div class="post-content">
        {% if post.excerpt %}
          {{ lazyloadImage(post.excerpt) }}
          <p><a class="more-link" href="{{ url_for(post.path) }}#more">&gt; READ MORE...</a></p>
        {% else %}
          {{ lazyloadImage(post.content) }}
        {% endif %}
      </div>
    </article>
  {% endfor %}

  {% include '_partials/pagination.swig' %}
{% endblock %}
