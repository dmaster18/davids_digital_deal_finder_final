module ItemsHelper

  def date_conversion(date_array)
    date_array.delete(date_array.last)
    year_month_day = date_array[0].split("-")
    year = year_month_day[0]
    month = year_month_day[1]
    case month
    when "1" || "01"
      month = "January"
    when "2" || "02"
      month = "February"
    when "3" || "03"
      month = "March"
    when "4" || "04"
      month = "April"
    when "5" || "05"
      month = "May"
    when "6" || "06"
      month = "June"
    when "7" || "07"
      month = "July"
    when "8" || "08"
      month = "August"
    when "9" || "09"
      month = "September"
    when "10"
      month = "October"
    when "11"
      month = "November"
    when "12"
      month = "December"
    end
    day = year_month_day[2]
    time = date_array[1].split(":")
    time.delete(time.last)
    hour = time[0]
    minute = time[1]
    am_pm = "AM"
    if hour.to_i > 12
      am_pm = "PM"
      hour = (hour.to_i - 12).to_s
    else
      am_pm = "AM"
    end
    time = "#{hour}:#{minute}#{am_pm}"
    date_time_string = "#{month} #{day}, #{year} at #{time}"
    date_time_string
  end

end
