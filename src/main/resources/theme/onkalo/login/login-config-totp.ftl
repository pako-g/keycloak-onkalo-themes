<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("loginTotpTitle")}
    <#elseif section = "header">
        ${msg("loginTotpTitle")}
    <#elseif section = "form">

    <div class="mdl-grid">
        <div class="mdl-layout-spacer"></div>
        <div class="mdl-cell mdl-cell--4-col mdl-cell--12-col-phone mdl-cell--middle">
            <div class="demo-card-wide mdl-card mdl-shadow--2dp mdl-textfield--full-width">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Welcome</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <ol id="kc-totp-settings">
                        <li>
                            <p>${msg("loginTotpStep1")}</p>
                        </li>
                        <li>
                            <p>${msg("loginTotpStep2")}</p>
                            <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br/>
                            <span class="code">${totp.totpSecretEncoded}</span>
                        </li>
                        <li>
                            <p>${msg("loginTotpStep3")}</p>
                        </li>
                    </ol>
                    <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-totp-settings-form" method="post">
                        <div class="${properties.kcFormGroupClass!}">
                            <div class="${properties.kcInputWrapperClass!}">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-textfield--full-width">
                                    <input class="mdl-textfield__input" id="totp" name="totp" autocomplete="off" type="text"  autofocus />
                                    <label class="mdl-textfield__label" for="totp" >${msg("loginTotpOneTime")}</label>
                                    <span class="mdl-textfield__error">${msg("loginTotpOneTime")} ${msg("empty")}</span>
                                </div>
                                <#--<input type="text" id="totp" name="totp" autocomplete="off" class="${properties.kcInputClass!}" />-->
                            </div>
                            <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
                        </div>
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" value="${msg("doSubmit")}"  type="submit" id="kc-submit">${msg("doSubmit")}</button>
<#--
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
-->
                    </form>
                </div>
                <div class="mdl-card__actions mdl-card--border">

                </div>
            </div>

        </div>
        <div class="mdl-layout-spacer"></div>
    </div>
    </#if>
</@layout.registrationLayout>
