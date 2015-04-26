/**
 * 
 */
$(function(){

    $("#register").validate({
        rules: {
            fName: "required",
            lName: "required",
            address: "required",
            state: "required",
            zipcode: "required",
            uName: {
            	required: true,
            	minlength: 8
            },
            password: {
                required: true,
                minlength: 6
            }
        },
        
        messages: {
            fName: "Please enter your first name",
            lName: "Please enter your last name",
            address: "Please enter your street",
            state: "Please enter your state",
            zipcode: "Please enter your zipcode",
            uName: {
            	required: "Please enter a username",
            	minlength: "Username must be at least 8 characters"
            },
            password: {
                required: "Please choose a password",
                minlength: "Password must be at least 6 characters"
            }
        },
        
        submitHandler: function(form) {
            form.submit();
        }
    });
});


