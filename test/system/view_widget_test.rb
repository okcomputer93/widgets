require "application_system_test_case"

class ViewWidgetTest < ApplicationSystemTestCase
  # You should not assert every piece of content and markup on the page
  test "we can see a lost of widgets and choose one to view" do
    visit widgets_path

    widget_name = "stembolt"
    widget_name_regexp = /#{widget_name}/i

    assert_selector "ul li", text: /flux capacitor/i
    assert_selector "ul li", text: widget_name_regexp

    find("ul li", text: widget_name_regexp).find("a").click

    # remember, 1234 is formatted as 12.34
    formatted_widget_id_regexp = /12\.34/

    with_clues do
      assert_selector "h1", text: widget_name_regexp
    end
    assert_selector "h2", text: formatted_widget_id_regexp
  end
end