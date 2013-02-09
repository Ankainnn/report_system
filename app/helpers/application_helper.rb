# -*- encoding : utf-8 -*-
module ApplicationHelper
  def range_format(range)
    res=[]
    range.each do |i|
      if i < 10
        res<<"0"+"#{i}"
      else
        res<<i
      end
    end
    res
  end

  def user_role
    User.find(current_user).role
  end

  def formating_month(date)
    if date.present?
    count = date.to_s.split(" ").count
    month_hash={ "01" => "янв","02" => "фев", "03" => "мар",
                 "04" => "апр", "05" => "май", "06" => "июн",
                 "07" => "июл", "08" =>"авг", "09" =>"сен",
                 "10" => "окт", "11" => "ноя", "12" => "дек"}
    if count == 1
    date =  date.to_s.split(" ")[0].split("-")
    result ="#{date[0]}-#{month_hash[date[1]]}-#{date[2]}"
    else
    date =  date.to_s.split(" ")[0].split("-")
     result = "#{date[2]}-#{month_hash[date[1]]}-#{date[0]}"
    end
    return result
    end
  end

end
