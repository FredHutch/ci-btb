
node.default['ci-btb']['knife-config'] = {
    'supermarket_site' => "https://knife.fhcrc.org",
    'chef_server_url' => "https://chef.fhcrc.org/organizations/cit"
}

node.override['nginx']['default_site_enabled'] = false
node.override['nginx']['default']['modules'] = [ 'socketproxy' ]
node.override['nginx']['port'] = '80'

node.override['nginx']['socketproxy']['root'] = '/var/www/apps'

node.override['nginx']['socketproxy']['default_app'] = 'btb'
node.override['nginx']['socketproxy']['apps'] = {
    'btb' => {
        'subdir' => 'btb',
        'socket' => {
            'type' => 'tcp',
            'port' => '8080'
        },

    }
}



