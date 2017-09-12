<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("emailVerifyTitle")}
    <#elseif section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">

    <#--<div class="mdl-grid">
        <div class="mdl-layout-spacer"></div>
        <div class="mdl-cell mdl-cell--4-col mdl-cell--12-col-phone">
            <div class="demo-card-wide mdl-card mdl-shadow--2dp mdl-textfield--full-width">-->
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Welcome</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <p class="instruction">
                    ${msg("emailVerifyInstruction1")}
                    </p>
                    <p class="instruction">
                    ${msg("emailVerifyInstruction2")} <a href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}
                    </p>
                </div>
                <div class="mdl-card__actions mdl-card--border">

                </div>

        <#--    </div>
        </div>
        <div class="mdl-layout-spacer"></div>
    </div>-->


    </#if>
</@layout.registrationLayout>