# encoding: UTF-8
module Cards

  describe Deck do
    describe '#new'  do
      it 'has 52 cards' do
        expect Deck.build_deck.count eq(52)
      end
    end

    describe '#shuffle'  do
      it 'shuffled' do
        bj_deck = Deck.build_deck
        shuffled_deck = Deck.shuffle(bj_deck)

        expect(bj_deck).not_to eq(shuffled_deck)
        expect(bj_deck).to eq(bj_deck & shuffled_deck)
      end
    end
  end
end
