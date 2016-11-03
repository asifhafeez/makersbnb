require_relative '../app/models/booking_request.rb'

describe BookingRequest do

  it { should have_property :name }
  it { should have_property :email }
  it { should have_property :datefrom }
  it { should have_property :dateto }
  it { should have_property :purpose }

  context 'checking data input types' do
    it 'confirms input type of Name is String' do
      booking = BookingRequest.new
      booking.name = 'John'
      expect(booking.name).to be_instance_of(String)
    end

    it 'confirms input type of email is string' do
      booking = BookingRequest.new
      booking.email = 'john@john.com'
      expect(booking.email).to be_instance_of(String)
    end

    it 'confirms input type of purpose is String' do
      booking = BookingRequest.new
      booking.purpose = 'Business'
      expect(booking.purpose).to be_instance_of(String)
    end
  end
end
