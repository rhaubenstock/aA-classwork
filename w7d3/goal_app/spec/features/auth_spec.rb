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
    User.create(username: 'Brad', password: 'BradIsRad')
    visit new_session_url
    fill_in 'username', with: 'Brad'
    fill_in 'password', with: 'BradIsRad'
    click_on 'Sign In!'
    expect(page).to have_content 'Brad'
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit users_url
    expect(page).to have_content 'Sign In'
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    User.create(username: 'Brad', password: 'BradIsRad')
    visit new_session_url
    fill_in 'username', with: 'Brad'
    fill_in 'password', with: 'BradIsRad'
    click_on 'Sign In!'
    click_on 'Logout'
    expect(page).not_to have_content 'Brad' 
  end

end