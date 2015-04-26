/**
 * This did not work because I have the forms with all the same class names
 * The only solution I can think of is to do a foreach through the form elements and validate each one individually
 * That would waste a ton of resources though :(
 */

$(function(){
	$(".productForm").each(function(){
		$(this).validate({
	        rules: {
	            quantity: {
	            	number: true,
	            	min: 1,
	            	max: 10000
	            }
	        },
	        
	        messages: {
	            quantity: {
	            	number: "Quantity must be a number",
	            	min: "Quantity must be greater than 0",
	            	max: "You have quite the cash flow!"
	            }
	        },
	        errorLabelContainer: ".messageBox",
	        wrapper: "li",
	        invalidHandler: function(event, validator) {
	            // 'this' refers to the form
	            var errors = validator.numberOfInvalids();
	            if (errors) {
	              $("div.messageBox").show();
	            } else {
	            	$("div.messageBox").hide();
	            }
	        },
	        submitHandler: function(form) {
	            form.submit();
	        }
	    });
	});
});
