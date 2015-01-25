$( document ).ready(function() {
  $('.upvote').on('click', function(event){
    var upVoteData = {id: event.currentTarget.dataset.id}

    debugger
    $.ajax({
      url:'posts/' + upVoteData.id + '/upvote',
      method:'POST',
      data:upVoteData
    }).done(function(response){
      $('#post-points-' + upVoteData.id).html(response)
    })
  })

  // $('.eleven columns').on('click', '.unfollow', function(event){
  //
  //   $.ajax({
  //     url: 'posts/' + idk + '/downvote'
  //     method: 'POST',
  //     data: {id:userId}
  //   }).done(function(response){
  //     $('#post-points').html(response)
  //   })
  // })
});
