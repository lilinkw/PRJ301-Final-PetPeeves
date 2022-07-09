$(document).ready(function(){
    $(".error").hide();

    //This function is use for check user info
    // Notice: submit button of info form must have id: save-info
    function updateUserInfo() {
        $("#save-info").on("click", function(){
            console.log("updateUserInfo");
            let submit = true;

            let fullname = $("[name=fullname]").val();
            console.log("fullname :" + fullname);
            let birthday = $("[name=birthday]").val();
            let gender = $("[name=gender]").val();
            let location = $("[name=location]").val();

            let fullname_error = $("#fullname-error");
            let birthday_error = $("#birthday-error");
            let gender_error = $("#gender-error");
            let location_error = $("#location-error");

            // Check full name
            if (fullname == null || fullname === ""){
                fullname_error.text("This field can not be empty");
                fullname_error.show();
                console.log("full name is empty");
                submit = false;
            } else {
                fullname_error.hide();
            }
            //check birthday
            if (birthday == null || birthday === ""){
                birthday_error.text("This field can not be empty");
                birthday_error.show();
                console.log("birthday is empty");
                submit = false;
            } else {
                let inputBirthYear =new Date(birthday).getFullYear();
                let currentYear = new Date().getFullYear();
                console.log("Date: " + new Date(birthday));
                if (inputBirthYear > currentYear){
                    console.log("Birth year must be last than or equal to: " + currentYear);
                    birthday_error.text("Birth year must be last than or equal to: " + currentYear);
                    birthday_error.show();
                    submit = false;
                } else{
                    birthday_error.hide();
                }
            }
            //check gender
            if (gender == null || gender === ""){
                gender_error.text("This field can not be empty");
                gender_error.show();
                console.log("gender is empty");
                submit = false;
            } else {
                gender_error.hide();
            }
            //check location
            if (location == null || location === ""){
                location_error.text("This field can not be empty");
                location_error.show();
                console.log("location is empty");
                submit = false;
            } else {
                location_error.hide();
            }

            this.attr("onsubmit", "return " + submit);
            console.log("submit:" +submit);
        });
    }

    //This function is use for check password
    // Notice: submit button of password form must have id: save-password
    function updatePassword() {
        $("#save-password").on("click",function(){
            // Validate password regex
            const re = /(?=.*[A-Z]+)(?=.*[a-z\d]+)(?=.*[A-Za-z\d]{8,16})/;

            // select password
            let old_password = $("[name=old-password]").val();
            console.log("old_password" + old_password);
            let new_password = $("[name=new-password]").val();
            let repeat_password = $("[name=repeat-password]").val();
            let submit = true;

            // error password notification
            let old_password_error = $("#old-password-error");
            let new_password_error = $("#new-password-error");
            let repeat_password_error = $("#repeat-password-error");


            if(old_password == null || old_password === "" ){
                old_password_error.text("This field can not be empty");
                old_password_error.show();
                console.log("Required old password Input");
                submit = false;
            } else{
                old_password_error.hide();
            }
            if(repeat_password == null || repeat_password === ""){
                repeat_password_error.text("This field can not be empty");
                repeat_password_error.show();
                console.log("Required repeat password Input");
                submit = false;
            } else {
                repeat_password_error.hide();
            }
            // Check if input is null
            if(new_password == null || new_password === ""){
                new_password_error.text("This field can not be empty");
                new_password_error.show();
                console.log("Required new password Input");
                submit = false;
            } else {
                // Check if password match re
                if(re.test(new_password)){
                    console.log("Correct format");
                    new_password_error.hide()

                    // won't let user submit when new password is the same as old password
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
                    }
                } else {
                    console.log("Incorrect format");
                    new_password_error.text("Password show have from 8 to 16 characters or numbers, at least 1 uppercase character ");
                    new_password_error.show();
                    submit = false;
                }
            }

            this.attr("onsubmit", "return " +submit);
            console.log("submit: " + submit)
        });
    }

    const updateUserInfoForm = $("#update-user-info-form");
    updateUserInfoForm.on('submit', updateUserInfo());

    const updatePasswordForm = $("#change-password-form");
    updatePasswordForm.on('submit', updatePassword() );

});