<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitleHtml",(realm.displayNameHtml!''))}
    <#elseif section = "form">


    <div class="mdl-grid">
        <div class="mdl-layout-spacer"></div>
        <div class="mdl-cell mdl-cell--4-col mdl-cell--12-col-phone">
            <div class="demo-card-wide mdl-card mdl-shadow--2dp mdl-textfield--full-width">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Welcome</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
                        <input type="text" readonly value="this is not a login form" style="display: none;">
                        <input type="password" readonly value="this is not a login form" style="display: none;">

                        <#if !realm.registrationEmailAsUsername>
                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="text" id="username" value="${(register.formData.username!'')?html}" name="username"  autofocus>
                                    <label class="mdl-textfield__label" for="username">${msg("username")}</label>
                                    <span class="mdl-textfield__error">${msg("username")} ${msg("empty")}</span>
                                </div>
                            </div>
                        </#if>
                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <#if !realm.registrationEmailAsUsername>
                                        <input class="mdl-textfield__input" type="text" id="firstName" name="firstName" value="${(register.formData.firstName!'')?html}">
                                    <#else >
                                        <input class="mdl-textfield__input" type="text" id="firstName" value="${(register.formData.firstName!'')?html}" name="firstName"  autofocus>
                                    </#if>
                                    <label class="mdl-textfield__label" for="firstName">${msg("firstName")}</label>
                                    <span class="mdl-textfield__error">${msg("firstName")} ${msg("empty")}</span>
                                </div>
                            </div>
                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="text" id="lastName" name="lastName" value="${(register.formData.lastName!'')?html}">
                                    <label class="mdl-textfield__label" for="lastName">${msg("lastName")}</label>
                                    <span class="mdl-textfield__error">${msg("lastName")} ${msg("empty")}</span>
                                </div>
                            </div>
                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="text" id="email" name="email" value="${(register.formData.email!'')?html}">
                                    <label class="mdl-textfield__label" for="email">${msg("email")}</label>
                                    <span class="mdl-textfield__error">${msg("email")} ${msg("empty")}</span>
                                </div>
                            </div>
                        <#if passwordRequired>
                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="password" id="password" name="password">
                                    <button class="mdl-button mdl-js-button mdl-button--icon show-password" id="kc-password-show" type="button" onclick="return false;">
                                        <i class="material-icons">visibility</i>
                                    </button>
                                    <label class="mdl-textfield__label" for="password">${msg("password")}</label>
                                    <span class="mdl-textfield__error">${msg("password")} ${msg("empty")}</span>
                                </div>
                            </div>
                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="password" id="password-confirm" name="password-confirm">
                                    <label class="mdl-textfield__label" for="password-confirm">${msg("passwordConfirm")}</label>
                                    <span class="mdl-textfield__error" id="error-confirm">${msg("passwordConfirm")} ${msg("empty")}</span>
                                </div>
                            </div>
                        </#if>
                        <#if recaptchaRequired??>
                            <div class="form-group">
                                <div class="${properties.kcInputWrapperClass!}">
                                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                                </div>
                            </div>
                        </#if>
                            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" type="submit" value="${msg("doRegister")}" id="kc-register">
                                    ${msg("doRegister")}
                                </button>
                            </div>
                    </form>
                    <script>
                        $(function () {
                            var registerButton = document.querySelector('#kc-register');
                            var usernameFlag="${realm.registrationEmailAsUsername?c}";
                            var passwordFlag="${passwordRequired?c}";
                            var username = $("#username");
                            var firstName = $("#firstName");
                            var lastName = $("#lastName");
                            var email = $("#email");
                            var password = $("#password");
                            var passwordConfirm = $("#password-confirm");
                            var btnPasswordShow = document.querySelector("#kc-password-show");
                            var errorConfirm= $("#error-confirm");

                            btnPasswordShow.addEventListener('mousedown', function () {
                                'use strict';
                                password.attr("type", "text");

                            });
                            btnPasswordShow.addEventListener('mouseup', function () {
                                'use strict';
                                password.attr("type", "password");
                            });


                            registerButton.addEventListener('click', function() {
                                'use strict';
                                if(usernameFlag === 'false')
                                    addValidation(username);

                                addValidation(firstName);
                                addValidation(lastName);
                                addValidation(email);
                                if(passwordFlag){
                                    addValidation(password);
                                    addValidation(passwordConfirm);
                                }
                            });

                            if(usernameFlag === 'false'){
                                username[0].addEventListener('focusout', function() {
                                    'use strict';
                                    addValidation(username);
                                });
                            }


                            firstName[0].addEventListener('focusout', function() {
                                'use strict';
                                addValidation(firstName);
                            });
                            lastName[0].addEventListener('focusout', function() {
                                'use strict';
                                addValidation(lastName);
                            });
                            email[0].addEventListener('focusout', function() {
                                'use strict';
                                addValidation(email);
                            });

                            if(passwordFlag === 'true'){
                                password[0].addEventListener('focusout', function() {
                                    'use strict';
                                    addValidation(password);
                                });

                                passwordConfirm[0].addEventListener('focusout', function() {
                                    'use strict';
                                    addValidation(passwordConfirm);

                                    if( password.val() !== undefined && passwordConfirm.val() !== undefined &&
                                            passwordConfirm.val().length > 1 && password.val().length > 1 ){
                                        if(password.val() !== passwordConfirm.val() && passwordConfirm.val().length > 0 ){
                                            errorConfirm[0].innerText = document.createTextNode("Password not equals").textContent;
                                            passwordConfirm.parent().addClass('is-invalid');
                                        }

                                    }
                                    else if(passwordConfirm.val() === undefined && password.val() !== undefined ||
                                            passwordConfirm.val().length < 1 && password.val().length > 0){
                                        errorConfirm[0].innerText = document.createTextNode("Input must not be empty").textContent;
                                        passwordConfirm.parent().addClass('is-invalid');
                                    }

                                });
                            }

                        });
                    </script>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <span><a href="${url.loginUrl}">${msg("backToLogin")}</a></span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="mdl-layout-spacer"></div>
    </div>
    </#if>
</@layout.registrationLayout>