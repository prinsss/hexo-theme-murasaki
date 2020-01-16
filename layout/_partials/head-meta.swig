<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="HandheldFriendly" content="True" />

{# SEO #}
<meta name="description" content="{{ config.description }}" />
{% if page.keywords %}
  <meta name="keywords" content="{{ page.keywords }}" />
{% elif page.tags and page.tags.length %}
  <meta name="keywords" content="{% for tag in page.tags %}{{ tag.name }},{% endfor %}" />
{% elif theme.keywords %}
  <meta name="keywords" content="{{ theme.keywords }}" />
{% endif %}

{% if theme.canonical %}
  <link rel="canonical" href="{{ config.url }}/{{ page.canonical_path.replace('index.html', '') }}"/>
{% endif %}

{%- if theme.rss === '' and config.feed.path %}
  {%- set theme.rss = config.feed.path %}
{%- endif %}
{%- if theme.rss %}
  <link rel="alternate" href="{{ url_for(theme.rss) }}" title="{{ config.title }}" type="application/atom+xml">
{%- endif %}

{# Google Site Verification #}
{% if theme.google_site_verification %}
<meta name="google-site-verification" content="{{ theme.google_site_verification}}" />
{% endif %}

{# Browser compatibility #}
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Cache-Control" content="no-transform">
<meta http-equiv="Cache-Control" content="no-siteapp">

{# Powered by Hexo #}
<meta name="generator" content="Hexo" />

{# Open Graph Resources #}
{{ open_graph(theme.open_graph) }}

{# RSS Feed #}
{% if theme.rss === '' and config.feed and config.feed.path %}
  {% set theme.rss = config.feed.path %}
{% endif %}

{% if theme.rss %}
  {{ feed_tag(url_for(theme.rss), {'type': 'application/atom+xml'}) }}
{% endif %}

{# Favicon, etc. #}
<link rel="icon" href="{{ url_for(theme.favicon) }}" />

{# Styles #}
<link rel="stylesheet" href="{{ theme.vendors.hancss }}">
<link rel="stylesheet" href="{{ theme.google_font }}/css?family=Fira+Mono|PT+Serif|Roboto+Slab|Noto+Serif+SC&display=swap">
<link rel="stylesheet" href="{{ theme.vendors.highlightjs_style }}">
<link rel="stylesheet" href="{{ url_for('css/main.css') }}">
