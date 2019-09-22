<article class="post post-collapse">
  <h3 class="post-title">
    <a href="{{ url_for(post.path) }}">{{ post.title | default('无标题') }}</a>
  </h3>
  <div class="post-meta">
    <span class="post-meta-item post-meta-date">
      <time datetime="{{ moment(post.date).format() }}">
        {% if is_archive() %}{{ date(post.date, 'MM-DD') }}{% else %}{{ date(post.date, 'YYYY-MM-DD') }}{% endif %}
      </time>
    </span>
    <span class="post-meta-item post-meta-tags">
      {% if post.tags and post.tags.length %}
        {{ list_tags(post.tags, { show_count: false, separator: ' ', style: '' }) }}
      {% else %}
        无标签
      {% endif %}
    </span>
  </div>
</article>
