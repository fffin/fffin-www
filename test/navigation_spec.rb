require_relative 'test_helpers'
require_relative '../lib/layout'

describe "Navigation menu" do

  before(:all) do
    create_fake_site
  end

  it "always shows the top-level pages" do
    @item = @items_by_identifier['/']
    navigation_menu.should include "FAQ"
    navigation_menu.should include "Final Fantasy I"
  end

  it "the root page uses an alternative title for the navigation" do
    @item = @items_by_identifier['/']
    navigation_menu.should include "Uutiset"
    navigation_menu.should_not include "Final Fantasy Finland"
  end

  it "when not on game's pages, game submenu is hidden" do
    pending # TODO
    unrelated_page = Page.get "/index.html"

    game_menu = unrelated_page.navigation.menu_item("Final Fantasy I")

    game_menu.submenu.should == nil
  end

  it "when on game's pages, game submenu is visible" do
    pending # TODO
    game_page = Page.get "/final-fantasy-i/index.html"

    game_menu = game_page.navigation.menu_item("Final Fantasy I")

    game_menu.submenu.should_not == nil
  end

  # TODO: highlighting the current page
  # TODO: highlighting the current section
  # TODO: page title (new fixture); index "FFfin", game index "Game - FFfin", game other "Page - Game - FFfin"
  # TODO: uutiset: linkki päävalikkoon mutta ei otsikkoon
end
