$( document ).ready(function() {
  $('.upvote').on('click', function(event){
    var upVoteData = {id: event.currentTarget.dataset.id}

    $.ajax({
      url:'posts/' + upVoteData.id + '/upvote',
      method:'POST',
      data:upVoteData
    }).done(function(response){
      $('#post-points-' + upVoteData.id).html(response)
    })
  })

  $('.downvote').on('click', function(event){
    var downVoteData = {id: event.currentTarget.dataset.id}

    $.ajax({
      url:'posts/' + downVoteData.id + '/downvote',
      method:'POST',
      data:downVoteData
    }).done(function(response){
      $('#post-points-' + downVoteData.id).html(response)
    })
  })

});
