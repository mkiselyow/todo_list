require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(:first_name => "mMaxim" , :last_name => "mKiselyow" , :email => "mm.kiselyow@gmail.com",:password => "12345678"),
      User.create!(:first_name => "Maxim" , :last_name => "Kiselyow" , :email => "m.kiselyow@gmail.com",:password => "12345678")
    ])
  end

  it "renders a list of users" do
    render

    expect(rendered).to match /mMaxim/
    expect(rendered).to match /Kiselyow/
  end
end
