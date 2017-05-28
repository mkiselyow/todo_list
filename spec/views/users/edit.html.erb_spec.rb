require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(:first_name => "Maxim" , :last_name => "Kiselyow" , :email => "m.kiselyow@gmail.com",:password => "12345678"))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do
    end
  end
end
