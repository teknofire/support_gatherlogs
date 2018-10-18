# # encoding: utf-8

# Inspec test for recipe gatherlogs::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe user('hab') do
  it { should exist }
end

describe service('hab-sup-default') do
  it { should be_running }
end

describe port(4567) do
  it { should be_listening }
end
