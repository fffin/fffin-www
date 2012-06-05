require_relative 'test_helpers'

describe "Navigation menu" do

  it "when not on game's pages, game submenu is hidden" do
    unrelated_page = Page.get "/index.html"

    game_menu = unrelated_page.navigation.menu_item("Final Fantasy I")

    game_menu.submenu.should == nil
  end

  it "when on game's pages, game submenu is visible" do
    game_page = Page.get "/final-fantasy-i/index.html"

    game_menu = game_page.navigation.menu_item("Final Fantasy I")

    game_menu.submenu.should_not == nil
  end

  # TODO: highlighting the current page
  # TODO: highlighting the current section
  # TODO: page title (new fixture); index "FFfin", game index "Game - FFfin", game other "Page - Game - FFfin"
  # TODO: uutiset: linkki päävalikkoon mutta ei otsikkoon
end
