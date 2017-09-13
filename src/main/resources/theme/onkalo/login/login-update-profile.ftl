<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginProfileTitle")}
    <#elseif section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
        <div class="mdl-grid">
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-cell mdl-cell--4-col mdl-cell--12-col-phone">
                <div class="demo-card-wide mdl-card mdl-shadow--2dp mdl-textfield--full-width">
                    <div class="mdl-card__title">
                        <h2 class="mdl-card__title-text">Welcome</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                            <#if user.editUsernameAllowed>
                                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                        <input class="mdl-textfield__input" type="text" id="username" value="${(user.username!'')?html}" name="username"  autofocus>
                                        <label class="mdl-textfield__label" for="username">${msg("username")}</label>
                                        <span class="mdl-textfield__error">${msg("username")} ${msg("empty")}</span>
                                    </div>
                                </div>
                            </#if>
                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <#if !user.editUsernameAllowed>
                                        <input class="mdl-textfield__input" type="text" id="email" name="email" value="${(user.email!'')?html}">
                                     <#else>
                                         <input class="mdl-textfield__input" type="text" id="email" name="email" value="${(user.email!'')?html}" autofocus>
                                     </#if>
                                    <label class="mdl-textfield__label" for="email">${msg("email")}</label>
                                    <span class="mdl-textfield__error">${msg("email")} ${msg("empty")}</span>
                                </div>
                            </div>

                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="text" id="firstName" name="firstName" value="${(user.firstName!'')?html}">
                                    <label class="mdl-textfield__label" for="firstName">${msg("firstName")}</label>
                                    <span class="mdl-textfield__error">${msg("firstName")} ${msg("empty")}</span>
                                </div>
                            </div>

                            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="text" id="lastName" name="lastName" value="${(user.lastName!'')?html}">
                                    <label class="mdl-textfield__label" for="lastName">${msg("lastName")}</label>
                                    <span class="mdl-textfield__error">${msg("lastName")} ${msg("empty")}</span>
                                </div>
                            </div>

                            <div class="${properties.kcFormGroupClass!}">
                                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                                    <div class="${properties.kcFormOptionsWrapperClass!}">
                                    </div>
                                </div>

                                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                    <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" type="submit" value="${msg("doSubmit")}" id="kc-submit">
                                    ${msg("doSubmit")}
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="mdl-layout-spacer"></div>
        </div>
    </#if>
</@layout.registrationLayout>