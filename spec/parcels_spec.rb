require('rspec')
require('parcels')

describe('Parcels') do

  describe('#volume') do
    it('takes the dimensions of the parcel and returns the volume') do
      test_parcel = Parcels.new(2, 3, 4, 5)
      expect(test_parcel.volume()).to(eq(24))
    end
  end

  describe('#cost_to_ship') do
    it('calculates standard cost to ship') do
      test_parcel = Parcels.new(2, 3, 4, 5)
      expect(test_parcel.cost_to_ship()).to(eq(5))
    end
    it('calculates cost to ship if parcel is over 5lbs') do
      test_parcel = Parcels.new(2, 3, 4, 10)
      expect(test_parcel.cost_to_ship()).to(eq(40))
    end

    it('calculate cost to ship if parcel is over 10lbs') do
      test_parcel = Parcels.new(2, 3, 4, 15)
      expect(test_parcel.cost_to_ship()).to(eq(45))
    end

  end
end
