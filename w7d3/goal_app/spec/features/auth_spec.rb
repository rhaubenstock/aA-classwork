require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content('User Creation Form')
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'Brad'
      fill_in 'password', with: 'BradIsRad'
      click_on 'Create User'
    end
    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'Brad'
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_session_url
    fill_in 'username', with: 'Brad'
    fill_in 'password', with: 'BradIsRad'
    click_on 'Sign In!'
    expect(page).to have_content 'Brad'
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end