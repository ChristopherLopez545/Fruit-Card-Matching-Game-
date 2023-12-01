require 'gosu'
require './card'

class Tutorial < Gosu::Window
 # number to match the card
@matchNum = 0


def initialize
    super 680,  460
    #title
    self.caption = "Matching Fruits"
    # points counter
    @points =0
    #
    @matchCounter =0

    #background image
    @background = Gosu::Image.new("Images/background.png", tileable: true)
    #calculating scale so background can fit into window property
    @scale_x = self.width.to_f / @background.width
    @scale_y = self.height.to_f / @background.height

 #sound effect for match
  @matchSound = Gosu::Sample.new("matchSound.wav")



# delcaring the cards
        @Card1= Card.new
        @Card2 = Card.new
        @Card3 = Card.new
        @Card4 = Card.new
        @Card5 = Card.new
        @Card6 = Card.new

        # setting the Id of the cards
        @Card1.settingId(1)
        @Card2.settingId(2)
        @Card3.settingId(3)
        @Card4.settingId(1)
        @Card5.settingId(3)
        @Card6.settingId(2)

# creating a array of cards and using the shuffle method
card_Array = [@Card1,@Card2,@Card3,@Card4,@Card5,@Card6]
@shuffleCards= card_Array.shuffle
# setting the locations of the cards
@shuffleCards.at(0).location(100,100)
@shuffleCards.at(1).location(200,100)
@shuffleCards.at(2).location(300,100)
@shuffleCards.at(3).location(400,100)
@shuffleCards.at(4).location(200,225)
@shuffleCards.at(5).location(300,225)

# variables to check if the card has been clicked on
@alreadyClicked1=false
@alreadyClicked2 = false
@alreadyClicked3=false
@alreadyClicked4 = false
@alreadyClicked5 = false
@alreadyClicked6 = false
# counter for when two does do not match
@doesNotMatch = 0


@nomatch1= false
@nomatch2 = false
@nomatch3= false
@nomatch4 = false
@nomatch5= false
@nomatch6 = false

# text when player wins
@winnerText = Gosu::Font.new(100)
# varaible to show winner text on screen
@playerWon = false
# points object with font size 100
@font = Gosu::Font.new(100)
# var for player losing
@lostText = Gosu::Font.new(100)
#font color for text on screen
@font_color = Gosu::Color::BLACK
@font_RED = Gosu::Color::RED

# player lost
@playerLost = false
#gameplay
@gameplay = true
# image for player losing
@farmLand = Gosu::Image.new("Images/farm.png", tileable: true)
#declaring heart images
@heart1 =  Gosu::Image.new("Images/heart.png", tileable: true)
@heart2 =  Gosu::Image.new("Images/heart.png", tileable: true)
@heart3 =  Gosu::Image.new("Images/heart.png", tileable: true)
# vars to control image view for hearts
@draw_heart1 = true
@draw_heart2 = true
@draw_heart3 = true
# lives
@@total_lives = 0
  end

# all the game logic
  def update
#checking if player lost
if @@total_lives == 3
  @playerLost = true
  @gameplay = false
end
  #checking if player wins
if @points == 3
    #setting the playerWon var to true because player won
    @playerWon = true
end

   # game card logic below
    # for card 1
  # the location of card one on screen
if  ( Gosu.button_down? Gosu::MS_LEFT ) and ((113.0<=mouse_x) and mouse_x<=188.0) and mouse_y <= 200.0
  # checking if the card has been clicked false = it has not been clicked on
    if @alreadyClicked1 == false
        # if the matchnumber matches the card ID number
        if @matchNum == @shuffleCards.at(0).gettingID()
          # plays a sound
          @matchSound.play
            # the first card IS matched
            @shuffleCards.at(0).settingMatch(true)
            # inc points
            @points +=1
                # setting the other card in the deck to be true/ matched
                @shuffleCards.each do |card|
                  if card.gettingID == @matchNum
                       #restarting card
                       card.settingMatch(true)
                  end
               end


                #setting the match numer to zero because a match already happened
                @matchNum = 0
              # counter resets
            @doesNotMatch = 0
            # first card is matched
            @nomatch1 = true
            # shows the image of the fruit
            @shuffleCards.at(0).showingImage()
            # first card is clicked, cannot click it again
            @alreadyClicked1 = true
            else
              # get the ID of first can and assign it to matchNum
              @matchNum = @shuffleCards.at(0).gettingID()
                @alreadyClicked1 = true
                # show image of fruit
                @shuffleCards.at(0).showingImage()
                # if no match occurs then increment doesNotMatch
                if @nomatch1 == false
                  @doesNotMatch += 1
                end


        end


    end

end
       # second card
if  ( Gosu.button_down? Gosu::MS_LEFT ) and ((214.0<=mouse_x) and mouse_x<=288.0) and mouse_y <= 200.0
    if @alreadyClicked2 == false
          puts(@matchCounter)
        if @matchNum == @shuffleCards.at(1).gettingID()
          @matchSound.play
            @shuffleCards.at(1).settingMatch(true)
            puts (@matchNum)
            @points +=1
             puts ("Its a match! Points" + @points.to_s )

          #
          @shuffleCards.each do |card|
            if card.gettingID == @matchNum
                 #restarting card
                 card.settingMatch(true)
            end
         end
          #
          #setting the match numer to zero because a match already happened
          @matchNum = 0

            @doesNotMatch = 0
            nomatch2 = true
            @shuffleCards.at(1).showingImage()
            @alreadyClicked2 = true
           else
            @matchNum = @shuffleCards.at(1).gettingID()
            @shuffleCards.at(1).showingImage()
            @alreadyClicked2 = true
          if @nomatch2 == false

             @doesNotMatch += 1
               end

         end

   end
end

            # third card
if  ( Gosu.button_down? Gosu::MS_LEFT ) and ((313.0<=mouse_x) and mouse_x<=388.0)  and mouse_y <= 200.0
  if @alreadyClicked3 == false
    if @matchNum == @shuffleCards.at(2).gettingID()
      @matchSound.play
      @shuffleCards.at(2).settingMatch(true)
      puts (@matchNum)
      @points +=1
       puts ("Its a match! Points" + @points.to_s )
        #
        @shuffleCards.each do |card|
          if card.gettingID == @matchNum
               #restarting card
               card.settingMatch(true)
          end
        end
        #
        #setting the match numer to zero because a match already happened
        @matchNum = 0
       @doesNotMatch = 0
      @nomatch3 = true
      @alreadyClicked3 = true
      @shuffleCards.at(2).showingImage()
      else
              @matchNum = @shuffleCards.at(2).gettingID()
              @shuffleCards.at(2).showingImage()
             @alreadyClicked3 = true
       if @nomatch3 == false
          @doesNotMatch += 1
        end

      end
    end
end

# fourth card
if  ( Gosu.button_down? Gosu::MS_LEFT ) and ((413.0<=mouse_x) and mouse_x<=488.0) and mouse_y <= 200.0

      if @alreadyClicked4 == false
        if @matchNum == @shuffleCards.at(3).gettingID()
          @matchSound.play
           @shuffleCards.at(3).settingMatch(true)
            #
            @shuffleCards.each do |card|
              if card.gettingID == @matchNum
                   #restarting card
                   card.settingMatch(true)
              end
           end

            #
            #setting the match numer to zero because a match already happened
                   @matchNum = 0
                   @points +=1

                 @doesNotMatch = 0
                 @nomatch4 = true

             end

                @matchNum = @shuffleCards.at(3).gettingID()
                 @shuffleCards.at(3).showingImage()
                @alreadyClicked4 = true
          if @nomatch4 == false

             @doesNotMatch += 1
               end
        end
   end

# fifth card
if  ( Gosu.button_down? Gosu::MS_LEFT ) and ((214.0<=mouse_x) and mouse_x<=288.0) and mouse_y > 224.0

      if @alreadyClicked5 == false

        if @matchNum == @shuffleCards.at(4).gettingID()
          @matchSound.play
            @shuffleCards.at(4).settingMatch(true)
            @points +=1
                # setting the other card in the deck to be true
                @shuffleCards.each do |card|
                  if card.gettingID == @matchNum
                       #restarting card
                       card.settingMatch(true)
                  end
               end


                #setting the match numer to zero because a match already happened
                @matchNum = 0

            @doesNotMatch = 0
            @nomatch5 = true
            @shuffleCards.at(4).showingImage()
            @alreadyClicked5 = true
            else
              @matchNum = @shuffleCards.at(4).gettingID()
                @alreadyClicked5 = true
                @shuffleCards.at(4).showingImage()
                if @nomatch5 == false
                  @doesNotMatch += 1
                end


        end
           # @matchNum = @shuffleCards.at(0).gettingID()
    end
  end

# sixth card
if  ( Gosu.button_down? Gosu::MS_LEFT ) and ((313.0<=mouse_x) and mouse_x<=388.0) and mouse_y > 224.0

      if @alreadyClicked6 == false

        if @matchNum == @shuffleCards.at(5).gettingID()
          @matchSound.play
            @shuffleCards.at(5).settingMatch(true)
            @points +=1
                # setting the other card in the deck to be true
                @shuffleCards.each do |card|
                  if card.gettingID == @matchNum
                       #restarting card
                       card.settingMatch(true)
                  end
               end


                #setting the match numer to zero because a match already happened
                @matchNum = 0

            @doesNotMatch = 0
            @nomatch6 = true
            @shuffleCards.at(5).showingImage()
            @alreadyClicked6 = true
            else
              @matchNum = @shuffleCards.at(5).gettingID()
                @alreadyClicked6 = true
                @shuffleCards.at(5).showingImage()
                if @nomatch6 == false
                  @doesNotMatch += 1
                end


        end
           # @matchNum = @shuffleCards.at(0).gettingID()
    end
end



            # resetting cards
               if @doesNotMatch == 2
                   @shuffleCards.each do |card|
                    # checking each card in the array and if it is not matched the card image resets
                       if card.gettingMatch() == false
                            #restarting card
                            card.restartCard()

                       end

                    end

                   @alreadyClicked1 = false
                   @alreadyClicked2 = false
                   @alreadyClicked3 = false
                   @alreadyClicked4 = false
                   @alreadyClicked5 = false
                   @alreadyClicked6 = false
                   # restarting counter for not matched
                   @doesNotMatch = 0
                   # setting the matchNum value to 0
                   @matchNum = 0
                   #player lost a heart
                  @@total_lives += 1
                # when total lives increments, the heart image gets removed
               case @@total_lives
               when @@total_lives = 1
                  @draw_heart3 = false
               when @@total_lives = 2
                  @draw_heart2 = false
               when @@total_lives = 3
                @draw_heart1 = false
               end



               end


end

  def draw
    # window drawing images
   @shuffleCards.at(0).draw if @gameplay
   @shuffleCards.at(1).draw  if @gameplay
   @shuffleCards.at(2).draw  if @gameplay
   @shuffleCards.at(3).draw  if @gameplay
   @shuffleCards.at(4).draw  if @gameplay
   @shuffleCards.at(5).draw  if @gameplay


   #draw the number of points the player has
   @font.draw_text(@points.to_s,280,10,1)  if @gameplay
    #drawing background image
   @background.draw(0,0,0,@scale_x,@scale_y)   if @gameplay

   #drawing heart if true
   @heart1.draw(350,15,1,0.1,0.1) if @draw_heart1 and @gameplay
   @heart2.draw(415,15,1,0.1,0.1) if @draw_heart2 and @gameplay
   @heart3.draw(480,15,1,0.1,0.1) if @draw_heart3 and @gameplay
   #drawing farm back ground and losing text
   @farmLand.draw(0,0,0,@scale_x,@scale_y) if @playerLost
   @lostText.draw_text("You lost!",297,150,1,1.0,1.0,@font_color) if @playerLost

   # drawing "You won!" text on screen
   @winnerText.draw_text("You won!",250,355,1,1.0,1.0,@font_RED) if @playerWon

  end


end

Tutorial.new.show
