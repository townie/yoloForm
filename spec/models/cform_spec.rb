require 'spec_helper'

describe Cform do

  let(:valid_form) {{first_name: "Keith", last_name: "Dan", email: "keithdan@dankeith.com", description: "hi", subject: "blah"}}

  context "validations" do

    it 'is valid with valid attributes' do
      expect(Cform.new(valid_form)).to be_valid
      expect(Cform.new(valid_form).errors).to be_blank
    end

    it 'is invalid if there is no first_name' do
      invalid_form = Cform.new(valid_form.merge(first_name: ""))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if there is no last_name' do
      invalid_form = Cform.new(valid_form.merge(last_name: ""))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if there is no email' do
      invalid_form = Cform.new(valid_form.merge(email: ""))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if there is no description' do
      invalid_form = Cform.new(valid_form.merge(description: ""))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if there is no subject' do
      invalid_form = Cform.new(valid_form.merge(subject: ""))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

  end

  context 'boundary condition validations' do

    it 'is invalid if there is email not in correct format' do
      invalid_form = Cform.new(valid_form.merge(email: "blurgger"))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if there is first name is numbers' do
      invalid_form = Cform.new(valid_form.merge(first_name: "123"))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if there is last name is numbers' do
      invalid_form = Cform.new(valid_form.merge(last_name: "123"))
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

    it 'is invalid if email is duplicate' do
      Cform.new(valid_form).save!
      invalid_form = Cform.new(valid_form)
      expect(invalid_form).to_not be_valid
      expect(invalid_form.errors).to_not be_blank
    end

  end

end
