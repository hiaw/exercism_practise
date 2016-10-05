defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
  :monday | :tuesday | :wednesday
  | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    case schedule do
      :first -> muFirst(year, month, weekday)
      :second -> muSecond(year, month, weekday)
      :third -> muThird(year, month, weekday)
      :fourth -> muFourth(year, month, weekday)
      :last -> muLast(year, month, weekday)
      :teenth -> muTeenth(year, month, weekday)
    end
  end

  def dayNum(weekday) do
    case weekday do
      :monday -> 1
      :tuesday -> 2
      :wednesday -> 3
      :thursday -> 4
      :friday -> 5
      :saturday -> 6
      :sunday -> 7
    end
  end

  def diffDate(year, month, weekday, weekCount) do
    day = :calendar.day_of_the_week({year, month, 1})
    dayDiff = dayNum(weekday) - day + 1
    ndayDiff = if dayDiff <= 0 do
      dayDiff + weekCount * 7
    else
      dayDiff + (weekCount - 1)* 7
    end
    {year, month, ndayDiff}
  end

  def muFirst(year, month, weekday) do
    diffDate(year, month, weekday, 1)
  end
  def muSecond(year, month, weekday) do
    diffDate(year, month, weekday, 2)
  end
  def muThird(year, month, weekday) do
    diffDate(year, month, weekday, 3)
  end
  def muFourth(year, month, weekday) do
    diffDate(year, month, weekday, 4)
  end

  def ndayDiff(dayDiff) do
    if dayDiff < 0 do
      dayDiff + 7
    else
      dayDiff
    end
  end

  def muLast(year, month, weekday) do
    totalDays= :calendar.last_day_of_the_month(year, month)
    day = :calendar.day_of_the_week({year, month, totalDays})
    dayDiff = day - dayNum(weekday)
    {year, month, totalDays - ndayDiff(dayDiff)}
  end

  def muTeenth(year, month, weekday) do
    day = :calendar.day_of_the_week({year, month, 19})
    dayDiff = day - dayNum(weekday)
    {year, month, 19 - ndayDiff(dayDiff)}
  end
end
