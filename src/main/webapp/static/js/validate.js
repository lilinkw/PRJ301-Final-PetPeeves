$(document).ready(function(){
    $(".error").hide();

    // Validate password regex
    const rePassword = /(?=.*[A-Z]+)(?=.*[a-z\d]+)(?=.*[A-Za-z\d]{8,16})/;

    const signInForm = $("#sign-in-form");
    signInForm.submit(function (event) {
        let submit = true;
        // input username
        let username = $("[name=username]").val();
        // input password
        let password = $("[name=password]").val();

        // Get error notification
        let username_error = $("#username-error");
        let password_error = $("#password-error");

        // Check input username
        if (username == null || username === '') {
            username_error.text("This field can not be empty");
            username_error.show();
            console.log("username is empty");
            submit = false;
        } else {
            username_error.hide();
        }

        // check input password
        if (password == null || password === '') {
            password_error.text("This field can not be empty");
            password_error.show();
            console.log("password is empty");
            submit = false;
        } else {
            password_error.hide();
        }

        if (!submit){
            event.preventDefault();
        }
        signInForm.attr("onsubmit", "return " + submit);
        console.log("submit: " + submit);
    });

    const signUpForm = $("#sign-up-form");
    signUpForm.submit(function (event){
        let submit = true;
        // input username
        let usernameSU = $("[name=usernameSU]").val();
        // input password
        let passwordSU = $("[name=passwordSU]").val();
        let repeat_passwordSU = $("[name=repeat-passwordSU]").val();
        let fullnameSU = $("[name=fullnameSU]").val();
        let genderSU = $("[name=genderSU]").val();
        let birthdaySU = $("[name=birthdaySU]").val();
        let locationSU = $("[name=locationSU]").val();

        // Get error notification
        let usernameSU_error = $("#usernameSU-error");
        let passwordSU_error = $("#passwordSU-error");
        let repeat_passwordSU_error = $("#repeat-passwordSU-error");
        let fullnameSU_error = $("#fullnameSU-error");
        let genderSU_error = $("#genderSU-error");
        let birthdaySU_error = $("#birthdaySU-error");
        let locationSU_error = $("#locationSU-error");

        // Check input username
        if (usernameSU == null || usernameSU === '') {
            usernameSU_error.text("This field can not be empty");
            usernameSU_error.show();
            console.log("Sign up username is empty");
            submit = false;
        } else {
            usernameSU_error.hide();
        }

        // check on repeat password
        if (repeat_passwordSU == null || repeat_passwordSU === '') {
            repeat_passwordSU_error.text("This field can not be empty");
            repeat_passwordSU_error.show();
            console.log("Sign Up repeat password is empty");
            submit = false;
        } else {
            repeat_passwordSU_error.hide();
        }

        // check input password
        if (passwordSU == null || passwordSU === '') {
            passwordSU_error.text("This field can not be empty");
            passwordSU_error.show();
            console.log("Sign Up password is empty");
            submit = false;
        } else {
            // Check if password match regex
            if(rePassword.test(passwordSU)){
                console.log("Correct format");
                passwordSU_error.hide()

                // Check on repeat password
                if(passwordSU === repeat_passwordSU){
                    console.log("repeat password == new password");
                    repeat_passwordSU_error.hide();
                }
                else {
                    console.log("repeat password != new password");
                    repeat_passwordSU_error.text("Repeat password is unmatched with new password");
                    repeat_passwordSU_error.show();
                    submit = false;
                }

            } else {
                console.log("Incorrect format");
                passwordSU_error.text("Password show have from 8 to 16 characters or numbers, at least 1 uppercase character ");
                passwordSU_error.show();
                submit = false;
            }
        }


        if (fullnameSU == null || fullnameSU === '') {
            fullnameSU_error.text("This field can not be empty");
            fullnameSU_error.show();
            console.log("Sign Up full name is empty");
            submit = false;
        } else {
            fullnameSU_error.hide();
        }

        // Check on gender
        if (genderSU == null || genderSU === '') {
            genderSU_error.text("This field can not be empty");
            genderSU_error.show();
            console.log("Sign Up gender is empty");
            submit = false;
        } else {
            genderSU_error.hide();
        }

        //check on birthday
        if (birthdaySU == null || birthdaySU === '') {
            birthdaySU_error.text("This field can not be empty");
            birthdaySU_error.show();
            console.log("Sign Up birthday is empty");
            submit = false;
        } else {
            birthdaySU_error.hide();
        }

        //check on location
        if (locationSU == null || locationSU === '') {
            locationSU_error.text("This field can not be empty");
            locationSU_error.show();
            console.log("Sign Up location is empty");
            submit = false;
        } else {
            locationSU_error.hide();
        }

        signUpForm.attr("onsubmit", "return " + submit);
        if (!submit){
            event.preventDefault();
        }
        console.log("submit: " + submit);
    });

    const updateUserInfoForm = $("#update-user-info-form");
    updateUserInfoForm.submit(function (event) {
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

        if (!submit){
            event.preventDefault();
        }
        updateUserInfoForm.attr("onsubmit", "return " + submit);
        console.log("submit:" +submit);
    });

    const updatePasswordForm = $("#change-password-form");
    updatePasswordForm.submit(function (event) {

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
        //check on repeat password
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
            // Check if password match rePassword
            if(rePassword.test(new_password)){
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

        if (!submit){
            event.preventDefault();
        }
        updatePasswordForm.attr("onsubmit", "return " +submit);
        console.log("submit: " + submit)
    })

});