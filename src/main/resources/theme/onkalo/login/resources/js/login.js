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