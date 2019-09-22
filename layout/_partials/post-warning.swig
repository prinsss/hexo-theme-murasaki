<script src="{{ theme.vendors.dayjs }}"></script>
<script>
  var post_updated = dayjs({{ JSON.stringify(page.updated) }});
  var days_diff_now = dayjs().diff(post_updated, 'days');

  if (days_diff_now > 365) {
    document.write(
      '<div class="post-warning">'+
        '本文最后修订于 '+days_diff_now+' 天前（'+post_updated.format('YYYY-MM-DD')+'），'+
        '其中的信息可能已经有所发展或者不再适用于现阶段。'+
      '</div>'
    );
  }
</script>
