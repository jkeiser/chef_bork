# chef_bork cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/chef_bork.svg?branch=master)](https://travis-ci.org/chef-cookbooks/chef_bork)
[![Cookbook Version](https://img.shields.io/cookbook/v/chef_bork.svg)](https://supermarket.chef.io/cookbooks/chef_bork)


This cookbook brings the custom resource syntax from Chef 12.5 to earlier Chef 12.X releases.


Requirements
------------
#### Platforms
- All platforms supported by Chef

#### Chef
- Chef 12.0+

#### Cookbooks
- [https://supermarket.chef.io/cookbooks/compat_resource](compat_resource)


## Usage

To use this cookbook, put *both* `depends 'compat_resource'` and `depends 'chef_bork'` in the metadata.rb of your cookbook. Once this is done, you can use all the new crazy features
in 12.0-12.5.

##License & Authors

**Author:** John Keiser (<jkeiser@chef.io>)

**Copyright:** 2015, Chef Software, Inc.
```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
