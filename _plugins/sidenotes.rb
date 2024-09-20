# A rather crude search-and-replace plugin that converts <span sidenote> tags on
# Markdown/HTML documents into the proper markup for sidenotes.
Jekyll::Hooks.register :documents, :post_render do |doc|
  doc.output.gsub!(
    /<span sidenote[^>]*>/,
    '<label class=sidenote-number><input type=checkbox></label><span class=sidenote>'
  )
  # TODO: add mobile toggles for margin notes.
  doc.output.gsub!(
    /<span marginnote[^>]*>/,
    '<span class=sidenote>'
  )
end
