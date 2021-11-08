require_relative 'station'
require_relative 'journey'

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @in_journey = false
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE

    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    raise 'Insufficient balance to touch in' if balance < MINIMUM_FARE
    @entry_station = station
    @journeys << { entry_station: @entry_station, exit_station: @exit_station }


    # record_journey(station)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    @in_journey = false
    @journeys << { entry_station: @entry_station, exit_station: @exit_station }
    @entry_station = nil
  end

  def deduct(amount)
    @balance -= amount
    @in_journey = false
  end

  private

  def record_journey(station)
    @entry_station = station
    @exit_station = station
  end
end
