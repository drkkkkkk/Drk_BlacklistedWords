local BlacklistedWords = {"nigger", "faggot", "spastick", "retard", "nigga", "word1", "word2", "word3"} --- Add as many blacklisted words as you want, As you can see I added "word1, word2, word3, And  you can edit those and add as many as u want!"



--- Don't Touch Anything Below Here. ---

local discordWebhook = Config.Webhook

RegisterServerEvent('chatMessage')
AddEventHandler('chatMessage', function(source, name, message)
    local lowerMessage = message:lower()

    for _, word in ipairs(BlacklistedWords) do
        if string.find(lowerMessage, word) then
            local playerName = GetPlayerName(source)

            exports["discord-screenshot"]:requestCustomClientScreenshotUploadToDiscord(
                source,
                discordWebhook,
                {
                    encoding = "png",
                    quality = 1
                },
                {
                    username = Config.WebhookName,
                    avatar_url = Config.DiscordAvatarUrl,
                    content = "Oh Hell Naw Brudda",
                    embeds = {
                        {
                            color = 16771584,
                            author = {
                                name = "wtffffffffff!",
                                icon_url = "https://cdn.discordapp.com/embed/avatars/0.png"
                            },
                            title = playerName .. " used a blacklisted word. Above is a screenshot of their FiveM. - Word used: " .. message
                        }
                    }
                },
                30000,
                function(error)
                    if error then
                        print("^1ERROR: " .. error)
                    else
                        print("Sent screenshot successfully")
                    end
                end
            )

            print("Racist")
            Citizen.Wait(2000)
            DropPlayer(source, Config.KicKMessage, "(DRKANTICHAT)")

            break
        end
    end
end)
