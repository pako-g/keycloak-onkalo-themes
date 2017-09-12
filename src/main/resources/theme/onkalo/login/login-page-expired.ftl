<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("pageExpiredTitle")}
    <#elseif section = "header">
        ${msg("pageExpiredTitle")}
    <#elseif section = "form">

    <#--<div class="mdl-grid">
        <div class="mdl-layout-spacer"></div>
        <div class="mdl-cell mdl-cell--4-col mdl-cell--12-col-phone">
            <div class="demo-card-wide mdl-card mdl-shadow--2dp mdl-textfield--full-width">-->
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Welcome</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <p id="instruction1" class="instruction">
                    ${msg("pageExpiredMsg1")} <a id="loginRestartLink" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a> .
                    ${msg("pageExpiredMsg2")} <a id="loginContinueLink" href="${url.loginAction}">${msg("doClickHere")}</a> .
                    </p>

                </div>
                <div class="mdl-card__actions mdl-card--border">

                </div>
            <#--</div>

        </div>
        <div class="mdl-layout-spacer"></div>
    </div>-->



    </#if>
</@layout.registrationLayout>