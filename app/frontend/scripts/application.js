import Rails from "@rails/ujs"
import axios from 'axios'
document.addEventListener('turbolinks:load', function(){

  const searchForm = document.querySelector('.table-action .search-form')
  const searchTitle = document.querySelector('.table-action .search-title')
  const searchStatus = document.querySelectorAll('.table-action input[type="radio"]')
  const sortBtns = document.querySelectorAll('.sort-btn')
  const tasksTable =  document.querySelector('.tasks-table .row')
  let sortType = null
  
  if(searchTitle || searchStatus.length > 0) {
    let tasks = []
    const getTasks = function(e){

      let searchTime = null;
      let title = searchTitle.value.trim()
      let status = '';
      searchStatus.forEach( radio => {
        if (radio.checked) {
          status = radio.value === '全部' ? '' : radio.value
        }
      })

      clearTimeout(searchTime)
      searchTime = setTimeout(function(){
        axios({
          method: 'get', 
          url: `/tasks/filter?title=${title}&status=${status}&sort=${sortType}`,
        })
        .then(res => {
          tasks = res.data.tasks
          renderTask()
        })
        .catch(err => err)
      }, 500)
      
    }

    const renderTask = function(){

      const tasksHtml = tasks.map(task => {
        return `
        <div class="col-3">
          <div class="task" data-title="${task.title}" data-status="${task.status}">
            <a href="/tasks/${task.id}">
              <h3 class="title">${task.title}</h3>
              <h4>
                <span>狀態：</span>
                <span>${task.status}</span>
              </h4>
              <h4>
                <span>優先順序：</span>
                <span>${task.level}</span>
              </h4>
              <ul>
                <li>任務內容：${task.content}</li>
                <li>結束時間：${task.end_time}</li>
              </ul>
            </a>
          </div>
      </div>
      `
      }).join('')

      tasksTable.innerHTML = tasksHtml

    }



    searchTitle.addEventListener("keyup", getTasks)
    searchForm.addEventListener("submit", function(e){
      e.preventDefault();
      getTasks()
    })

    searchStatus.forEach( radio => {
      radio.addEventListener('click', getTasks)
    })

    sortBtns.forEach( btn => {
      btn.addEventListener('click', function(e){
        e.preventDefault()
        sortType = this.dataset.action
        getTasks()
      })
    })

  }
  

})












// searchTime = setTimeout(function(){
//   Rails.ajax({
//     url: `/tasks/?title=${title}&status=${status}`,
//     type: 'GET',
//     dataType: 'json', 
//     success: (res) => {
//       console.log(res);
//     },
//     error: function(err){
//       console.log(err);
//     }
//   })
// }, 500)