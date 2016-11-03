require 'spec_helper'

 feature 'Creating a booking request', focus: :true do
   scenario 'let a user create a booking request on MakersBnB' do
     visit '/booking_request'
     fill_in 'name',         with: 'Brian Chesky'
     fill_in 'email',        with: 'brian.chesky@airbnb.com'
     fill_in 'from',         with: Date.today
     fill_in 'to',           with: Date.today
     fill_in 'purpose',      with: 'pleasure'
     expect{click_button 'Book Space'}.to change{BookingRequest.count}.by(1)
   end

     scenario 'cannot create a booking request without a name' do
       visit '/booking_request'
       fill_in 'name',         with: ''
       fill_in 'email',        with: 'brian.chesky@airbnb.com'
       fill_in 'from',         with: Date.today
       fill_in 'to',           with: Date.today
       fill_in 'purpose',      with: 'pleasure'
       expect{click_button 'Book Space'}.to_not change{BookingRequest.count}
       expect(page).to have_content("Name must not be blank")
     end

     scenario 'cannot create a booking request without an email' do
       visit '/booking_request'
       fill_in 'name',         with: 'Brian Chesky'
       fill_in 'email',        with: ''
       fill_in 'from',         with: Date.today
       fill_in 'to',           with: Date.today
       fill_in 'purpose',      with: 'pleasure'
       expect{click_button 'Book Space'}.to_not change{BookingRequest.count}
       expect(page).to have_content("Email must not be blank")
     end

     scenario 'cannot create a booking request without a check-in date' do
       visit '/booking_request'
       fill_in 'name',         with: 'Brian Chesky'
       fill_in 'email',        with: 'brian.chesky@airbnb.com'
       fill_in 'from',         with: ''
       fill_in 'to',           with: Date.today
       fill_in 'purpose',      with: 'pleasure'
       expect{click_button 'Book Space'}.to_not change{BookingRequest.count}
       expect(page).to have_content("Datefrom must not be blank")
     end

     scenario 'cannot create a booking request without a check-out date' do
       visit '/booking_request'
       fill_in 'name',         with: 'Brian Chesky'
       fill_in 'email',        with: 'brian.chesky@airbnb.com'
       fill_in 'from',         with: Date.today
       fill_in 'to',           with: ''
       fill_in 'purpose',      with: 'pleasure'
       expect{click_button 'Book Space'}.to_not change{BookingRequest.count}
       expect(page).to have_content("Dateto must not be blank")
     end

 end
