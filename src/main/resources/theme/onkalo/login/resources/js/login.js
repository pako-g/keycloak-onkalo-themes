$(function () {
    'use strict';

    //var btnLogin = document.querySelector('#kc-login'); //return null if not exist
    //var submitButton = document.querySelector('#kc-submit');

    var btnLogin = $("#kc-login");
    var btnSubmit = $("#kc-submit");
    var btnRegister = $("#kc-register");


    var username = $("#username"); //return undefined if not exist
    var password = $("#password");

    var firstName = $("#firstName");
    var lastName = $("#lastName");
    var email = $("#email");
    var passwordConfirm = $("#password-confirm");


    var btnFields = [ btnLogin, btnSubmit, btnRegister ];
    var textFields = [ username, password, firstName, lastName, email, passwordConfirm];

    btnEventListener(btnFields, textFields);

    /*if(btnLogin[0] !== undefined){
        btnLogin[0].addEventListener('click', function() {
            'use strict';
            addValidation(username);
            addValidation(password);
        });
    }*/


    /*if(submitButton[0] !== undefined){
        submitButton[0].addEventListener('click', function() {
            'use strict';
            addValidation(username);
        });
    }*/


    if(username[0] !== undefined){
        username[0].addEventListener('focusout', function() {
            'use strict';
            addValidation(username);
        });
    }

    if (password[0] !== undefined){
        password[0].addEventListener('focusout', function() {
            'use strict';
            addValidation(password);
        });
    }

});


function btnEventListener (btnFields, textFields) {
    btnFields.forEach(function(btn){
        if( btn[0]!== undefined ){
            btn[0].addEventListener('click', function () {
                textFields.forEach(function (textField) {
                    if( textField[0] !== undefined){
                        addValidation(textField);
                    }
                });
            });
        }
    });


}



function addSnackbar(string) {
    var snackbarContainer = document.querySelector('#demo-toast-example');
    var data = { message: string, timeout: 2000 };
    snackbarContainer.MaterialSnackbar.showSnackbar(data);
}

function addValidation(element){
    if(element.val() === undefined || element.val().length < 1){
        element[0].setAttribute("required", "true");
        element.parent().addClass('is-invalid');
    }
}
function colorSnackbar(element, messageType){
    if( messageType === "success" ){
        element.style.backgroundColor = '#18BA30';
    }
    if( messageType === "warning" ){
        element.style.backgroundColor = '#F7FF02';
    }
    if( messageType === "error" ){
        element.style.backgroundColor = '#DD1313';
    }
    if( messageType === "info" ){
        element.style.backgroundColor = '#0281FF';
    }
}

