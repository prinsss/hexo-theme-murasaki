'use strict';

const config = hexo.config.theme_config;
const url_for = require('hexo-util').url_for.bind(hexo);

if (!config.lazyload || !config.lazyload.enable) {
  return;
}

hexo.extend.helper.register('lazyloadImage', html => {
  const loading = url_for(config.lazyload.loading_image);

  return html.replace(/(<img[^>]*) src="(.*?)"(.*?>)/gim, (match, p1, p2, p3) => {
    // Do nothing if already processed
    if (match.includes(loading)) {
      return match;
    }

    return `${p1} src="${p2}" srcset="${loading}" data-srcset="${p2}"${p3}`;
  });
});
