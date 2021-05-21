# frozen_string_literal: true

class Interface
  attr_reader :username, :bank, :game, :user, :dealer

  def initialize
    puts 'Please enter your name'
    @username = gets.chomp
    puts "\nHello, #{@username}!"
    @bank = Bank.new
    gameplay
  end

  private

  attr_writer :game, :user, :dealer

  def gameplay
    loop do
      puts "You have $ #{bank.user} in the bank. Let's start the game!\n \nDeal of cards...\n "
      start
      show_cards :face_down
      puts "Your points: #{user.points}\n \nAccepting bets...\n "
      turn
      puts "Showdown...\n "
      show_cards :face_up
      result
      puts "Enter 'start' to play again\nEnter something else to complete"
      break unless gets.chomp == 'start'
    end
  end

  def start
    self.user = Player.new
    self.dealer = Dealer.new
    self.game = Game.new(bank, dealer, user)
  end

  def turn
    loop do
      puts 'Your turn'
      puts 'Enter 1 to hit'
      puts 'Enter 2 to stand'
      puts 'Enter 3 to show cards and complete the game'
      case gets.chomp
      when '1' then game.play :hit
      when '2' then game.play :stand
      when '3' then break
      else puts 'Unknown choice. Try again.'
      end
      show_cards :face_down
      puts "Dealer's turn\n "
      break if game_over
    end
  end

  def game_over
    user.hand.full? || dealer.hand.full?
  end

  def show_cards(value)
    puts 'Dealer cards'
    if value == :face_up
      print_cards :dealer
    else
      puts "**\t**"
    end
    puts 'Your cards'
    print_cards :user
    puts "\n"
  end

  def print_cards(player)
    player = send player
    player.hand.cards.each { |card| print "#{card.indicator}\t" }
    puts "\n"
  end

  def result
    puts "Counting results...\n "
    puts "Dealer points: #{dealer.points}\nYour points: #{user.points}"
    case game.result
    when :user
      puts 'You win!'
    when :tie
      puts 'The game ended in a tie'
    else
      puts 'You lose'
    end
    puts "You have $ #{bank.user}\n "
  end
end
