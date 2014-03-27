require 'spec_helper'

describe Cform do

  let(:valid_form) {{first_name: "Keith", last_name: "Dan", email: ""}}
    it 'has an email section' do
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
end
