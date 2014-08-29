require 'spec_helper'

describe 'archiva::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes the ark recipe' do
    expect(chef_run).to include_recipe 'ark'
  end

  it 'installs Archiva' do
    expect(chef_run).to install_ark('archiva').with(
      url:         'http://archive.apache.org/dist/archiva/2.1.1/binaries/' \
                   'apache-archiva-2.1.1-bin.tar.gz',
      version:     '2.1.1',
      prefix_root: '/opt/',
      home_dir:    '/opt/archiva',
      checksum:    'e1c3245b73f8f6aceae05527331cd1902dd5edb647056e2f83269fc0e2e8ace7',
      owner:       'root'
    )
  end

  it 'links /etc/init.d/archiva to /opt/archiva/bin/archiva' do
    expect(chef_run).to create_link('/etc/init.d/archiva').with(
      to: '/opt/archiva/bin/archiva'
    )
  end

  [
    'bin/wrapper-linux-x86-32',
    'lib/libwrapper-linux-x86-32.so'
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
