module TaskHelper
  def levelToWord(level)
    case level 
    when 0 
      return "低"
    when 1
      return "中"
    when 2 
      return "高"
    end
  end
end