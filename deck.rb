require './card'

class Deck
  VALUES = (2..10).map(&:to_s) + %w(jack queen king ace)
  SUITS = %w(spades clubs diamonds hearts)

  def initialize
    @cards = VALUES.product(SUITS).map do |value, suit|
      Card.new(value: value, suit: suit)
    end
  end

  def shuffle
    @cards.shuffle
  end

  def count
    @cards.count
  end

  def cut
    range = rand(@cards.size)..@cards.size
    chunk = @cards.slice!(range)
    @cards = chunk + @cards
  end

  def fake_cut
    # no-op
  end

  def add_card(card, position: -1)
    @cards.insert(position, card)
  end

  def take_specific_card(card)
    position = @cards.index(card)
    take_card_at_position(position)
  end

  def take_top_card
    @cards.pop
  end

  def take_bottom_card
    @cards.shift
  end

  def take_card_at_position(index)
    @cards.delete_at(index)
  end

  def take_random_card
    take_card @cards.sample
  end

  def peek_at_top_card
    @cards.last
  end

  def peek_at_bottom_card
    @cards.first
  end

  def print_stack
    @cards.each.with_index do |card, i|
      puts "#{i}: #{card}"
    end
    nil
  end

  def ==(o)
    o.class == self.class && o.to_s == self.to_s
  end

  def to_s
    @cards.map.with_index do |card, i|
      "#{i}: #{card}"
    end.join(", ")
  end
end
