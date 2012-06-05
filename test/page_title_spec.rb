require_relative 'test_helpers'
require_relative '../lib/layout'

describe "Page title" do

  before(:all) do
    create_fake_site
  end

  it "front page title has only site's name" do
    @item = @items_by_identifier['/']
    page_title.should == 'Final Fantasy Finland'
  end

  it "other top-level page titles have the page title, following by site's name" do
    @item = @items_by_identifier['/faq/']
    page_title.should == 'FAQ - Final Fantasy Finland'
  end

  it "game's index page has game's name, followed by site's name" do
    @item = @items_by_identifier['/ff1/']
    page_title.should == 'Final Fantasy I - Final Fantasy Finland'
  end

  it "game's sub pages have page title, followed by game's name, followed by site's name" do
    @item = @items_by_identifier['/ff1/vinkit/']
    page_title.should == 'Vinkit - Final Fantasy I - Final Fantasy Finland'
  end
end
