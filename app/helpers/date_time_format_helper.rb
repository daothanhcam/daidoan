module DateTimeFormatHelper
  include ActionView::Helpers::TranslationHelper

  def time_as_format time
    return "" if time.blank?
      l time, format: :datetime_format
  end

  def human_time_as_format time
    return "" if time.blank?
    l time, format: :human_time_format
  end

  def date_as_format date
    return "" if date.blank?
    l date, format: :simple_date_format
  end

  def full_time_as_format time
    return "" if time.blank?
    l time, format: :full_time_format
  end

  def full_date_as_format date
    return "" if date.blank?
    l date, format: :full_date_format
  end

  def origin_date_as_format date
    return "" if date.blank?
    l date, format: :origin_date_format
  end

  def short_date_as_format date
    return "" if date.blank?
    l date, format: :short_date_format
  end
end
