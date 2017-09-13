<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("emailLinkIdpTitle", idpAlias)}
    <#elseif section = "header">
        ${msg("emailLinkIdpTitle", idpAlias)}
    <#elseif section = "form">

    <div class="mdl-grid">
        <div class="mdl-layout-spacer"></div>
        <div class="mdl-cell mdl-cell--4-col mdl-cell--12-col-phone">
            <div class="demo-card-wide mdl-card mdl-shadow--2dp mdl-textfield--full-width">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Welcome</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <p id="instruction1" class="instruction">
                    ${msg("emailLinkIdp1", idpAlias, brokerContext.username, realm.displayName)}
                    </p>
                    <p id="instruction2" class="instruction">
                    ${msg("emailLinkIdp2")} <a href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailLinkIdp3")}
                    </p>
                    <p id="instruction3" class="instruction">
                    ${msg("emailLinkIdp4")} <a href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailLinkIdp5")}
                    </p>
                </div>
            </div>
        </div>
        <div class="mdl-layout-spacer"></div>
    </div>

    </#if>
</@layout.registrationLayout>