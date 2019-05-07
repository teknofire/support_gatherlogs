name 'support_gatherlogs'
maintainer 'Will Fisher'
maintainer_email 'will@chef.io'
license 'Apache2'
description 'Installs/Configures gatherlogs tools'
long_description 'Installs/Configures gatherlogs tools'
version '0.3.0'
chef_version '>= 12.14' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/gatherlogs/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/gatherlogs'

depends 'habitat'
depends 'chef-vault'
