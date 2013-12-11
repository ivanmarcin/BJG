# encoding: UTF-8
module Cards

  describe Deck do
    describe '#new'  do
      it 'has 52 cards' do
        expect Deck.build_deck.count eq(52)
      end
    end

    describe '#shuffle' do
      it 'shuffles correctly' do
        bj_deck = Deck.build_deck
        shuffled_deck = Deck.shuffle(bj_deck)

        expect(bj_deck).not_to eq(shuffled_deck)
        expect(bj_deck).to eq(bj_deck & shuffled_deck)
      end
    end

    describe '#print' do
      it 'prints nicely' do
        expect(Card.new([:spade],[:king]).to_s).to eq "K♠"
        expect(Card.new([:heart],[:jack]).to_s).to eq "J♥"
        expect(Card.new([:diamond],[:queen]).to_s).to eq "Q♦"
        expect(Card.new([:clove],[:ace]).to_s).to eq "A♣"
        expect(Card.new([:clove],[:three]).to_s).to eq "3♣"
      end
    end

    describe '#value' do
      it 'calculates the correct value' do
        expect(Card.new([:clove],[:ace]).value).to eq 1
        expect(Card.new([:clove],[:king]).value).to eq 13
        expect(Card.new([:clove],[:three]).value).to eq 3
      end
    end
  end
end
