require 'rails_helper'

RSpec.feature 'user signs up' do

  context 'with correct credentials' do
    it 'redirect to links path' do
      visit root_path
      click_link('Sign Up')

      fill_in 'user_email', with: 'test@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Submit'

      expect(current_path).to eq(links_path)
      expect(page).to have_content('Signed Up')
    end
  end
end