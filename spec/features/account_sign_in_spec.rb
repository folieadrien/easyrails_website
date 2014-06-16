require 'spec_helper'

feature 'Account sign in' do
  include Support::Authentication

  let!(:user) { FactoryGirl.create(:user) }

  scenario 'succeed when user exist' do
    sign_in(:user)
    expect(current_path).to eq(root_path)
  end

  scenario "failed when user doesn't exist" do
    sign_in(:user_twitter)
    expect(current_path).to eq(root_path)
  end
end
