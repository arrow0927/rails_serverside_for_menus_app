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
      columns(0..3).align = :left
      columns(0..3).style(:size=>6)
      self.row_colors = ["DDDDDD","FFFFFF"]
      self.header = true
    end
    
  end
  
  def line_item_rows
   [["id","name", "address", "notes"] ] +
   @noteslistings.each.map do |nlisting|
     [nlisting.id, nlisting.name, nlisting.address, nlisting.notes]
   end

  end
  
end