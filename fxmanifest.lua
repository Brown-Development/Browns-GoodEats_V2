fx_version 'cerulean'
game 'gta5'

author 'Brown Development'
description 'Browns GoodEats V2'
lua54 'yes'

client_scripts {
    'code/client.lua'
} 
server_scripts {
    'code/server.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'code/shared.lua'
}

dependencies {
    'ox_lib'
}