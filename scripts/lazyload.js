'use strict';

const config = hexo.config.theme_config;
const url_for = require('hexo-util').url_for.bind(hexo);

if (!config.lazyload || !config.lazyload.enable) {
  return;
}

hexo.extend.filter.register('after_render:html', html => {
  const loading = url_for(config.lazyload.loading_image);

  return html.replace(
    /(<img[^>]*) src="(.*?)"/gim,
    `$1 src="$2" srcset="${loading}" data-srcset="$2"`
  );
});
