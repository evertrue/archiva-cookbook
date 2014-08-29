require 'spec_helper'

describe 'archiva::nginx_proxy' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  before do
    stub_command('which nginx').and_return('/usr/sbin/nginx')
  end

  %w(
    archiva
    nginx::default
  ).each do |recipe|
    it "includes the #{recipe} recipe" do
      expect(chef_run).to include_recipe recipe
    end
  end

  it 'adds an nginx site config for archiva' do
    expect(chef_run).to create_template('archiva_server.conf').with(
      path:   '/etc/nginx/sites-available/archiva_server.conf',
      source: 'nginx_site_default.erb',
      owner:  'root',
      group:  'root',
      mode:   '0644'
    )
  end

  it 'enables the archiva_server nginx site' do
    expect(chef_run).to run_execute('nxensite archiva_server.conf').with(
      command: '/usr/sbin/nxensite archiva_server.conf'
    )
    resource = chef_run.execute('nxensite archiva_server.conf')
    expect(resource).to notify('service[nginx]').to(:reload)
  end

  it 'adds a custom Archiva jetty config' do
    expect(chef_run).to create_template('/opt/archiva/conf/jetty.xml').with(
      source: 'jetty.xml.erb',
      mode:   '0644',
      owner:  'root'
    )
    resource = chef_run.template('/opt/archiva/conf/jetty.xml')
    expect(resource).to notify('service[archiva]').to(:restart).immediately
  end
end
