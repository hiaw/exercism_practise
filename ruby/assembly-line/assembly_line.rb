class AssemblyLine
  CAR_PER_HOUR = 221
  MINUTES_PER_HOUR = 60

  def initialize(speed)
    @speed = speed
  end

  def success_rate
    if @speed >= 1 && @speed <= 4
      return 1.0
    elsif @speed >= 5 && @speed <= 8
      return 0.9
    elsif @speed == 9
      return 0.8
    end

    0.77
  end

  def production_rate_per_hour
    CAR_PER_HOUR * @speed * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / MINUTES_PER_HOUR).floor
  end
end
