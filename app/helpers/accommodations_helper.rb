module AccommodationsHelper
  def is_done?(item)
    if !item.nil?
      content_tag :i, nil, class: "fa fa-check-circle"
    end
  end
end
