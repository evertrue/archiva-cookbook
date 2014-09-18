require 'spec_helper'

describe 'Archiva' do
  describe service 'archiva' do
    it { should be_enabled }
    it { should be_running }
  end

  describe port '8080' do
    it { should be_listening }
  end

  describe file '/opt/archiva' do
    it { should be_directory }
  end
end

describe 'Nginx' do
  describe service 'nginx' do
    it { should be_enabled }
    it { should be_running }
  end

  describe port '80' do
    it { should be_listening }
  end

  describe file '/etc/nginx/sites-enabled/archiva_server.conf' do
    it { should be_linked_to '/etc/nginx/sites-available/archiva_server.conf' }
  end

  describe file '/opt/archiva/conf/jetty.xml' do
    its(:content) { should include '<SystemProperty name="jetty.port" default="8080"/>' }
  end
end
