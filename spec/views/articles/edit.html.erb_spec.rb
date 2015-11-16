require 'spec_helper'

describe "articles/edit" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :source_url => "MyText",
      :title => "MyText",
      :text_content => "MyText",
      :status => "MyString"
    ))
  end

  it "renders the edit article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", article_path(@article), "post" do
      assert_select "textarea#article_source_url[name=?]", "article[source_url]"
      assert_select "textarea#article_title[name=?]", "article[title]"
      assert_select "textarea#article_text_content[name=?]", "article[text_content]"
      assert_select "input#article_status[name=?]", "article[status]"
    end
  end
end
