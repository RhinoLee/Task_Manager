import Rails from "@rails/ujs"
document.addEventListener('turbolinks:load', function(){

  const searchInput = document.querySelector('.search-input')

  if(searchInput) {
    searchInput.addEventListener("keyup", (e) => {
      e.preventDefault();
      let searchTime = null;
      let title = searchInput.value.trim()

      clearTimeout(searchTime)
      searchTime = setTimeout(function(){
        Rails.ajax({
          url: `/searches/search/?title=${title}`,
          type: 'GET',
          dataType: 'json', 
          error: function(err){
            console.log(err);
          }
        })
      }, 1200)
    })
  }
  

})