require 'rails_helper'

RSpec.describe Task, :type => :model do
  let(:task) { Task.new(title: 'Task name', 
                        content: 'Task content') }

  it "新增任務且通過每個驗證" do
    expect(task).to be_valid
  end 

  it "任務名稱未填" do 
    task.title = nil 
    expect(task).to_not be_valid
  end

  it "任務內容未填" do 
    task.content = nil
    expect(task).to_not be_valid
  end

end