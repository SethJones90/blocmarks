require 'rails_helper'

feature 'User signs up for blocmarks' do
  scenario 'Password field is left blank' do
    visit new_user_registration_path
    fill_in 'Email', with: 'iamatestuser@email.com'
    fill_in 'Password', with: ''
    fill_in 'Password Confirmation', with: ''
    click_button 'Sign up'
      expect( page ).to have_content("Password can't be blank")
  end
end