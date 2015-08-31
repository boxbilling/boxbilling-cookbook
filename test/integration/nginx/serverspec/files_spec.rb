# encoding: UTF-8
#
# Author:: Xabier de Zuazo (<xabier@zuazo.org>)
# Copyright:: Copyright (c) 2015 Onddo Labs, SL.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'spec_helper'

family = os[:family].downcase

web_user, web_group =
  if %w(debian ubuntu).include?(family)
    %w(www-data www-data)
  elsif %w(redhat centos fedora scientific amazon).include?(family)
    %w(nginx nginx)
  elsif %w(suse opensuse).include?(family)
    %w(wwwrun www)
  elsif %w(arch).include?(family)
    %w(http http)
  elsif %w(freebsd).include?(family)
    %w(www www)
  else
    %w(www-data www-data)
  end

describe file('/srv/www/boxbilling/bb-config.php') do
  it { should be_file }
  it { should be_mode 640 }
  it { should be_owned_by web_user }
  it { should be_grouped_into web_group }
end
