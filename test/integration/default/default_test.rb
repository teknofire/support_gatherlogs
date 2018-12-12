# # encoding: utf-8

# Inspec test for recipe gatherlogs::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe user('hab') do
  it { should exist }
end

describe service('hab-sup') do
  it { should be_running }
end

describe port(4567) do
  it { should be_listening }
end

describe command('curl -XPOST "http://localhost:4567/12345" -d \'{ "url": "https://getchef.zendesk.com/attachments/token/Qwg1zYsY5P7aIgbE7nXmGOtCr/?name=a01-du-cfbc1.devfwh.lan-2018-10-08_18.16.32-UTC.tbz2" }\'') do
  its('exit_status') { should eq 0 }
end
