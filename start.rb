class Cell
    def initialize(live=true)
        @live = live
    end

    def isLive?
        @live
    end
    
    def live()
        @live = true
    end

    def die
        @live = false
    end
end

class CellBasket
    THREE = 3
    TWO = 2

    def initialize(cell, vicini)
     @cell = cell
     @map = {cell => vicini}
    end

    def compute
       liveCells = 0
       @map[@cell].each { |aCell|
         liveCells +=1 if(aCell.isLive?)
       }
       exec(liveCells)
    end
private
    def exec(liveCells)
        @cell.die if(moreThanTHREEorminusthanTWO(liveCells))
        @cell.live if(liveCells == THREE)
    end   

    def moreThanTHREEorminusthanTWO(liveCells)
       (liveCells > THREE || liveCells < TWO)
    end
end
