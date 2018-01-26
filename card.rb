class Card
  attr_reader :value, :suit

  def initialize(value:, suit:)
    @value = value
    @suit = suit
  end

  def to_s
    "#{value.capitalize} of #{suit.capitalize}"
  end

  def ==(o)
    o.class == self.class && o.to_s == self.to_s
  end
end
