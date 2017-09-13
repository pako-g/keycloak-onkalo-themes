<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("confirmLinkIdpTitle")}
    <#elseif section = "header">
         ${msg("confirmLinkIdpTitle")}
    <#elseif section = "form">

    <div class="mdl-grid">
        <div class="mdl-layout-spacer"></div>
            <div class="mdl-cell mdl-cell--4-col mdl-cell--12-col-phone">
                <div class="demo-card-wide mdl-card mdl-shadow--2dp mdl-textfield--full-width">
                    <div class="mdl-card__title">
                        <h2 class="mdl-card__title-text">Welcome</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        <h5>${msg("confirmLinkIdpTitle")}</h5>
                        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                            <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" name="submitAction" id="updateProfile" value="updateProfile">${msg("confirmLinkIdpReviewProfile")}</button>
                            <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" name="submitAction" id="linkAccount" value="linkAccount">${msg("confirmLinkIdpContinue", idpAlias)}</button>
                        </form>
                    </div>
                </div>
            </div>
        <div class="mdl-layout-spacer"></div>
    </div>
    </#if>
</@layout.registrationLayout>