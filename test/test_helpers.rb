require 'rubygems'
gem 'rspec', '= 2.10.0'
require 'rspec'
gem 'nokogiri', '= 1.5.2'
require 'nokogiri'
require 'open-uri'
gem 'nanoc', '= 3.3.7'
require 'nanoc'

RSpec::Matchers.define :be_a_file do
  match do |actual|
    File.exist?(actual)
  end
end

RSpec::Matchers.define :be_a_directory do
  match do |actual|
    Dir.exist?(actual)
  end
end

class Nokogiri::XML::NodeSet
  def only
    raise "expected to have only one node, but had #{size}" unless size == 1
    first
  end
end

SITE = File.absolute_path("output")

class Page

  def self.get(path)
    html = File.open(SITE + path, 'r:UTF-8') { |f| f.read }
    doc = Nokogiri::HTML(html)
    Page.new(doc)
  end

  def initialize(doc)
    @doc = doc
  end

  def navigation
    Menu.new(@doc.css("#navigation").only)
  end
end

class Menu

  def initialize(node)
    @doc = node
  end

  def menu_item(title)
    Menu.new(@doc.xpath("//li[. = '#{title}']").only)
  end

  def submenu
    maybe_submenu = @doc.xpath("following-sibling::li").first
    maybe_submenu.xpath("ul").size > 0 ? Menu.new(maybe_submenu) : nil
  end
end

def create_fake_site
  root = Nanoc::Item.new('', {:title => 'Final Fantasy Finland', :navigation_title => 'Uutiset'}, '/')

  faq = Nanoc::Item.new('', {:title => 'FAQ'}, '/faq/')
  faq.parent = root
  root.children << faq

  ff1 = Nanoc::Item.new('', {:title => 'Final Fantasy I'}, '/ff1/')
  ff1.parent = root
  root.children << ff1

  ff1_vinkit = Nanoc::Item.new('', {:title => 'Vinkit'}, '/ff1/vinkit/')
  ff1_vinkit.parent = ff1
  ff1.children << ff1_vinkit

  @items = [root, faq, ff1, ff1_vinkit]
  @items_by_identifier = {}
  @items.each { |item| @items_by_identifier[item.identifier] = item }
end
