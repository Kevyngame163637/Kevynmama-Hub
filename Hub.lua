-- kevynmama-hub v1.3
-- Script para Roblox Executor com UI funcional e sistema de versão

-- Carrega a biblioteca Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Inicializa a UI
local Window = Rayfield:CreateWindow({
    Name = "kevynmama-hub v1.3",
    LoadingTitle = "Carregando kevynmama-hub...",
    LoadingSubtitle = "por Kevyn Mal",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "kevynmama-hub",
        FileName = "config"
    },
    Discord = {
        Enabled = false,
        Invite = "nenhum",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "kevynmama-hub",
        Subtitle = "Key System",
        Note = "Sem chave necessária",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Actions = {
            [1] = {
                Text = 'Copiar chave',
                OnPress = function()
                    setclipboard('nenhuma')
                end
            }
        }
    }
})

-- Abas
local MainTab = Window:CreateTab("Início", nil)
local ScriptsTab = Window:CreateTab("Scripts", nil)
local CreditsTab = Window:CreateTab("Créditos", nil)

-- Seção de boas-vindas e versão atual
local WelcomeSection = MainTab:CreateSection("Boas-vindas")
local WelcomeLabel = MainTab:CreateLabel("Bem-vindo ao kevynmama-hub v1.3!")
local VersionLabel = MainTab:CreateLabel("Versão atual: 1.3 (Última atualização: 12/02/2026)")

-- Seção de atualizações
local UpdateSection = MainTab:CreateSection("Nova Atualização (v1.3)")
local Update1 = MainTab:CreateLabel("🔹 99 Noites e YAHRM HUB movidos para 'Scripts de Fora'.")
local Update2 = MainTab:CreateLabel("🔹 Removidos SimpleSpy e Dark Hub.")
local Update3 = MainTab:CreateLabel("🔹 Melhorias na organização dos scripts.")

-- Seção de Scripts de Casa (v1.3)
local CasaSection = ScriptsTab:CreateSection("Scripts de Casa (v1.3)")

-- 1. Script: Invisible
local InvisibleButton = ScriptsTab:CreateButton({
    Name = "Ativar Invisible",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://pastefy.app/oay8bgXY/raw?part=Oooooooieiiiie%20toibingu", true))()
        end)
        if success then
            Rayfield:Notify({
                Title = "Sucesso",
                Content = "Script Invisible foi ativado!",
                Duration = 5,
            })
        else
            Rayfield:Notify({
                Title = "Erro",
                Content = "Falha ao carregar Invisible: " .. err,
                Duration = 5,
            })
        end
    end
})

-- 2. Script: Infinite Yield
local InfiniteYieldButton = ScriptsTab:CreateButton({
    Name = "Ativar Infinite Yield",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end)
        if success then
            Rayfield:Notify({
                Title = "Sucesso",
                Content = "Infinite Yield foi ativado!",
                Duration = 5,
            })
        else
            Rayfield:Notify({
                Title = "Erro",
                Content = "Falha ao carregar Infinite Yield: " .. err,
                Duration = 5,
            })
        end
    end
})

-- 3. Script: Fates Admin
local FatesAdminButton = ScriptsTab:CreateButton({
    Name = "Ativar Fates Admin",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
        end)
        if success then
            Rayfield:Notify({
                Title = "Sucesso",
                Content = "Fates Admin foi ativado!",
                Duration = 5,
            })
        else
            Rayfield:Notify({
                Title = "Erro",
                Content = "Falha ao carregar Fates Admin: " .. err,
                Duration = 5,
            })
        end
    end
})

-- Seção de Scripts de Fora (v1.3)
local ForaSection = ScriptsTab:CreateSection("Scripts de Fora (v1.3)")

-- 1. Script: 99 Noites
local NoitesButton = ScriptsTab:CreateButton({
    Name = "Ativar 99 Noites",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
        end)
        if success then
            Rayfield:Notify({
                Title = "Sucesso",
                Content = "99 Noites foi ativado!",
                Duration = 5,
            })
        else
            Rayfield:Notify({
                Title = "Erro",
                Content = "Falha ao carregar 99 Noites: " .. err,
                Duration = 5,
            })
        end
    end
})

-- 2. Script: YAHRM HUB
local YahrmButton = ScriptsTab:CreateButton({
    Name = "Ativar YAHRM HUB",
    Callback = function()
        local src = ""
        local CoreGui = game:GetService("StarterGui")

        -- Tenta carregar a versão online
        local successOnline, errOnline = pcall(function()
            src = game:HttpGet("https://yarhm.mhi.im/scr", false)
        end)

        if not successOnline or src == "" then
            CoreGui:SetCore("SendNotification", {
                Title = "YAHRM Offline",
                Text = "YAHRM Online está indisponível. Usando versão offline.",
                Duration = 5,
            })
            -- Carrega a versão offline
            local successOffline, errOffline = pcall(function()
                src = game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/source/yarhm/1.19/yarhm.lua", false)
                loadstring(src)()
            end)
            if successOffline then
                Rayfield:Notify({
                    Title = "Sucesso",
                    Content = "YAHRM HUB (offline) foi ativado!",
                    Duration = 5,
                })
            else
                Rayfield:Notify({
                    Title = "Erro",
                    Content = "Falha ao carregar YAHRM HUB: " .. errOffline,
                    Duration = 5,
                })
            end
        else
            -- Executa a versão online
            local success, err = pcall(function()
                loadstring(src)()
            end)
            if success then
                Rayfield:Notify({
                    Title = "Sucesso",
                    Content = "YAHRM HUB foi ativado!",
                    Duration = 5,
                })
            else
                Rayfield:Notify({
                    Title = "Erro",
                    Content = "Falha ao carregar YAHRM HUB: " .. err,
                    Duration = 5,
                })
            end
        end
    end
})

-- 3. Script: Nameless Admin
local NamelessButton = ScriptsTab:CreateButton({
    Name = "Ativar Nameless Admin",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
        end)
        if success then
            Rayfield:Notify({
                Title = "Nameless Admin",
                Content = "Nameless Admin foi ativado!",
                Duration = 5,
            })
        else
            Rayfield:Notify({
                Title = "Erro",
                Content = "Falha ao carregar Nameless Admin: " .. err,
                Duration = 5,
            })
        end
    end
})

-- 4. Script: Emotes
local EmotesButton = ScriptsTab:CreateButton({
    Name = "Ativar Emotes",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))()
        end)
        if success then
            Rayfield:Notify({
                Title = "Emotes",
                Content = "Emotes foram ativados!",
                Duration = 5,
            })
        else
            Rayfield:Notify({
                Title = "Erro",
                Content = "Falha ao carregar Emotes: " .. err,
                Duration = 5,
            })
        end
    end
})

-- 5. Script: The Rake Remastered
local RakeButton = ScriptsTab:CreateButton({
    Name = "Ativar The Rake Remastered",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Djskinybinn/The-Rake-Remastered-Script-Keyless/refs/heads/main/ObfuscatedRakeScript.lua", true))()
        end)
        if success then
            Rayfield:Notify({
                Title = "The Rake Remastered",
                Content = "The Rake Remastered foi ativado!",
                Duration = 5,
            })
        else
            Rayfield:Notify({
                Title = "Erro",
                Content = "Falha ao carregar The Rake Remastered: " .. err,
                Duration = 5,
            })
        end
    end
})

-- Seção de Créditos
local CreditsSection = CreditsTab:CreateSection("Créditos")
local DevLabel = CreditsTab:CreateLabel("Desenvolvido por: Kevyn Mal")
local VersionCredit = CreditsTab:CreateLabel("Versão atual: 1.3")
local User1 = CreditsTab:CreateLabel("🔹 Kevyngame163637")
local User2 = CreditsTab:CreateLabel("🔹 Kaiozinhu12")

-- Mensagem de boas-vindas no chat
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg:lower() == "!bemvindo" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "Bem-vindo ao kevynmama-hub v1.3! Digite !ajuda para ver os comandos.",
            Color = Color3.fromRGB(255, 87, 34)
        })
    elseif msg:lower() == "!ajuda" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "Comandos disponíveis: !bemvindo, !scripts, !creditos",
            Color = Color3.fromRGB(255, 87, 34)
        })
    end
end)
