<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="HandheldFriendly" content="True" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Cache-Control" content="no-transform">
<meta http-equiv="Cache-Control" content="no-siteapp">
<meta name="generator" content="Hexo" />
<link rel="icon" href="{{ url_for(theme.favicon) }}" />

{%- if theme.canonical %}
  <link rel="canonical" href="{{ config.url }}/{{ page.canonical_path.replace('index.html', '') }}"/>
{%- endif %}

{%- if config.feed and config.feed.path %}
  <link rel="alternate" type="application/atom+xml" href="{{ url_for(config.feed.path) }}" title="{{ config.title }}">
{%- endif %}

{%- if page.keywords %}
  <meta name="keywords" content="{{ page.keywords }}" />
{%- elif page.tags and page.tags.length %}
  <meta name="keywords" content="{% for tag in page.tags %}{{ tag.name }},{% endfor %}" />
{%- elif theme.keywords %}
  <meta name="keywords" content="{{ theme.keywords }}" />
{%- endif %}

{{ open_graph(theme.open_graph) }}

{%- if theme.google_site_verification %}
  <meta name="google-site-verification" content="{{ theme.google_site_verification}}" />
{%- endif %}

<link rel="stylesheet" href="{{ theme.vendors.hancss }}">
<link rel="stylesheet" href="{{ theme.google_font }}/css?family=Fira+Mono|PT+Serif|Roboto+Slab:600|Noto+Serif+SC:600&display=swap">
<link rel="stylesheet" href="{{ theme.vendors.highlightjs_style }}">
<link rel="stylesheet" href="{{ url_for('css/main.css') }}">
