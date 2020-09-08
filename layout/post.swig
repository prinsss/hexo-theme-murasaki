{% extends '_layout.swig' %}

{% block title %}{{ page.title }} - {{ config.title }}{% endblock %}

{% set toc_contents = toc(page.content, { list_number: false }) %}
{% set toc_enabled = theme.toc !== false and page.toc !== false %}

{% block content %}
  <article>
    <h1 class="post-title">
      <a href="{{ url_for(page.path) }}">{{ page.title | default('无标题') }}</a>
    </h1>
    <div class="post-meta">
      {{ partial('_partials/post-meta.swig', {'post': page}) }}
    </div>

    {% if theme.expired_warning %}
      {% include '_partials/post-warning.swig' %}
    {% endif %}

    {% if toc_enabled and toc_contents %}
      <div class="post-toc">{{ toc_contents }}</div>
    {% endif %}

    <div class="post-content">{{ lazyloadImage(page.content) }}</div>
    <div class="post-copyright"><p>除另有声明外，本博客文章均采用 <a href="https://creativecommons.org/licenses/by/4.0/">知识共享(Creative Commons) 署名 4.0 国际许可协议</a> 进行许可。转载请注明原作者与文章出处。</p></div>
  </article>

  {% if (page.prev || page.next) %}
    <nav class="post-nav">
      {% if page.prev %}
      <div class="post-nav-item post-nav-prev">上一篇：
        <a href="{{ url_for(page.prev.path) }}">{{ page.prev.title }}</a>
      </div>
      {% endif %}
      {% if page.next %}
      <div class="post-nav-item post-nav-next">下一篇：
        <a href="{{ url_for(page.next.path) }}">{{ page.next.title }}</a>
      </div>
      {% endif %}
    </nav>
  {% endif %}

  {% if page.comments %}
    {% include '_partials/comments.swig' %}
  {% endif %}
{% endblock %}

{% block widgets %}
  {% if toc_enabled and toc_contents %}
  <section class="widget widget-toc">
    <h3 class="widget-title">文章目录</h3>
    {{ toc_contents }}
  </section>
  {% endif %}
{% endblock %}
