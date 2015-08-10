class Parcels
  define_method(:initialize) do |length, width, height, weight|
    @length = length
    @width = width
    @height = height
    @weight = weight
  end

  define_method(:volume) do
    volume = @length.*(@width).*(@height)
    volume
  end

  cost_per_pound = {(1..5)=>5, (6..10)=>4, (11..15)=>3, (16..20)=>2}

  define_method(:cost_to_ship) do
    if (1..5).include?(@weight)
      cost_per_pound.fetch(1..5)
    elsif
      (6..10).include?(@weight)
      small_parcel_cost = cost_per_pound.fetch(6..10)
      small_parcel_total = small_parcel_cost.*(@weight)
      small_parcel_total
    end
  end

 # volume_weight = self.volume()./166
 # volume_weight_cost =
end
