<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitleHtml",(realm.displayNameHtml!''))}
    <#elseif section = "form">
    <div class="mdl-grid">
        <div class="mdl-layout-spacer"></div>
        <div class="mdl-cell mdl-cell--4-col">
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
                                    <input class="mdl-textfield__input" type="text" id="username" name="username" value="${(register.formData.username!'')?html}">
                                    <label class="mdl-textfield__label" for="username">${msg("username")}</label>
                                </div>
                            </div>
                        </#if>
                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="text" id="firstName" name="firstName" value="${(register.formData.firstName!'')?html}">
                                    <label class="mdl-textfield__label" for="firstName">${msg("username")}</label>
                                </div>
                            </div>
                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="text" id="lastName" name="lastName" value="${(register.formData.lastName!'')?html}">
                                    <label class="mdl-textfield__label" for="lastName">${msg("lastName")}</label>
                                </div>
                            </div>
                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="text" id="email" name="email" value="${(register.formData.email!'')?html}">
                                    <label class="mdl-textfield__label" for="email">${msg("email")}</label>
                                </div>
                            </div>
                        <#if passwordRequired>
                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="password" id="password" name="password">
                                    <label class="mdl-textfield__label" for="password">${msg("password")}</label>
                                </div>
                            </div>
                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="password" id="password-confirm" name="password-confirm">
                                    <label class="mdl-textfield__label" for="password-confirm">${msg("passwordConfirm")}</label>
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
                                <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" type="submit" value="${msg("doRegister")}">
                                    ${msg("doRegister")}
                                </button>
                            </div>
                    </form>
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