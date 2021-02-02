// import Rails from "@rails/ujs"
// document.addEventListener('turbolinks:load', function(){

//   const endTimeBtn = document.querySelector('#end_time_btn')
//   const createTimeBtn = document.querySelector('#create_time_btn')
//   const taskTable = document.querySelector('.task-table')
//   if(endTimeBtn) {
//     endTimeBtn.addEventListener('click', function(e){
//       e.preventDefault();
      
//       Rails.ajax({
//         url: '/api/v1/sort_endtime',
//         type: 'POST',
//         dataType: 'json', 
//         success: function(res){
//           if (res.status === 'ok'){
//             const tasks = res.tasks
//             let taskTableHtml = `
            
//             `
            
//           }
//           console.log(res);
//         },
//         error: function(err){
//           console.log(err);
//         }
//       })
//     })
//   }
  

// })