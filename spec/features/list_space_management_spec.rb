 require 'spec_helper'

 # Host.get(session[:host_id])


  feature 'Listing a space' do
    create_host
    scenario 'let a user add a space for rent from MakersBnB', focus: :true do
      sign_in
      add_space_form
      expect{click_button 'Add Space'}.to change{host.spaces.count}.by(1)
    end

    scenario 'shows the space added by the user' do
      sign_in
      add_space_form
      click_button 'Add Space'
      expect(page).to have_content('Watermarque')
    end

    scenario 'cannot create a space without a space name' do
      sign_in
      click_link 'Add Space'
      fill_in 'name',         with: ''
      fill_in 'price',        with: 10
      fill_in 'description',  with: 'Twin rooms'
      fill_in 'from', with: Date.today
      fill_in 'to', with: Date.today
      expect{click_button 'Add Space'}.to_not change{host.spaces.count}
      expect(page).to have_content("Name must not be blank")
    end

    scenario 'cannot create a space without a space price' do
      sign_in
      click_link 'Add Space'
      fill_in 'name',         with: 'Watermarque'
      fill_in 'price',        with: ''
      fill_in 'description',  with: 'Twin rooms'
      fill_in 'from', with: Date.today
      fill_in 'to', with: Date.today
      expect{click_button 'Add Space'}.to_not change{host.spaces.count}
      expect(page).to have_content("Price must not be blank")
    end

    scenario 'cannot create a space without a space description' do
      sign_in
      click_link 'Add Space'
      fill_in 'name',         with: 'Watermarque'
      fill_in 'price',        with: 10
      fill_in 'description',  with: ''
      fill_in 'from', with: Date.today
      fill_in 'to', with: Date.today
      expect{click_button 'Add Space'}.to_not change{host.spaces.count}
      expect(page).to have_content("Description must not be blank")
    end
  end
