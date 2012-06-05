SITE_TITLE = 'Final Fantasy Finland'

def format_title(page_title)
  if page_title
    "#{page_title} - #{SITE_TITLE}"
  else
    SITE_TITLE
  end
end
