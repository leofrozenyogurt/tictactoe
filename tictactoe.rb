


class TicTacToe
  
  attr_accessor :slots, :win_combos
  
  def initialize(play_game=false)
    # Possible moves on the board
    @slots = {
      "a1"=>" ", "a2"=>" ", "a3"=>" ",
      "b1"=>" ", "b2"=>" ", "b3"=>" ",
      "c1"=>" ", "c2"=>" ", "c3"=>" ", 
    }
    
    # Possible winning combinations
    @win_combos = [
      ['a1', 'a2', 'a3'],
      ['b1', 'b2', 'b3'],
      ['c1', 'c2', 'c3'],
      
      ['a1', 'b1', 'c1'],
      ['a2', 'b2', 'c2'],
      ['a3', 'b3', 'c3'],
      
      ['a1', 'b2', 'c3'],
      ['c1', 'b2', 'a3']
    ]
    
    @player1 = 'X'
    @player2 = 'O'
    

   
    if play_game
      greeting
      player1_move
      player2_move
    end 
  end
  
  def greeting
      # Greeting 
      puts '#####################################################################'
      puts " "
      print "Player 1 enter your name:"
      @player1_name=gets.chomp
      puts "Hello, #{@player1_name}"
      puts ""
      print "Player 2 what is your name?"
      @player2_name = gets.chomp
      puts '------------------------------------------------------------------'
      puts "So its #{@player1_name} vs #{@player2_name}"
    end
    
  

  def instructions
    puts '------------------------------------------------------------------'
    puts "#{@player1_name}: #{@player1}"
    puts " VS."
    puts "#{@player2_name}: #{@player2}"
    puts '------------------------------------------------------------------'
    puts 'Directions: make a move by entering the letter & number representing'
    puts "the slot you're trying to fill. For example, 'a1' , 'b2', 'c3', etc."
    puts ' '
  end
  
  def show_board
    puts '------------------------------------------------------------------'
    puts "   a b c"
    puts ' '
    puts " 1 #{@slots["a1"]}|#{@slots["b1"]}|#{@slots["c1"]}"
    puts '   ------'
    puts " 2 #{@slots["a2"]}|#{@slots["b2"]}|#{@slots["c2"]}"
    puts '   ------'
    puts " 3 #{@slots["a3"]}|#{@slots["b3"]}|#{@slots["c3"]}"
    puts '------------------------------------------------------------------'
  end
  
  def draw_board
    instructions
    show_board
  end
  
  def player1_move
   draw_board
   puts "#{@player1_name.upcase} please make your move."
   move = gets.chomp.downcase
    
    return wrong_input unless move.length == 2 
      x = move.split("")
      if(['a','b','c'].include? x[0])
        if(['1','2','3'].include? x[1])
          if @slots[move] == " "
            @slots[move] = @player1
            puts '------------------------------------------------------------'
            puts "#{@player1_name} marks #{move}"
          else
            wrong_move
          end
        else
          wrong_input
        end
      else
        wrong_input
      end
    draw_board
    player2_move
  end
  
  def wrong_input
    puts "Please specify a move with the format 'A1' , 'B3' , 'C2' etc."
    player1_move
  end
  
  def wrong_move
    puts "You must choose an empty slot"
    player1_move
  end
    
    def moves_remaining
    slots = 0
    @slots.each do |key, value|
      slots += 1 if value == " "
    end
    slots
  end
    
    def player2_move
    # if 
      # need to write method to look for a corner
   draw_board
   puts "#{@player2_name.upcase} please make your move."
   move = gets.chomp.downcase
    
    return wrong_input unless move.length == 2 
      x = move.split("")
      if(['a','b','c'].include? x[0])
        if(['1','2','3'].include? x[1])
          if @slots[move] == " "
            @slots[move] = @player2
            puts '------------------------------------------------------------'
            puts "#{@player2_name} marks #{move}"
          else
            wrong_move
          end
        else
          wrong_input
        end
      else
        wrong_input
      end
    draw_board
    player1_move
  end


  def times_in_slot slot, letter
    times = 0
    slot.each do |x|
      times += 1 if @slots[x] == letter
      unless @slots[x] == letter || @slots[x] == " "
        return 0
      end
    end
    times
  end
  
  def empty_slot slot
    slot.each do |x|
      if @slots[x] == " "
        return x
      end
    end
  end
    
  def check_board(next_move)
    
    game_over = nil
    
    @win_combos.each do |slot|
      
      if times_in_slot(slot, @player2) == 3
        puts "GAME OVER... #{@player2_name}! "
        game_over = true
        show_board
      end
      
      
      if times_in_slot(slot, @player1) == 3
        puts "GAME OVER... #{@player1_name} !"
        game_over = true
        show_board
      end
    end
    
    unless game_over
      if(moves_remaining > 0)
        if(next_move == @player1)
          player1_move
        else
          player2_move
        end
      else
        puts "CAT'S GAME, try again!"
      end
    end
  end  
  
end


class TicTacToeCPU
  
  attr_accessor :slots, :win_combos
  
  def initialize(play_game=false)
    # Possible moves on the board
    @slots = {
      "a1"=>" ", "a2"=>" ", "a3"=>" ",
      "b1"=>" ", "b2"=>" ", "b3"=>" ",
      "c1"=>" ", "c2"=>" ", "c3"=>" ", 
    }
    
    # Possible winning combinations
    @win_combos = [
      ['a1', 'a2', 'a3'],
      ['b1', 'b2', 'b3'],
      ['c1', 'c2', 'c3'],
      
      ['a1', 'b1', 'c1'],
      ['a2', 'b2', 'c2'],
      ['a3', 'b3', 'c3'],
      
      ['a1', 'b2', 'c3'],
      ['c1', 'b2', 'a3']
    ]
    
    @player = 'X'
    @computer = 'O'
    


if play_game
      greeting2
      player_move
      computer_move
end 
end

def greeting2
      # Greeting 
      puts '#####################################################################'
      puts " "
      puts "Player 1 enter your name"
      @player_name=gets.chomp
      puts "Hello, #{@player_name} today you will be facing Rebel"
 end
 
 
  
  def instructions
    puts '------------------------------------------------------------------'
    puts "#{@player_name}: #{@player}"
    puts " VS."
    puts "Rebel"
    puts '------------------------------------------------------------------'
    puts 'Directions: make a move by entering the letter & number representing'
    puts "the slot you're trying to fill. For example, 'a1' , 'b2', 'c3', etc."
    puts ' '
  end
  
  def show_board
    puts '------------------------------------------------------------------'
    puts "   a b c"
    puts ' '
    puts " 1 #{@slots["a1"]}|#{@slots["b1"]}|#{@slots["c1"]}"
    puts '   ------'
    puts " 2 #{@slots["a2"]}|#{@slots["b2"]}|#{@slots["c2"]}"
    puts '   ------'
    puts " 3 #{@slots["a3"]}|#{@slots["b3"]}|#{@slots["c3"]}"
    puts '------------------------------------------------------------------'
  end
  
  def draw_board
    instructions
    show_board
  end
  
  def player_move
   draw_board
   puts "#{@player_name.upcase} please make your move."
   move =gets.chomp.downcase
    
    return wrong_input unless move.length == 2 
      x = move.split("")
      if(['a','b','c'].include? x[0])
        if(['1','2','3'].include? x[1])
          if @slots[move] == " "
            @slots[move] = @player
            puts '------------------------------------------------------------'
            puts "#{@player} marks #{move}"
          else
            wrong_move
          end
        else
          wrong_input
        end
      else
        wrong_input
      end
    draw_board
    computer_move
  end
  
  def wrong_input
    puts "Please specify a move with the format 'A1' , 'B3' , 'C2' etc."
    player_move
  end
  
  def wrong_move
    puts "You must choose an empty slot"
    player_move
  end
    
    def moves_remaining
    slots = 0
    @slots.each do |key, value|
      slots += 1 if value == " "
    end
    slots
  end
    
    def computer_move

      move = find_move
      @slots[move] = @computer
      puts '---------------------------------------------------------------------'
      puts "Rebel marks #{move}"
      check_board(@player)

  end
  

  
  def find_move
    # check to see if computer can win
    # check to see if any slots already have 2 filled by computer
    @win_combos.each do |option|
      if times_in_slot(option, @computer) == 2
        return empty_slot option
      end
    end
    
    # check to see if user can win
    # check to see if any slots already have 2 filled by user
    @win_combos.each do |option|
      if times_in_slot(option, @player) == 2
        return empty_slot option
      end
    end
    
    #see if any slots already have 1 filled by computer
    @win_combos.each do |option|
      if times_in_slot(option, @computer) == 1
        return empty_slot option
      end
    end
    
    # no strategic moves available, selects any open slot
    random_move
  end
  
  def random_move
    key = @slots.keys;
    move = rand(key.length)
    if @slots[key[move]] == " "
      return key[move]
    else
      @slots.each { |key,value| return key if value == " "}
    end
  end

  def times_in_slot slot, letter
    times = 0
    slot.each do |x|
      times += 1 if @slots[x] == letter
      unless @slots[x] == letter || @slots[x] == " "
        return 0
      end
    end
    times
  end
  
  def empty_slot slot
    slot.each do |x|
      if @slots[x] == " "
        return x
      end
    end
  end
    
  def check_board(next_move)
    
    game_over = nil
    
    @win_combos.each do |slot|
      # check to see if computer has won
      if times_in_slot(slot, @computer) == 3
        puts "GAME OVER... #{@player2_name} wins....he always does!"
        game_over = true
        show_board
      end
      
      # check to see if user has won
      if times_in_slot(slot, @player) == 3
        puts "GAME OVER... #{@player_name} wins...I've made a terrible mistake!"
        game_over = true
        show_board
      end
    end
    
    unless game_over
      if(moves_remaining > 0)
        if(next_move == @player)
          player_move
        else
         computer_move
        end
      else
        puts "CAT'S GAME, try again!"
      end
    end
  end  
  





    #option of game
    puts "Would you like to face a friend or the computer?:"
    print "Print 1 for solo or 2 for multiplayer:"
    choose=gets.chomp
    case
    when choose=="1"
    TicTacToeCPU.new(true)
    when choose=="2"
    TicTacToe.new(true)
    else 
    puts "that option is not available"
    end
    end