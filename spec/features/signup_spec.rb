require 'rails_helper'

describe 'Sign up' do
  let(:user) { build :user }
  subject { page }

  before(:each) { visit new_user_registration_path }

  context 'when the form is filled with invalid data' do
    it 'doesnt allow to sign up' do
      fill_in 'First Name', with: 'invalid_first_name'
      fill_in 'Last Name', with: 'invalid_last_name'
      fill_in 'Cpf', with: 'invalid_cpf'
      fill_in 'Email', with: 'invalid_email'
      fill_in 'Address', with: 'invalid_address'
      fill_in 'Password', with: 'invalid', match: :prefer_exact
      fill_in 'Password confirmation', with: 'unmatched_password'

      click_button 'Sign up'

      expect(subject).to have_content 'Please review the problems below'
    end
  end

  context 'when the form is filled with valid data' do
    it 'allows to sign up' do
      fill_in 'First Name', with: user.first_name
      fill_in 'Last Name', with: user.last_name
      fill_in 'Cpf', with: user.cpf
      fill_in 'Email', with: user.email
      fill_in 'Address', with: user.address
      fill_in 'Password', with: user.password, match: :prefer_exact
      fill_in 'Password confirmation', with: user.password

      click_button 'Sign up'

      expect(subject).to have_content 'Welcome! You have signed up successfully'
    end
  end
end
