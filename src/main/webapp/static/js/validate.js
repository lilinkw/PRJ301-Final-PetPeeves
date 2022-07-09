$(document).ready(function(){
    $(".error").hide();

    const element = document.querySelector('form');
    element.addEventListener('submit', updatePassword() );

    //This function is use for check password
    // Notice: submit button must have id: save
    function updatePassword() {
        $("#save").click(function(){
            // Validate password regex
            const re = /(?=.*[A-Z]+)(?=.*[a-z\d]+)(?=.*[A-Za-z\d]{8,16})/;

            // select password
            let old_password = $("[name=old-password]").val();
            let new_password = $("[name=new-password]").val();
            let repeat_password = $("[name=repeat-password]").val();
            let submit = true;

            // error password notification
            let old_password_error = $("#old-password-error");
            let new_password_error = $("#new-password-error");
            let repeat_password_error = $("#repeat-password-error");


            if(old_password == null || old_password == "" ){
                old_password_error.text("This field can not be empty");
                old_password_error.show();
                console.log("Required old password Input");
                submit = false;
            } else{
                old_password_error.hide();
            }
            if(repeat_password == null || repeat_password == ""){
                repeat_password_error.text("This field can not be empty");
                repeat_password_error.show();
                console.log("Required repeat password Input");
                submit = false;
            } else {
                repeat_password_error.hide();
            }
            // Check if input is null
            if(new_password == null || new_password == ""){
                new_password_error.text("This field can not be empty");
                new_password_error.show();
                console.log("Required new password Input");
                submit = false;
            } else {
                // Check if password match re
                if(re.test(new_password)){
                    console.log("Correct format");
                    new_password_error.hide()

                    // wont let user submit when new password is the same as old password
                    if(new_password === old_password){
                        console.log("old password == new password");
                        new_password_error.text("The new password is the same as the old password");
                        new_password_error.show();
                        submit = false;
                    }

                    if(new_password === repeat_password){
                        console.log("repeat password == new password");
                        repeat_password_error.hide();
                    }
                    else {
                        console.log("repeat password != new password");
                        repeat_password_error.text("Repeat password is unmatched with new password");
                        repeat_password_error.show();
                        submit = false;
                    };
                } else {
                    console.log("Incorrect format");
                    new_password_error.text("Password show have from 8 to 16 characters or numbers, at least 1 uppercase character ");
                    new_password_error.show();
                    submit = false;
                };
            };

            $("#change-password-form").attr("onsubmit", "return " +submit);
            console.log("submit: " + submit)
        });
    }


});