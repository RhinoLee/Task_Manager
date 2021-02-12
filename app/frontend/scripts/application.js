import Rails from "@rails/ujs"
document.addEventListener('turbolinks:load', function(){

  const searchTitle = document.querySelector('.index-table .search-title')
  const searchStatus = document.querySelectorAll('.index-table input[type="radio"]')
  
  if(searchTitle || searchStatus.length > 0) {

    let getData = function(e){
      // e.preventDefault();
      let searchTime = null;
      let title = searchTitle.value.trim()
      let status = '';

      searchStatus.forEach( radio => {
        if (radio.checked) {
          status = radio.value === '全部' ? '' : radio.value
        }
      } )

      clearTimeout(searchTime)
      searchTime = setTimeout(function(){
        Rails.ajax({
          url: `/searches/search/?title=${title}&status=${status}`,
          type: 'GET',
          dataType: 'json', 
          // success: (res) => {
          //   console.log(res);
          // },
          error: function(err){
            console.log(err);
          }
        })
      }, 500)
    }
    searchTitle.addEventListener("keyup", getData)

    searchStatus.forEach( radio => {
      radio.addEventListener('click', getData)
    })
    
  }
  

})