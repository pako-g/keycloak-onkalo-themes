$(function () {
    'use strict';

    var btnLogin = $("#kc-login");
    var btnSubmit = $("#kc-submit");
    var btnRegister = $("#kc-register");
    var btnPasswordShow = $("#kc-password-show");
    var btnCancel = $("#kc-cancel");

    var username = $("#username"); //return undefined if not exist
    var password = $("#password");
    var firstName = $("#firstName");
    var lastName = $("#lastName");
    var email = $("#email");
    var passwordConfirm = $("#password-confirm");
    var passwordNew = $("#password-new");
    var totp = $("#totp");

    var errorConfirm= $("#error-confirm");

    if(btnCancel[0] !== undefined)
        console.log(btnCancel[0].id);

    var btnFields = [ btnLogin, btnSubmit, btnRegister, btnCancel ];
    var textFields = [ username, password, firstName, lastName, email, passwordConfirm, passwordNew, totp];

    btnEventListener(btnFields, textFields);
    textEventListener(textFields, errorConfirm);





    if(btnPasswordShow[0] !== undefined){
        btnPasswordShow[0].addEventListener('mousedown', function () {
            'use strict';
            password.attr("type", "text");

        });
        btnPasswordShow[0].addEventListener('mouseup', function () {
            'use strict';
            password.attr("type", "password");
        });
    }

});


function textEventListener(textFields, errorConfirm) {
    var password;
    textFields.forEach(function (field) {
       if( field[0] !== undefined ){

           if(field[0].id === 'password' || field[0].id === 'password-new')
               password=field;

           field[0].addEventListener('focusout', function () {
               addValidation(field);
               if(field[0].id === 'password-confirm' ){

                   if( password.val() !== undefined && field.val() !== undefined &&
                       field.val().length > 1 && password.val().length > 1 ){
                       if(password.val() !== field.val() && field.val().length > 0 ){
                           errorConfirm[0].innerText = document.createTextNode("Password not equals").textContent;
                           field.parent().addClass('is-invalid');
                       }
                   }
                   else if(field.val() === undefined && password.val() !== undefined ||
                       field.val().length < 1 && password.val().length > 0){
                       errorConfirm[0].innerText = document.createTextNode("Input must not be empty").textContent;
                       field.parent().addClass('is-invalid');
                   }
               }
           });
       }
    });
}

function btnEventListener (btnFields, textFields) {
    btnFields.forEach(function(btn){
        if( btn[0]!== undefined ){
            if( btn[0].id !== 'kc-cancel'){
                btn[0].addEventListener('click', function () {
                    textFields.forEach(function (textField) {
                        if( textField[0] !== undefined){
                            addValidation(textField);
                        }
                    });
                });
            }
            else if (btn[0].id === 'kc-cancel'){
                btn[0].addEventListener('click', function () {
                    $("#totp").removeAttr('required');
                    $("#totp").removeClass('is-invalid');
                });
            }

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

