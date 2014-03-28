# As a site visitor
# I want to contact the site's staff
# So that I can tell them how awesome they are
require 'spec_helper'

describe 'site visitor' do

  before(:each) do
      visit('/')
      click_on "Sign up"
      user = ('a'..'z').to_a.shuffle.pop(20).join
      fill_in "Email", with: "#{user}@shlomo.com"
      fill_in "Password", with: "adminqwerty"
      fill_in "Password confirmation", with: "adminqwerty"
      click_on "Sign up"
  end

  context 'forms are correct' do

    it 'has an email section' do
      save_and_open_page
      expect(page).to have_css('input#cform_email')
    end

    it 'has an subject section' do
      expect(page).to have_css('input#cform_subject')
    end

    it 'has an description section' do
      expect(page).to have_css('textarea#cform_description')
    end

    it 'has an first name section' do
      expect(page).to have_css('input#cform_first_name')
    end

    it 'has an last name section' do
      expect(page).to have_css('input#cform_last_name')
    end
  end

  context 'site visitor actions' do
    # before(:each) do
    #   visit('/cforms/new')
    # end

    it 'requires a user to have a first name' do
      fill_in "Email", with: "mofo@gmail.com"
      fill_in "Subject", with: "gmail.com"
      fill_in "Description", with: "mofo stuff"
      fill_in "First name", with: ''
      fill_in "Last name", with: "fo"

      click_on "Create Form"

      expect(page).to have_content("can't be blank")
    end

    it 'user submits a completed form and is redirected to index' do

    end

    it 'upon valid sumbisson the information is posted on index page  ' do
    end


  end
end
