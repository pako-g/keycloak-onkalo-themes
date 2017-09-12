Keycloak Onkalo Themes Material Design Lite
===========================================

You can either deploy the themes by copying to the themes folder or as modules.

### Copy

Simplest way to deploy the themes is to copy `src/main/resources/theme/*` to `themes/`.

### Module

Change `<properties>` into pom.xml
   
    `<KEYCLOAK_HOME>**PATH-YOUR_KEYCLOAK-HOME**</KEYCLOAK_HOME>`    

Alternatively you can deploy as modules. This can be done by first running:

    mvn clean install
    
Then open `standalone/configuration/standalone.xml` and register the theme module by adding:

    <theme>
        ...
        <modules>
            <module>org.keycloak.onkalo.themes</module>
        </modules>
    </theme>

One thing to note is that to change the admin console for the master admin console (`/auth/admin`) you need to change the theme for the master realm. Changing the admin console theme for any other realms will only change the admin console for that specific realm (for example `/auth/admin/myrealm/console`).
