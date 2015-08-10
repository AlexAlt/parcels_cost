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

  define_method(:cost_to_ship) do
    cost_per_pound = {(1..5)=>5, (6..10)=>4, (11..15)=>3, (16..20)=>2}
    volume_weight = self.volume()./166

    if volume_weight.>(@weight)
      if (1..5).include?(volume_weight)
        flat_rate = cost_per_pound.fetch(1..5)
        flat_rate
      elsif (6..10).include?(volume_weight)
        small_parcel_cost = cost_per_pound.fetch(6..10).*(volume_weight)
        small_parcel_cost
      elsif (11..15).include?(volume_weight)
        medium_parcel_cost = cost_per_pound.fetch(11..15).*(volume_weight)
        medium_parcel_cost
      elsif (16..20).include?(volume_weight)
        large_parcel_cost = cost_per_pound.fetch(16..20).*(volume_weight)
        large_parcel_cost
      end

    else
      if (1..5).include?(@weight)
        flat_rate = cost_per_pound.fetch(1..5)
        flat_rate
      elsif (6..10).include?(@weight)
        small_parcel_cost = cost_per_pound.fetch(6..10).*(@weight)
        small_parcel_cost
      elsif (11..15).include?(@weight)
        medium_parcel_cost = cost_per_pound.fetch(11..15).*(@weight)
        medium_parcel_cost
      elsif (16..20).include?(@weight)
        large_parcel_cost = cost_per_pound.fetch(16..20).*(@weight)
        large_parcel_cost
      end
    end
  end

  define_method(:next_day_delivery) do
    next_day = self.cost_to_ship().*(1.5)
    next_day
  end

end
