require 'rails_helper'

RSpec.feature 'links index' do

  before :each do
    User.create(email: 'test@example.com', password: 'password')
    visit root_path
    click_link('Login')
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
  end

  it 'can add new links' do
    visit links_path
    fill_in 'link_title', with: 'Test Link'
    fill_in 'link_url', with: 'http://google.com'
    click_button 'Submit'

    expect(page).to have_content('http://google.com')
    expect(page).to_not have_content('Test Link')
    expect(current_path).to eq(links_path)
  end

  it 'can display all links' do
    visit links_path
    fill_in 'link_title', with: 'Test Link 1'
    fill_in 'link_url', with: 'http://google.com'
    click_button 'Submit'
    fill_in 'link_title', with: 'Test Link 2'
    fill_in 'link_url', with: 'http://steampowered.com'
    click_button 'Submit'

    expect(page).to have_content('http://google.com')
    expect(page).to have_content('http://steampowered.com')
  end
end
