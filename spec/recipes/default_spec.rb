require 'spec_helper'

describe 'archiva::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes the ark recipe' do
    expect(chef_run).to include_recipe 'ark'
  end

  it 'installs Archiva' do
    expect(chef_run).to install_ark('archiva').with(
      url:         'http://archive.apache.org/dist/archiva/1.3.6/binaries/' \
                   'apache-archiva-1.3.6-bin.tar.gz',
      version:     '1.3.6',
      prefix_root: '/opt/',
      home_dir:    '/opt/archiva',
      checksum:    'bc696f38bacee90695802ec149f167125b24cc93c690560b5c5826a8e8bf86da',
      owner:       'root'
    )
  end

  it 'links /etc/init.d/archiva to /opt/archiva/bin/archiva' do
    expect(chef_run).to create_link('/etc/init.d/archiva').with(
      to: '/opt/archiva/bin/archiva'
    )
  end

  it 'deletes /opt/archiva/bin/wrapper-linux-x86-32' do
    expect(chef_run).to delete_file '/opt/archiva/bin/wrapper-linux-x86-32'
  end

  it 'enables and starts the archiva service' do
    expect(chef_run).to enable_service 'archiva'
    expect(chef_run).to start_service 'archiva'
  end
end
