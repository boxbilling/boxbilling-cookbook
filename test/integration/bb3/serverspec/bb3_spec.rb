# encoding: UTF-8
#
# Author:: Xabier de Zuazo (<xabier@zuazo.org>)
# Copyright:: Copyright (c) 2015 Xabier de Zuazo
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

describe server(:web) do
  describe http('/') do
    it 'includes PHP cookie' do
      expect(response['Set-Cookie']).to include 'BOXSID'
    end
  end # http /

  describe http('/bb-admin.php/staff/login') do
    it 'includes boxbilling version' do
      expect(response.body).to include 'BoxBilling 3.'
    end
  end # http bb-admin

  describe http("https://127.0.0.1:443/", ssl: { verify: false }) do
    it 'includes PHP cookie' do
      expect(response['Set-Cookie']).to include 'BOXSID'
    end
  end # https
end # server web
