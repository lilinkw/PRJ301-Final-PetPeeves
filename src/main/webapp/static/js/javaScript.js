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
            url: "/PetPeeves_war_exploded/LoadMoreServlet",
            type: "get", //send it through get method
            success: function(response) {
                var a = document.getElementById("content");
                console.log(a.innerHTML);
                a.innerHTML += response;
            },
            data: {
                postShowed: postnum
            },
            error: function(xhr) {
                //Do Something to handle error
            }
        });
    }
