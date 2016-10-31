def add_space_form
  fill_in 'user_name',         with: 'Brian Chesky'
  fill_in 'user_email',        with: 'brianchesky@airbnb.com'
  fill_in 'space_name',        with: 'Watermarque'
  fill_in 'price',             with: '3300000000'
  fill_in 'space_description', with: 'Twin rooms'
  fill_in 'available_from',    with: 'Monday'
  fill_in 'available_to',      with: 'Tuesday'
  click_button 'Add Space'
end
