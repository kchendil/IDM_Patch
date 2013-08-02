#
# Cookbook Name:: idm_engine_patch
# Recipe:: default
#
# Copyright 2013, Chendil Kumar Manoharan
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

execute "Download the Patch" do
 user "root" 
 command "mkdir -p /tmp/engine-patch; wget http://isec-publish.labs.blr.novell.com/publish/Builds/IDM/dorado_sp2_patch3/Engine/20130614/IDM_engine_rl_Patch3.zip -O /tmp/engine-patch/IDM_engine_rl_Patch3.zip"
  action :run
end



execute "Unzip and Install the patch" do
 user "root" 
 command "cd /tmp/engine-patch; unzip /tmp/engine-patch/IDM_engine_rl_Patch3.zip; rpm -Uvh /tmp/engine-patch/cd-image/patch/Linux/engine/64-bit/*.rpm"
  action :run
end


execute "Restart ndsd" do
 user "root"
 command "/etc/init.d/ndsd restart" 
  action :run
end

