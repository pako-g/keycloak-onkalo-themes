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
