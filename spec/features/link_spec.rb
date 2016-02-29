require 'rails_helper'

RSpec.feature 'links index' do

  before :each do
    User.create(email: 'test@example.com', password: 'password')
    visit root_path
    click_link('Login')
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password'
    click_button 'Login'
    visit links_path
    fill_in 'link_title', with: 'Test Link'
    fill_in 'link_url', with: 'http://google.com'
    click_button 'Submit'
  end

  it 'can add new links' do
    expect(page).to have_content('http://google.com')
    expect(page).to_not have_content('Test Link')
    expect(current_path).to eq(links_path)
  end

  it 'can display all links' do
    fill_in 'link_title', with: 'Test Link 2'
    fill_in 'link_url', with: 'http://steampowered.com'
    click_button 'Submit'

    expect(page).to have_content('http://google.com')
    expect(page).to have_content('http://steampowered.com')
  end

  it 'can update links status' do
    within('li') do
      click_link 'Mark as Read'
    end
    expect(page).to have_content 'Mark as Unread'

    within('li') do
      click_link 'Mark as Unread'
    end
    expect(page).to have_content 'Mark as Read'
  end

end
