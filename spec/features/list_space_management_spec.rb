 require 'spec_helper'

  feature 'Listing a space' do
    scenario 'let a user add a space for rent from MakersBnB' do
      visit '/spaces'
      add_space_form
      expect{click_button 'Add Space'}.to change{Space.count}.by(1)
    end

    scenario 'shows the space added by the user' do
      visit '/spaces'
      add_space_form
      click_button 'Add Space'
      expect(page).to have_content('Watermarque')
    end

    scenario 'cannot create a space without a space name' do
      visit '/spaces'
      fill_in 'name',         with: ''
      fill_in 'price',        with: 10
      fill_in 'description',  with: 'Twin rooms'
      expect{click_button 'Add Space'}.to_not change{Space.count}
      expect(page).to have_content("Name must not be blank")
    end

    scenario 'cannot create a space without a space name' do
      visit '/spaces'
      fill_in 'name',         with: 'Watermarque'
      fill_in 'price',        with: ''
      fill_in 'description',  with: 'Twin rooms'
      expect{click_button 'Add Space'}.to_not change{Space.count}
      expect(page).to have_content("Price must not be blank")
    end

    scenario 'cannot create a space without a space name' do
      visit '/spaces'
      fill_in 'name',         with: 'Watermarque'
      fill_in 'price',        with: 10
      fill_in 'description',  with: ''
      expect{click_button 'Add Space'}.to_not change{Space.count}
      expect(page).to have_content("Description must not be blank")
    end
  end
