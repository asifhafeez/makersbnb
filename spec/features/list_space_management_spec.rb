 require 'spec_helper'

  feature 'list space' do
    scenario 'let a user add a space for rent from MakersBnB' do
      visit '/'
      add_space_form
      expect(page).to have_xpath('/')
    end
  end
