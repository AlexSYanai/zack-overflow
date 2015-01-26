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

  $('.comment-upvote').on('click', function(event){
    var upVoteData = {post_id: event.currentTarget.dataset.post, id: event.currentTarget.dataset.id}

    $.ajax({
      url: upVoteData.post_id + '/comments/' + upVoteData.id + '/upvote',
      method:'POST',
      data:upVoteData
    }).done(function(response){
      $('#comment-points-' + upVoteData.id).html(response)
    })
  })

  $('.comment-downvote').on('click', function(event){
    var downVoteData = {post_id: event.currentTarget.dataset.post, id: event.currentTarget.dataset.id}

    $.ajax({
      url: downVoteData.post_id + '/comments/' + downVoteData.id + '/downvote',
      method:'POST',
      data:downVoteData
    }).done(function(response){
      $('#comment-points-' + downVoteData.id).html(response)
    })
  })

});
