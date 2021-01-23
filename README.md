# README

table: users 
  name: string
  email: string 
  password: string 

table: task_list
  title: string
  position: integer

table: task 
  title: string
  content: text
  start_time: datetime
  end_time: datetime
  level: string 
  status: string 
  category: string
  position: integer