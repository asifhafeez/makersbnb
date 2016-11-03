def add_space_form
  fill_in 'name',        with: 'Watermarque'
  fill_in 'price',        with: '10'
  fill_in 'description', with: 'Twin rooms'
  fill_in 'from', with: Date.today
  fill_in 'to', with: Date.today
end

def sign_up_host
	visit '/'
	fill_in 'first_name', with: 'Brian'
	fill_in 'last_name', with: 'Chesky'
  fill_in 'email',     with: 'brianchesky@airbnb.com'
  fill_in 'password', with: "foobar"
  fill_in 'password_confirmation', with: "foobar"
  click_button 'Sign Up'
end

