require "./start.rb"

describe Cell do
 let(:cell){Cell.new}
 let(:eightlivedcells){
         [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new,
         Cell.new]  
 }
 let(:twoOrThreelivedCells){
         [Cell.new(false), Cell.new, Cell.new, Cell.new(false), Cell.new(false),
         Cell.new(false), Cell.new(false),
         Cell.new(false)]  
 }
 let(:onlyOneLiveCell){
         [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(), Cell.new(false),
         Cell.new(false), Cell.new(false),
         Cell.new(false)]  
 }
 let(:threelivedCells){
     [Cell.new, Cell.new(false), Cell.new(false), Cell.new(), Cell.new,
      Cell.new(false), Cell.new(false),
     Cell.new(false)]  
 }


 context " a celCelll is live"
 it ".isLive? return true" do
    cell = Cell.new
    cell.live()
    cell.isLive?.should eq (true)
 end

 context " a cell is died"
 it ".isLive? return false" do
    cell.die()
    cell.isLive?.should eq (false) 
 end


 context " a cell is born"
 it ".isLive? return true" do
    cell.isLive?.should eq (true) 
 end

 context "a live cell with  >3 live  neightbors die"
  it "status my neighboars" do
    cell.isLive?.should eq (true)
    basket = CellBasket.new(cell, eightlivedcells)
    basket.compute
    cell.isLive?.should eq (false)
  end
 
 context "a live cell with  2 or 3 live  neightbors live"
  it "status my neighboars" do
    cell.isLive?.should eq (true)
    basket = CellBasket.new(cell, twoOrThreelivedCells)
    basket.compute
    cell.isLive?.should eq (true)
  end


 context "a live cell with  fewer than 2 live neightbors die"
  it "status my neighboars" do
    cell.isLive?.should eq (true)
    basket = CellBasket.new(cell, onlyOneLiveCell)
    basket.compute
    cell.isLive?.should eq (false)
  end


 context "a die cell with  3  live neightbors live"
  it "status my neighboars" do
    cell.die
    cell.isLive?.should eq (false)
    basket = CellBasket.new(cell, threelivedCells)
    basket.compute
    cell.isLive?.should eq (true)
  end
end 
