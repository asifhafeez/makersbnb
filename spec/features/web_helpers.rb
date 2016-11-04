def add_space_form
  click_link 'Add Space'
  fill_in 'name',         with: 'Watermarque'
  fill_in 'price',        with: '10'
  fill_in 'description',  with: 'Twin rooms'
  fill_in 'from',         with: Date.today
  fill_in 'to',           with: Date.today
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

def create_host
    let(:host) do
        Host.create(first_name: "Foo", last_name: "Foo",
                    email: "foobar@example.com", password: "foobar",
                    password_confirmation: "foobar")
    end
end

def create_space
    let(:space) do
        Space.create(name: "Foo", price: 10,
                    description: "foobar@example.com", from: Date.today,
                    to: Date.today, host_id: host.id)
    end
end

def sign_in
 visit '/'
    fill_in :Email, with: host.email
    fill_in :Password, with: host.password
    click_button "Log In"
end
