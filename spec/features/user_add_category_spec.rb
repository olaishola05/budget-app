require 'rails_helper'

RSpec.describe 'Feature User login', type: :feature do
  before(:each) do
    visit new_user_session_path
  end


  context 'Test Login page content' do
    it 'should have a email input field' do
      expect(page).to have_field('Email')
    end

    it 'should have a password input field' do
      expect(page).to have_field('Password')
    end

    it 'should have a login button' do
      expect(page).to have_button('Log in')
    end
  end

  it 'Add category' do
    user = User.create!(name: 'Jonyole', email: 'eii@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add new category'

    expect(page).to have_current_path("/categories/new")
  end

  it 'Presence of Add category select field' do
    user = User.create!(name: 'Jonyole', email: 'eiiy@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add new category'

    expect(page).to have_content('category')
  end

  it 'Presence of Add category name field' do
    user = User.create!(name: 'Jonyole', email: 'eiio@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add new category'

    expect(page).to have_content('Add category')
  end

  it 'Presence of Add category button submit field' do
    user = User.create!(name: 'Jonyole', email: 'eiio@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add new category'

    expect(page).to have_button('Save')
  end

  it 'Add a category to the list' do
    user = User.create!(name: 'Jonyole', email: 'eiio@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add new category'

    fill_in 'Name', with: 'Groceries'
    fill_in 'icon', with: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZGozwkP2GL9sVVqYP4maINc7y0WbhOuQx4lu68fHIf5Xv_vM&s'

    click_button 'Save'

    expect(page).to have_content('Successfully created category')
    expect(page).to have_content('Groceries')
  end
end