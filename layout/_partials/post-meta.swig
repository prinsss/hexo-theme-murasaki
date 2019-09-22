<span class="post-meta-item post-meta-date">
  <time datetime="{{ moment(post.date).format() }}">{{ date(post.date) }}</time>
</span>

<span class="post-meta-item post-meta-categories">
  <span class="post-meta-item-indicator">Category:</span>
  {% if post.categories and post.categories.length %}
    {{ list_categories(post.categories, { show_count: false, separator: ', ', style: '' }) }}
  {% else %}
    未分类
  {% endif %}
</span>

<span class="post-meta-item post-meta-tags">
  {% if post.tags and post.tags.length %}
    {{ list_tags(post.tags, { show_count: false, separator: ' ', style: '' }) }}
  {% else %}
    无标签
  {% endif %}
</span>
