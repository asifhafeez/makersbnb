require 'spec_helper'

 feature 'Creating a booking request', focus: :true do
   create_host
   create_space

   scenario 'let a user create a booking request on MakersBnB' do
    click_button 'Book Space'
     fill_in 'name',         with: 'Brian Chesky'
     fill_in 'email',        with: 'brian.chesky@airbnb.com'
     fill_in 'from',         with: Date.today
     fill_in 'to',           with: Date.today
     fill_in 'purpose',      with: 'pleasure'
     expect{click_button 'Book Space'}.to change{space.booking_requests.count}.by(1)
   end

     scenario 'cannot create a booking request without a name' do
       sign_in
       click_link 'Add Space'
       fill_in 'name',         with: ''
       fill_in 'email',        with: 'brian.chesky@airbnb.com'
       fill_in 'from',         with: Date.today
       fill_in 'to',           with: Date.today
       fill_in 'purpose',      with: 'pleasure'
       expect{click_button 'Book Space'}.to_not change{BookingRequest.count}
       expect(page).to have_content("Name must not be blank")
     end

     scenario 'cannot create a booking request without an email' do
       sign_in
       click_link 'Add Space'
       fill_in 'name',         with: 'Brian Chesky'
       fill_in 'email',        with: ''
       fill_in 'from',         with: Date.today
       fill_in 'to',           with: Date.today
       fill_in 'purpose',      with: 'pleasure'
       expect{click_button 'Book Space'}.to_not change{BookingRequest.count}
       expect(page).to have_content("Email must not be blank")
     end

     scenario 'cannot create a booking request without a check-in date' do
       sign_in
       click_link 'Add Space'
       fill_in 'name',         with: 'Brian Chesky'
       fill_in 'email',        with: 'brian.chesky@airbnb.com'
       fill_in 'from',         with: ''
       fill_in 'to',           with: Date.today
       fill_in 'purpose',      with: 'pleasure'
       expect{click_button 'Book Space'}.to_not change{BookingRequest.count}
       expect(page).to have_content("Datefrom must not be blank")
     end

     scenario 'cannot create a booking request without a check-out date' do
       sign_in
       click_link 'Add Space'
       fill_in 'name',         with: 'Brian Chesky'
       fill_in 'email',        with: 'brian.chesky@airbnb.com'
       fill_in 'from',         with: Date.today
       fill_in 'to',           with: ''
       fill_in 'purpose',      with: 'pleasure'
       expect{click_button 'Book Space'}.to_not change{BookingRequest.count}
       expect(page).to have_content("Dateto must not be blank")
     end

 end
