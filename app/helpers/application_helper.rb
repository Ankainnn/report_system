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

end
