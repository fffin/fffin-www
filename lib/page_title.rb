def page_title
  title_elements = []

  item = @item
  while item != nil
    title_elements << item[:title]
    item = item.parent
  end

  title_elements.join(' - ')
end
