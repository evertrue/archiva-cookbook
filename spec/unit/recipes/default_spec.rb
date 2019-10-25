require 'spec_helper'

describe 'archiva::default' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'includes the ark recipe' do
    expect(chef_run).to include_recipe 'ark'
  end

  it 'includes the java recipe' do
    expect(chef_run).to include_recipe 'java'
  end

  it 'installs Archiva' do
    expect(chef_run).to install_ark('archiva').with(
      url: 'http://archive.apache.org/dist/archiva/2.2.4/binaries/' \
                   'apache-archiva-2.2.4-bin.tar.gz',
      version: '2.2.4',
      prefix_root: '/opt/',
      home_dir: '/opt/archiva',
      checksum: 'ad099c451529d566db8b5ad6cf2d8bafc6aa2cc3d225c39fd374cad420a6643c',
      owner: 'root'
    )
  end

  it 'updates /opt/archiva/bin/archiva' do
    expect(chef_run).to create_cookbook_file '/opt/archiva/bin/archiva'
  end

  it 'links /etc/init.d/archiva to /opt/archiva/bin/archiva' do
    expect(chef_run).to create_link('/etc/init.d/archiva').with(
      to: '/opt/archiva/bin/archiva'
    )
  end

  [
    'bin/wrapper-linux-x86-32',
    'lib/libwrapper-linux-x86-32.so',
  ].each do |file|
    it "deletes /opt/archiva/#{file}" do
      expect(chef_run).to delete_file "/opt/archiva/#{file}"
    end
  end

  it 'enables and starts the archiva service' do
    expect(chef_run).to enable_service 'archiva'
    expect(chef_run).to start_service 'archiva'
  end
end
