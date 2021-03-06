require 'rails_helper'

RSpec.describe "tweets/show", type: :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
      user: nil,
      declaration: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
