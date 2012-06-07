class ListingsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Listing.count,
      iTotalDisplayRecords: listings.total_entries,
      aaData: data
    }
  end

private

  def data
    listings.map do |listing|
      [
        h(listing.id),
        link_to(listing.name, listing),
        h(listing.telephone),
        h(listing.fax),
        h(listing.suite),
        h(listing.address),
        h(listing.city),
        h(listing.province),
        h(listing.postal_code),
        h(listing.latitude),
        h(listing.longitude),
        h(listing.businessType),
        h(listing.subType),
        h(listing.owner),
        h(listing.source),
        h(listing.localArea),
        #check_box_tag(:checked),
        #check_box_tag('checked?', listing.checked),
        #check_box_tag('collected', listing.menu_collected),
        #check_box_tag('digitized', listing.menu_digitized),
        #check_box_tag('in db?', listing.menu_in_database)
        
        h(listing.keep),
        h(listing.checked),
        h(listing.menu_collected),
        h(listing.menu_digitized),
        h(listing.menu_in_database)
      ]
    end
  end

  def listings
    @listings ||= fetch_listings
  end

  def fetch_listings
    listings = Listing.order("#{sort_column} #{sort_direction}")
    listings = listings.page(page).per_page(per_page)
    if params[:sSearch].present?
      listings = listings.where("name like :search or telephone like :search or address like :search", search: "%#{params[:sSearch]}%")
    end
    listings
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name telephone fax suite address city province postal_code latitude longitude businessType
      subType owner source localArea checked menu_collected menu_digitized menu_in_database keep]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end