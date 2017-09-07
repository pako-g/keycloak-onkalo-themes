<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("emailForgotTitle")}
    <#elseif section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <div class="mdl-grid">
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-cell mdl-cell--4-col mdl-cell--12-col-phone">
                <div class="demo-card-wide mdl-card mdl-shadow--2dp mdl-textfield--full-width">
                    <div class="mdl-card__title">
                        <h2 class="mdl-card__title-text">Welcome</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        <div><p>${msg("emailInstruction")}</p></div>
                        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                <input class="mdl-textfield__input" type="text" id="username" name="username" autofocus>
                                <label class="mdl-textfield__label" for="username"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                            </div>
                            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" type="submit" id="kc-submit">
                                ${msg("doSubmit")}
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
    <#--<#elseif section = "info" >
        ${msg("emailInstruction")}-->
    </#if>
</@layout.registrationLayout>
