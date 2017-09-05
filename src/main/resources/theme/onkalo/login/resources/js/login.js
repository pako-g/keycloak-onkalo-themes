function addSnackbar(string) {
    var snackbarContainer = document.querySelector('#demo-toast-example');
    var data = { message: string, timeout: 2000 };
    snackbarContainer.MaterialSnackbar.showSnackbar(data);
}