class ListingsNotes < Prawn::Document
  
  def initialize(listings)
    super(top_margin: 70)
    @noteslistings = listings
    header_info
    line_items
    
    
  end
  
  def header_info
    Time.zone = "Pacific Time (US & Canada)"
    t = Time.zone.now 
    text "#{ @noteslistings.count } listings", size: 15, style: :bold 
    text "#{t.zone}: #{t.to_s}  by Princess Leah ", size: 12
  end
  
  
  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      style(row(0), :background_color => '008080' )
      columns(1..2).align = :right
      self.row_colors = ["DDDDDD","FFFFFF"]
      self.header = true
    end
    
  end
  
  def line_item_rows
   [["id","name", "notes"] ] +
   @noteslistings.each.map do |nlisting|
     [nlisting.id, nlisting.name, nlisting.notes]
   end

  end
  
end