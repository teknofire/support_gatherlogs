#
# Cookbook:: gatherlogs
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# hab_install 'default'

hab_sup 'default'

gatherlogs = chef_vault_item("secrets", "gatherlogs")
hab_user_toml 'gatherlogs' do
  config({
    server: gatherlogs.to_hash
  })
end

hab_package 'will/gatherlogs'

hab_service 'will/gatherlogs' do
  strategy 'at-once'
  topology 'standalone'
  channel node['gatherlogs']['channel']
end
