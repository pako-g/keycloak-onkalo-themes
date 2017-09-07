$(function () {
    'use strict';

    //var btnLogin = document.querySelector('#kc-login'); //return null if not exist
    //var submitButton = document.querySelector('#kc-submit');

    var btnLogin = $("#kc-login");
    var submitButton = $("#kc-submit");

    var username = $("#username"); //return undefined if not exist
    var password = $("#password");

    var loginField = [ username, password];
    var resetField = [ username];

    //console.log(btnLogin[0]);

    if(btnLogin[0] !== undefined){
        btnLogin[0].addEventListener('click', function() {
            'use strict';
            addValidation(username);
            addValidation(password);
        });
    }


    if(submitButton[0] !== undefined){
        submitButton[0].addEventListener('click', function() {
            'use strict';
            addValidation(username);
        });
    }


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


function btnEventListner (btnElement, arrayField) {
    if(btnElement !== null){
        btnElement.addEventListener('click', function () {
            arrayField.forEach(function (t) {
                console.log(t);
            })
        });
    }

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
