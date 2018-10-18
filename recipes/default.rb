#
# Cookbook:: gatherlogs
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# hab_install 'default'

hab_sup 'default'


ruby_block 'wait-for-sup-default-startup' do
  block do
    raise unless File.exist?('/hab/sup/default/data/services.dat')
  end
  retries 30
  retry_delay 1
end

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
end
