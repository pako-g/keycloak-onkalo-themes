<#import "template.ftl" as layout>

<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginTitleHtml",(realm.displayNameHtml!''))}
    <#elseif section = "form">
        <#if realm.password>

        <div class="mdl-grid">
            <div class="mdl-layout-spacer"></div>

            <div class="mdl-cell mdl-cell--4-col">

                <div class="demo-card-wide mdl-card mdl-shadow--2dp mdl-textfield--full-width" ">
                    <div class="mdl-card__title">
                        <h2 class="mdl-card__title-text">Welcome</h2>
                    </div>
                    <div class="mdl-card__supporting-text">

                        <form id="kc-form-login" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                            <div class="${properties.kcInputWrapperClass!}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                <#if usernameEditDisabled??>
                                    <input class="mdl-textfield__input" type="text" id="username" name="username" value="${(login.username!'')?html}" disabled >
                                <#else>
                                    <input class="mdl-textfield__input" type="text" id="username" name="username" value="${(login.username!'')?html}" autofocus autocomplete="off">
                                </#if>
                                    <label class="mdl-textfield__label" for="username">
                                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                                    </label>
                                </div>



                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" type="password" id="password" name="password" autocomplete="off">
                                    <label class="mdl-textfield__label" for="password">${msg("password")}</label>
                                </div>

                                <#if realm.rememberMe && !usernameEditDisabled??>
                                    <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="rememberMe">
                                        <#if login.rememberMe??>
                                            <input type="checkbox" id="rememberMe" class="mdl-switch__input" name="rememberMe" tabindex="3" checked>
                                            <#--<input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked> ${msg("rememberMe")}-->
                                        <#else>
                                            <input type="checkbox" id="rememberMe" class="mdl-switch__input" name="rememberMe" tabindex="3">
                                            <#--<input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"> ${msg("rememberMe")}-->
                                        </#if>
                                        <span class="mdl-switch__label">${msg("rememberMe")}</span>
                                    </label>
                                </#if>


                                <!-- Accent-colored raised button with ripple -->
                                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                    <div class="${properties.kcFormButtonsWrapperClass!}">
                                    <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"  type="submit" name="login" id="kc-login">
                                        ${msg("doLogIn")}
                                    </button>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
                        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                            <div id="kc-registration">
                                <span>${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                            </div>
                        </#if>
                    </div>
                    </#if>
                    <#elseif section = "info" >
                        <div class="mdl-card__actions mdl-card--border">
                        <#if realm.password && social.providers??>
                            <div id="kc-social-providers">
                                <ul>
                                    <#list social.providers as p>
                                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.displayName}</span></a></li>
                                    </#list>
                                </ul>
                            </div>
                        </#if>
                        </div>
                    </#if>


                <#--<div class="mdl-card__menu">
                    <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
                        <i class="material-icons">share</i>
                    </button>
                </div>-->
                </div>

            </div>
            <div class="mdl-layout-spacer"></div>
        </div>

</@layout.registrationLayout>
