-- kevynmama-hub v1.2
-- Script para Roblox Executor com UI funcional e sistema de versão

-- Carrega a biblioteca Rayfield (mais estável e popular)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Inicializa a UI
local Window = Rayfield:CreateWindow({
    Name = "kevynmama-hub v1.2",
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
local WelcomeLabel = MainTab:CreateLabel("Bem-vindo ao kevynmama-hub v1.2!")
local VersionLabel = MainTab:CreateLabel("Versão atual: 1.2 (Última atualização: 12/02/2026)")

-- Seção de atualizações
local UpdateSection = MainTab:CreateSection("Nova Atualização (v1.2)")
local Update1 = MainTab:CreateLabel("🔹 Adicionado sistema de versão.")
local Update2 = MainTab:CreateLabel("🔹 Nova aba 'Scripts' com mais opções.")
local Update3 = MainTab:CreateLabel("🔹 Melhorias na UI e correções de bugs.")
local Update4 = MainTab:CreateLabel("🔹 Menção especial aos usuários Kevyngame163637 e Kaiozinhu12.")

-- Seção de Scripts de Casa
local CasaSection = ScriptsTab:CreateSection("Script de Casa (v1.2)")
local CasaButton = ScriptsTab:CreateButton({
    Name = "Ativar Script de Casa",
    Callback = function()
        Rayfield:Notify({
            Title = "Script de Casa",
            Content = "Script de Casa (v1.2) ativado!",
            Duration = 5,
            Image = nil,
            Actions = {
                Ignore = {
                    Name = "OK",
                    Callback = function()
                        print("Script de Casa ativado!")
                    end
                }
            }
        })
    end
})

-- Seção de Scripts de Fora
local ForaSection = ScriptsTab:CreateSection("Script de Fora (v1.2)")
local ForaButton = ScriptsTab:CreateButton({
    Name = "Ativar Script de Fora",
    Callback = function()
        Rayfield:Notify({
            Title = "Script de Fora",
            Content = "Script de Fora (v1.2) ativado!",
            Duration = 5,
            Image = nil,
            Actions = {
                Ignore = {
                    Name = "OK",
                    Callback = function()
                        print("Script de Fora ativado!")
                    end
                }
            }
        })
    end
})

-- Seção de Créditos
local CreditsSection = CreditsTab:CreateSection("Créditos")
local DevLabel = CreditsTab:CreateLabel("Desenvolvido por: Kevyn Mal")
local VersionCredit = CreditsTab:CreateLabel("Versão atual: 1.2")
local User1 = CreditsTab:CreateLabel("🔹 Kevyngame163637")
local User2 = CreditsTab:CreateLabel("🔹 Kaiozinhu12")

-- Mensagem de boas-vindas no chat
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg:lower() == "!bemvindo" then
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "Bem-vindo ao kevynmama-hub v1.2! Digite !ajuda para ver os comandos.",
            Color = Color3.fromRGB(255, 87, 34)
        })
    end
end)
