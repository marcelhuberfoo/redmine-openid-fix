require 'redmine'
require 'dispatcher'

RAILS_DEFAULT_LOGGER.info 'Starting OpenID Fix plugin for Redmine'

Dispatcher.to_prepare :openid_fix_plugin do
    unless AccountController.included_modules.include?(OpenidAccountControllerPatch)
        AccountController.send(:include, OpenidAccountControllerPatch)
    end
end

Redmine::Plugin.register :openid_fix_plugin do
    name 'OpenID Fix'
    author 'Andriy Lesyuk'
    author_url 'http://www.andriylesyuk.com'
    description 'Plugin fixing OpenID authentication in Redmine.'
    url 'http://projects.andriylesyuk.com/projects/openid-fix'
    version '0.0.2'
end
