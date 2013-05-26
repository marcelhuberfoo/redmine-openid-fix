require 'redmine'

Rails.logger.info 'Starting OpenID Fix plugin for Redmine'

Rails.configuration.to_prepare do
    unless AccountController.included_modules.include?(OpenidAccountControllerPatch)
        AccountController.send(:include, OpenidAccountControllerPatch)
    end
end

Redmine::Plugin.register :openid_fix do
    name 'OpenID Fix'
    author 'Andriy Lesyuk'
    author_url 'http://www.andriylesyuk.com'
    description 'Plugin fixing OpenID authentication in Redmine.'
    url 'http://projects.andriylesyuk.com/projects/openid-fix'
    version '0.1.0'

    settings :default => {
        :self_registration => nil
    }, :partial => 'settings/openid_fix'
end
