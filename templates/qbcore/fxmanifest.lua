-- Generate by FiveM Resource Generator (Gusti Agung)

-- [[ FX Information ]] --
fx_version 'cerulean'            -- (cerulean, bodacious, adamant, anthrax)
lua54 'yes'                      -- Enable runtime Lua 5.4
game 'gta5'                      -- Target game (gta5, gta4, rdr3)

-- [[ Resource Metadata ]] --
name 'gusti-resources-generator' -- Resource name
author 'Gusti Agung'             -- Creator name / developer team
version '1.0.0'                  -- Resource version
description 'Description of the resource'  -- Brief explanation of resources

-- [[ Shared Scripts ]] --
shared_scripts {
    'config.lua'
}

-- [[ Server Scripts ]] --
client_scripts {
    'client/*.lua'
}

-- [[ Server Scripts ]] --
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

-- [[ Dependencies ]] --
dependencies {
    'qbcore'
}