<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginTitle",realm.displayName)}
    <#elseif section = "header">
        ${msg("loginTitleHtml",realm.displayNameHtml)}
    <#elseif section = "form">

<#--    <div class="mdl-grid">
        <div class="mdl-layout-spacer"></div>
        <div class="mdl-cell mdl-cell--4-col mdl-cell--12-col-phone">
        <div class="demo-card-wide mdl-card mdl-shadow--2dp mdl-textfield--full-width">-->

        <div class="mdl-card__title">
            <h2 class="mdl-card__title-text">Welcome</h2>
        </div>
        <div class="mdl-card__supporting-text">

            <form id="kc-totp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                        <input class="mdl-textfield__input" id="totp" name="totp" autocomplete="off" type="text"  autofocus />
                        <label class="mdl-textfield__label" for="totp" >${msg("loginTotpOneTime")}</label>
                        <span class="mdl-textfield__error">${msg("loginTotpOneTime")} ${msg("empty")}</span>
                    </div>


                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                            <div class="${properties.kcFormOptionsWrapperClass!}"></div>
                        </div>


                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <div class="${properties.kcFormButtonsWrapperClass!}">
                                <div class="mdl-typography--text-justify">
                                    <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"  type="submit" name="login" id="kc-login">${msg("doLogIn")}</button>
                                    <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"  type="submit"name="cancel" id="kc-cancel">${msg("doCancel")}</button>
                                </div>
                            </div>
                        </div>

                    </div>



                </div>
            </form>

        </div>

    </#if>



<#--<div class="mdl-card__menu">
    <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
        <i class="material-icons">share</i>
    </button>
</div>-->


<#--</div>

</div>
<div class="mdl-layout-spacer"></div>
</div>-->



</@layout.registrationLayout>