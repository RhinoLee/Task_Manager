module FormHelper 
  def form_action(task) 
    if task.id.present? 
      '更新任務'
    else
      '新增任務'
    end
  end
end