require_relative 'test_helpers'
require_relative '../lib/page_title'

describe "Page title" do

  before(:all) do
    root = Nanoc::Item.new('', {:title => 'Final Fantasy Finland'}, '/')
    faq = Nanoc::Item.new('', {:title => 'FAQ'}, '/faq/')
    faq.parent = root
    ff1 = Nanoc::Item.new('', {:title => 'Final Fantasy I'}, '/ff1/')
    ff1.parent = root
    ff1_vinkit = Nanoc::Item.new('', {:title => 'Vinkit'}, '/ff1/vinkit/')
    ff1_vinkit.parent = ff1

    items = [root, faq, ff1, ff1_vinkit]
    @items = {}
    items.each { |item| @items[item.identifier] = item }
  end

  it "front page title has only site's name" do
    @item = @items['/']
    page_title.should == 'Final Fantasy Finland'
  end

  it "other top-level page titles have the page title, following by site's name" do
    @item = @items['/faq/']
    page_title.should == 'FAQ - Final Fantasy Finland'
  end

  it "game's index page has game's name, followed by site's name" do
    @item = @items['/ff1/']
    page_title.should == 'Final Fantasy I - Final Fantasy Finland'
  end

  it "game's sub pages have page title, followed by game's name, followed by site's name" do
    @item = @items['/ff1/vinkit/']
    page_title.should == 'Vinkit - Final Fantasy I - Final Fantasy Finland'
  end
end
