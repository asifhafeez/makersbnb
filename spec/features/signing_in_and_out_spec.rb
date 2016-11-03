require 'spec_helper'

feature 'log in as a host' do
	scenario 'let signed up host log in as a host with correct details' do
		sign_up_host
		click_button 'Log Out'
		fill_in 'Email', with: 'brianchesky@airbnb.com'
		fill_in 'Password', with: "foobar"
		click_button "Log In"
		expect(page).to have_button("Log Out")
  end
end

feature 'log out as a host' do
	scenario 'let signed up host log out as a host' do
		sign_up_host
		click_button 'Log Out'
		expect(page).to have_button("Log In")
  end
end