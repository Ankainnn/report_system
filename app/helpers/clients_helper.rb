# encoding: utf-8
module ClientsHelper
  def format_subject(obj)
    res = obj.split("EGE")
    if res.count >= 2
     res.delete_if{|x| x.blank?}
     res = res.collect{|x| "ЕГЭ " + x}
     res = res.join(", ")
    else
     obj
    end

  end
end
