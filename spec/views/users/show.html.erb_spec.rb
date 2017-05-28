require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(:first_name => "Maxim" , :last_name => "Kiselyow" , :email => "m.kiselyow@gmail.com",:password => "12345678"))
  end

  it "renders attributes in <p>" do
    render

    expect(rendered).to match /Maxim/
  end
end
