class Card
   CardImage="8CardBit.png"
    AppleImage = ""

# apple 100 banana 1001
@CardID = 0

def initialize
        #image scale
        @scale = 0.1
        # deafult image for cards
        @image = Gosu::Image.new("Images/"+CardImage)
      # cord values
        @x = @y = 0.0
        @itsMatched = false
      end

def settingId(num)
    # for apple
    case num
        when num = 1
         @CardID=100

            # for banana
     when num =2
         @CardID = 101
     when num = 3
        # id for strawberry
        @CardID = 102

    end


end

def settingMatch(bool)
    @itsMatched = bool
end
def gettingMatch()
    return @itsMatched
end

def gettingID()
    return @CardID
end

def restartCard()
    @image = Gosu::Image.new("Images/"+CardImage)
    @itsMatched = false
end


def showingImage()
imageString= ""

# case statement

case @CardID
when @CardID = 100 # apple ID
    @image = Gosu::Image.new("Images/appleBit.png")
when @CardID =101
    @image= Gosu::Image.new("Images/8BitBan.png")
when @CardID = 102
    @image= Gosu::Image.new("Images/berry.png")
end


end




# location of cards on screen
def location (locX1,locY1)
    @x = locX1
    @y = locY1
    end

def getLocationY()
    return  @y

end

def getLocationX()
    return  @x

end

 def draw
        @image.draw(@x, @y, 1,@scale,@scale)

      end
end
