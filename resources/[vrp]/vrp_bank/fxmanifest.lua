fx_version 'adamant'
game 'gta5'

author 'ZIRAFLIX'
contact 'E-mail: contato@ziraflix.com - Discord: discord.gg/kYFy8JwVfd'

ui_page('nui/darkside.html')

client_script{
    '@vrp/lib/utils.lua',
    'config/config.lua',
    'hansolo/*.lua'
}

server_script {
    '@vrp/lib/utils.lua',
    'config/config.lua',
	'skywalker.lua'
}

files {
    'nui/*.html',
    'nui/*.css',
    'nui/**/*.png',
    'nui/**/*.ttf'
}
