# encoding: UTF-8
module Players

  describe 'BlackJack Player' do
    test_player = BlackJackPlayer.new("test")
    describe '#new' do
      it 'has a name' do
        test_player = BlackJackPlayer.new("test")
        expect(test_player.name).to eq("test")
      end
    end

    describe '#cards_in_hand' do
      it 'starts with an empty hand' do
        expect(BlackJackPlayer.new("test").cards_in_hand.count).to eq(0)
      end

      it 'can add card to deck' do
        test_player = BlackJackPlayer.new("player")
        card = Card.new(:heart,:ace)
        test_player.add_card(card)
        expect(test_player.cards_in_hand.keys).to include(card)
      end

      it 'flips visibility of cards when adding hidden card' do
        test_player = BlackJackPlayer.new("player2")
        c1 = Card.new(:heart,:three)
        c2 = Card.new(:diamond,:three)

        test_player.add_card(c1, true)
        expect(test_player.cards_in_hand[c1]).to eq(true)

        test_player.add_card(c2, false)
        expect(test_player.cards_in_hand[c1]).to eq(true)
        expect(test_player.cards_in_hand[c2]).to eq(false)
      end

      it 'calls a blackjack correctly' do
        test_player = BlackJackPlayer.new("bj")
        c1 = Card.new([:heart],[:ace])
        c2 = Card.new([:diamond],[:king])
        c3 = Card.new([:clove],[:four])

        expect(test_player.blackjack_in_hand?).to eq(false)

        test_player.add_card(c1)
        test_player.add_card(c2)
        expect(test_player.blackjack_in_hand?).to eq(true)

        test_player.add_card(c3)
        expect(test_player.blackjack_in_hand?).to eq(false)
      end

      it 'calculates the hand value ' do
        test_player = BlackJackPlayer.new("hvalue")
        c1 = Card.new([:heart],[:ace])
        c2 = Card.new([:diamond],[:king])
        c3 = Card.new([:clove],[:three])

        expect(test_player.hand_value).to eq(0)

        test_player.add_card(c1)
        expect(test_player.hand_value).to eq(11)

        test_player.add_card(c2)
        expect(test_player.hand_value).to eq(21)

        test_player.add_card(c3)
        expect(test_player.hand_value).to eq(14)
      end
    end
  end
end

