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
        h(listing.checked),
        h(listing.menu_state),
        h(listing.menu_collected),
        h(listing.menu_digitized),
        h(listing.menu_in_database),
        h(listing.keep),
        h(listing.menu_source),
        h(listing.get_menu_from_website),
        h(listing.notes),
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
        h(listing.business_type),
        h(listing.sub_type),
        h(listing.owner),
        h(listing.local_area)
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
      listings = listings.where("name like :search or 
        telephone like :search or address like :search", search: "%#{params[:sSearch]}%")
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
    columns = %w[checked menu_state menu_collected menu_digitized menu_in_database keep menu_source get_menu_from_website notes id name 
      telephone fax suite address city province postal_code latitude longitude business_type sub_type owner local_area ]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end