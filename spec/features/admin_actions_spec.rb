require 'spec_helper'

describe 'an admin can rewiew inquery' do

  before(:each) do
    User.create!(email: 'k@gmail.com', password: "admin12345", role: 'admin')
    visit ('/')
    fill_in "Email", with: "k@gmail.com"
    fill_in "Password", with: "admin12345"
    click_on "Sign in"
  end

  it 'can see all the posts' do
    visit ('/cforms/new')
     fill_in "Email", with: "mofo@gmail.com"
      fill_in "Subject", with: "gmail.com"
      fill_in "Description", with: "mofo stuff"
      fill_in "First name", with: 'mo'
      fill_in "Last name", with: "fo"

      click_on "Create Form"

    visit '/'

    expect(page).to have_content("mofo@gmail.com")
  end


  it 'can delete any post' do
    visit '/cforms/new'
     fill_in "Email", with: "mofo@gmail.com"
      fill_in "Subject", with: "gmail.com"
      fill_in "Description", with: "mofo stuff"
      fill_in "First name", with: 'mo'
      fill_in "Last name", with: "fo"

      click_on "Create Form"

    visit '/'

    click_on "Destroy"
    expect(page).to_not have_content("mofo@gmail.com")
  end



end
