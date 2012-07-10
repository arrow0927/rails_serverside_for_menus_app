class ListingsNotes < Prawn::Document
  
  def initialize(listings)
    super(top_margin: 10)
    @noteslistings = listings
    header_info
    line_items
  end
  
  def header_info
    Time.zone = "Pacific Time (US & Canada)"
    t = Time.zone.now 
    text "#{ @noteslistings.count } listings |Printed On: #{t.zone}: #{t.to_s} ", size: 10, style: :bold 
  end
  
  
  def line_items
    table line_item_rows do 
      row(0).font_style = :bold
      style(row(0), :background_color => '008080' )
      columns(0..5).align = :left
      columns(0..5).style(:size=>6)
      self.row_colors = ["DDDDDD","FFFFFF"]
      self.header = true
    end
    
  end
  #Change the parameters here if you want to change
  #report type
  def line_item_rows
   [["name", "address","menu_state", "menu_source"] ] +
   @noteslistings.each.map do |nlisting|
     [nlisting.name, nlisting.address, nlisting.menu_state, nlisting.menu_source ]
   end

  end
  
end