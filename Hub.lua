-- kevynmama-hub v1.9
-- Script para Roblox Executor com UI funcional e sistema de versão

-- Carrega a biblioteca Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Inicializa a UI
local Window = Rayfield:CreateWindow({
    Name = "kevynmama-hub v1.9",
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
local BrookhavenTab = Window:CreateTab("Brookhaven", nil)

-- Seção de boas-vindas e versão atual
local WelcomeSection = MainTab:CreateSection("Boas-vindas")
local WelcomeLabel = MainTab:CreateLabel("Bem-vindo ao kevynmama-hub v1.9!")
local VersionLabel = MainTab:CreateLabel("Versão atual: 1.9 (Última atualização: 12/02/2026)")

-- Botão para destruir a UI
local DestroyUIButton = MainTab:CreateButton({
    Name = "Destruir UI",
    Callback = function()
        Rayfield:Destroy()
        Rayfield:Notify({Title = "Sucesso", Content = "UI destruída com sucesso!", Duration = 3})
    end
})

-- Seção de atualizações
local UpdateSection = MainTab:CreateSection("Nova Atualização (v1.9)")
local Update1 = MainTab:CreateLabel("🔹 Adicionado botão 'Destruir UI'.")
local Update2 = MainTab:CreateLabel("🔹 Nova aba Brookhaven com Spectra Hub e Coquette Hub.")

-- Seção de Scripts de Casa (v1.9)
local CasaSection = ScriptsTab:CreateSection("Scripts de Casa (v1.9)")
local InvisibleButton = ScriptsTab:CreateButton({
    Name = "Ativar Invisible",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/oay8bgXY/raw?part=Oooooooieiiiie%20toibingu"))()
    end
})
local EmotesButton = ScriptsTab:CreateButton({
    Name = "Ativar Emotes",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))()
    end
})
local FatesAdminButton = ScriptsTab:CreateButton({
    Name = "Ativar Fates Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
    end
})

-- Seção de Scripts de Fora (v1.9)
local ForaSection = ScriptsTab:CreateSection("Scripts de Fora (v1.9)")
local NoitesButton = ScriptsTab:CreateButton({
    Name = "Ativar 99 Noites",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua"))()
    end
})
local YahrmButton = ScriptsTab:CreateButton({
    Name = "Ativar YAHRM HUB",
    Callback = function()
        local src = ""
        local CoreGui = game:GetService("StarterGui")
        local successOnline, errOnline = pcall(function() src = game:HttpGet("https://yarhm.mhi.im/scr", false) end)
        if not successOnline or src == "" then
            CoreGui:SetCore("SendNotification", {
                Title = "YAHRM Offline",
                Text = "YAHRM Online está indisponível. Usando versão offline.",
                Duration = 5,
            })
            local successOffline, errOffline = pcall(function()
                src = game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/source/yarhm/1.19/yarhm.lua", false)
                loadstring(src)()
            end)
            if successOffline then
                Rayfield:Notify({Title = "Sucesso", Content = "YAHRM HUB (offline) foi ativado!", Duration = 5})
            else
                Rayfield:Notify({Title = "Erro", Content = "Falha ao carregar YAHRM HUB: " .. errOffline, Duration = 5})
            end
        else
            local success, err = pcall(function()
                loadstring(src)()
            end)
            if success then
                Rayfield:Notify({Title = "Sucesso", Content = "YAHRM HUB foi ativado!", Duration = 5})
            else
                Rayfield:Notify({Title = "Erro", Content = "Falha ao carregar YAHRM HUB: " .. err, Duration = 5})
            end
        end
    end
})
local NamelessButton = ScriptsTab:CreateButton({
    Name = "Ativar Nameless Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
    end
})
local InfiniteYieldButton = ScriptsTab:CreateButton({
    Name = "Ativar Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})
local RakeButton = ScriptsTab:CreateButton({
    Name = "Ativar The Rake Remastered",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Djskinybinn/The-Rake-Remastered-Script-Keyless/refs/heads/main/ObfuscatedRakeScript.lua"))()
    end
})

-- Seção de Scripts para Brookhaven
local BrookhavenSection = BrookhavenTab:CreateSection("Scripts para Brookhaven (v1.9)")
local SpectraButton = BrookhavenTab:CreateButton({
    Name = "Ativar Spectra Hub",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Spectra-Hub-88670"))()
    end
})
local CoquetteButton = BrookhavenTab:CreateButton({
    Name = "Ativar Coquette Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cat558-uz/Coquette-/refs/heads/main/coquettee.txt"))()
    end
})

-- Seção de Créditos
local CreditsSection = CreditsTab:CreateSection("Créditos")
local DevLabel = CreditsTab:CreateLabel("Desenvolvido por: Kevyn Mal")
local VersionCredit = CreditsTab:CreateLabel("Versão atual: 1.9")
local User1 = CreditsTab:CreateLabel("🔹 Kevyngame163637")
local User2 = CreditsTab:CreateLabel("🔹 Kaiozinhu12")

-- Seção de créditos para Brookhaven
local BrookhavenCredits = BrookhavenTab:CreateSection("Créditos Brookhaven")
local BrookhavenDev = BrookhavenTab:CreateLabel("Scripts para Brookhaven por: Kevyn Mal")
local BrookhavenNote = BrookhavenTab:CreateLabel("⚠️ Use com moderação para evitar banimento.")

-- Mensagem de boas-vindas no chat
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg:lower() == "!bemvindo" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "Bem-vindo ao kevynmama-hub v1.9! Digite !ajuda para ver os comandos.",
            Color = Color3.fromRGB(255, 87, 34)
        })
    elseif msg:lower() == "!ajuda" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "Comandos disponíveis: !bemvindo, !scripts, !creditos",
            Color = Color3.fromRGB(255, 87, 34)
        })
    end
end)
