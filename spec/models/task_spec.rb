require 'rails_helper'

RSpec.describe Task, :type => :model do
  let(:task) { Task.new(title: 'Task name', 
                        content: 'Task content',
                        status: "待處理" )}

  context "驗證" do 
    # it "新增任務且通過每個驗證" do
    #   expect(task).to be_valid
    # end 
  
    it "任務名稱未填" do 
      task.title = nil 
      expect(task).to_not be_valid
    end
  
    it "任務內容未填" do 
      task.content = nil
      expect(task).to_not be_valid
    end
  end

  # context "查詢功能" do 
  #   it "使用任務名稱查詢" do 

  #     task_1 = Task.create(title: 'test', content: 'test123', status: '待處理') 
  #     task_2 = Task.create(title: 'hello', content: 'test123', status: '待處理') 
  #     expect(Task.search('test')).to contain_exactly(task_1)
  #     expect(Task.search('hel')).to contain_exactly(task_2)

  #   end

  #   it "使用任務狀態查詢" do 

  #     task_1 = Task.create(title: 'test', content: 'test123', status: '完成') 
  #     task_2 = Task.create(title: 'test', content: 'test123', status: '待處理') 
  #     expect(Task.search('test', '完成')).to contain_exactly(task_1)
  #     expect(Task.search('test', '待處理')).to contain_exactly(task_2)

  #   end
  # end

end