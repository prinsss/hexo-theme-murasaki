{% extends '_layout.swig' %}

{% block title %}{{ page.title }} - {{ config.title }}{% endblock %}

{% block content %}
  <article>
    <h1 class="post-title">
      <a href="{{ url_for(page.path) }}">{{ page.title | default('无标题') }}</a>
    </h1>
    <div class="post-meta">
      <span class="post-meta-item post-meta-date">
        <time datetime="{{ moment(page.date).format() }}">{{ date(page.date) }}</time>
      </span>
    </div>

    <div class="post-content">{{ page.content }}</div>
  </article>
  {% if page.comments %}
    {% include '_partials/comments.swig' %}
  {% endif %}
{% endblock %}
