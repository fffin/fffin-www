include Nanoc::Helpers::HTMLEscape
include Nanoc::Helpers::LinkTo

def page_title
  title_elements = []

  item = @item
  while item != nil
    title_elements << item[:title]
    item = item.parent
  end

  title_elements.join(' - ')
end

def navigation_menu
  root = find_item('/')
  html = '<ul>'
  html << navigation_link(root)
  root.children.each do |item|
    html << navigation_link(item)
  end
  html << '</ul>'
  html
end

def navigation_link(item)
  title = item.attributes[:navigation_title] || item.attributes[:title]
  # TODO: can't use link_to_unless_current without item reps -> better to construct a full Site instance in tests
  #"<ul>#{link_to_unless_current(title, item)}</ul>"
  "<ul>#{h title}</ul>"
end

def find_item(identifier)
  @items.find { |item| item.identifier == identifier } or raise "no item with identifier #{identifier.inspect}"
end
