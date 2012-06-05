class ProductsDatatable
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
        link_to(listing.name, listing),
        listing.telephone,
        listing.fax,
        listing.suite,
        listing.address,
        listing.city,
        listing.province,
        listing.postal_code,
        listing.latitude,
        listing.longitude,
        listing.businessType,
        listing.subType,
        listing.owner,
        listing.source,
        listing.localArea,
        listing.keep,
        listing.checked,
        listing.menu_collected,
        listing.menu_digitized,
        listing.menu_in_database
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