require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

  describe('shipping cost calculation', {:type=>:feature}) do
      it("lets the user input parcel's dimensions and weight, and select
      delivery method. Then it calculates the shipping cost after they hit submit") do
      visit("/")
      fill_in('length', :with => '2')
      fill_in('width', :with => '3')
      fill_in('height', :with => '4')
      fill_in('weight', :with => '10')
      check('next_day_delivery')
      click_button('Submit')
      expect(page).to have_content('Your shipping cost is: $ 60')
   end
  end
