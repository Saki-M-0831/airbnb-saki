module AccommodationsHelper
  def is_done?(item)
    if !item.nil?
      content_tag :i, nil, class: "fa fa-check-circle"
    end
  end

  def is_ready?(accommo)
    accommo.photos.any? && !accommo.name.nil? && !accommo.price.nil? && !accommo.location.nil?
  end

  def text_slash(has)
    if has == false || has.nil?
      "text-decorate"
    end
  end
end
