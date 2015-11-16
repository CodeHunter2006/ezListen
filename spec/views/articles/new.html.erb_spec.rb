require 'spec_helper'

describe "articles/new" do
  before(:each) do
    assign(:article, stub_model(Article,
      :source_url => "MyText",
      :title => "MyText",
      :text_content => "MyText",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", articles_path, "post" do
      assert_select "textarea#article_source_url[name=?]", "article[source_url]"
      assert_select "textarea#article_title[name=?]", "article[title]"
      assert_select "textarea#article_text_content[name=?]", "article[text_content]"
      assert_select "input#article_status[name=?]", "article[status]"
    end
  end
end
