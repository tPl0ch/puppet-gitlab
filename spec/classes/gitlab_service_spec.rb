require 'spec_helper'

# Gitlab
describe 'gitlab' do
  let(:facts) {{
    :osfamily  => 'Debian',
    :fqdn      => 'gitlab.fooboozoo.fr',
    :sshrsakey => 'AAAAB3NzaC1yc2EAAAA'
  }}

  ## Parameter set
  # a non-default common parameter set
  let :params_set do
    {
      :git_user               => 'gitlab',
      :git_home               => '/srv/gitlab',
      :git_comment            => 'Labfooboozoo',
      :git_email              => 'gitlab@fooboozoo.fr',
      :gitlab_sources         => 'https://github.com/gitlabhq/gitlabhq',
      :gitlab_branch          => '4-2-stable',
      :gitlabshell_sources    => 'https://github.com/gitlabhq/gitlab-shell',
      :gitlabshell_branch     => 'v1.2.3',
      :gitlab_repodir         => '/mnt/nas',
      :gitlab_redishost       => 'redis.fooboozoo.fr',
      :gitlab_redisport       => '9736',
      :gitlab_dbname          => 'gitlab_production',
      :gitlab_dbuser          => 'baltig',
      :gitlab_dbpwd           => 'Cie7cheewei<ngi3',
      :gitlab_dbhost          => 'sql.fooboozoo.fr',
      :gitlab_dbport          => '2345',
      :gitlab_http_timeout    => '300',
      :gitlab_projects        => '42',
      :gitlab_username_change => false,
      :gitlab_unicorn_port    => '8888',
      :gitlab_unicorn_worker  => '8',
      :exec_path              => '/opt/bw/bin:/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin',
      :ldap_host              => 'ldap.fooboozoo.fr',
      :ldap_base              => 'dc=fooboozoo,dc=fr',
      :ldap_port              => '666',
      :ldap_uid               => 'cn',
      :ldap_method            => 'tls',
      :ldap_bind_dn           => 'uid=gitlab,o=bots,dc=fooboozoo,dc=fr',
      :ldap_bind_password     => 'aV!oo1ier5ahch;a'
    }
  end

  ### Gitlab::service
  describe 'gitlab::service' do
    it { should contain_service('gitlab').with(
      :ensure     => 'running',
      :hasstatus  => 'true',
      :hasrestart => 'true',
      :enable     => 'true'
    )}
  end # gitlab::service
end # gitlab
