#
# Cookbook:: gatherlogs
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# hab_install 'default'

hab_sup 'default'

ruby_block 'wait-for-sup-default-startup' do
  block do
    raise unless system('hab sup status')
  end
  retries 30
  retry_delay 1
end

gatherlogs = chef_vault_item("secrets", "gatherlogs")
gatherlogs["chef_license"] = "accept-silent"

hab_user_toml 'grese' do
  config({
    server: gatherlogs.to_hash
  })
end

hab_package 'will/grese'

hab_service 'will/grese' do
  strategy 'at-once'
  topology 'standalone'
  channel node['gatherlogs']['channel']
end

# we need to sleep to let the nginx service have enough time to
# startup properly before we can unload it.
ruby_block 'wait-for-grese-startup' do
  block do
    raise unless system('hab svc status will/grese')
  end
  retries 30
  retry_delay 1
  action :nothing
  subscribes :run, 'hab_service[will/grese]', :immediately
end
