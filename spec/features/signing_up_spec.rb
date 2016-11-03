require 'spec_helper'

feature 'sign up as a host' do
	scenario 'let user sign up as a host' do
		visit '/'
	  fill_in 'first_name', with: 'Brian'
	  fill_in 'last_name', with: 'Chesky'
    fill_in 'email',     with: 'brianchesky@airbnb.com'
    fill_in 'password', with: "foobar"
    # fill_in 'password_confirmation', with: "foobar"
    expect{click_button 'Sign Up'}.to change{Host.count}.by(1)
    expect(page).to have_content("Successfully signed up!")
  end
end