require('rspec')
require('parcels')

describe('Parcels') do

  describe('#volume') do
    it('takes the dimensions of the parcel and returns the volume') do
      test_parcel = Parcels.new(2, 3, 4, 5)
      expect(test_parcel.volume()).to(eq(24))
    end
  end

end
