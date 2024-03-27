class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagon)
    wagon
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    a, b, c, *d = each_wagons_id
    [c, *missing_wagons, *d, a, b]
  end

  def self.add_missing_stops(journey, **stops)
    { **journey, stops: stops.values }
  end

  def self.extend_route_information(route, more_route_information)
    { **route, **more_route_information }
  end
end
