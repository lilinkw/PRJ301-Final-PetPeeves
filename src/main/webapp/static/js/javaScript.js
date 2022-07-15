    function loadFileEdit(event,id) {
    var image = document.getElementById('img-'+id);
    image.src = URL.createObjectURL(event.target.files[0]);
    };

    function loadFileNewPost(event) {
    var image = document.getElementById('output-newpost');
    image.src = URL.createObjectURL(event.target.files[0]);
    };

    function loadFile(event) {
       var image = document.getElementById('output');
       image.src = URL.createObjectURL(event.target.files[0]);
    };

    function loadMorePost(){
        var postnum = document.getElementsByClassName("posty").length;
        $.ajax({
            url: "LoadMoreServlet",
            type: "get", //send it through get method
            success: function(response) {
                var a = document.getElementById("content");
                console.log(response);
                a.innerHTML += response;

                // Update post Time
                let listPostTime = document.getElementsByClassName("postTime");;
                for (var i = postnum; i < postnum+5; i++) {
                    let diffTime = moment(listPostTime[i].text, "YYYY-MM-DD HH:m:s").fromNow();
                    listPostTime[i].innerHTML = diffTime;
                }
            },
            data: {
                postShowed: postnum
            },
            error: function(xhr) {
                //Do Something to handle error
            },
            dataType: "html",
        });

    }

// $(document).ready(function(){
//     $(window).on('scroll', function() {
//         let reachedBottom = $(window).scrollTop() + $(window).height() > $(document).height() * 0.9;
//
//         if (reachedBottom) {
//             loadMorePost();
//         }
//     });
// });
