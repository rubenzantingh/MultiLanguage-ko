local addonName = ...
local optionsFrame = CreateFrame("Frame")

local function languageExists(value)
    for _, language in ipairs(MultiLanguageOptions.AVAILABLE_LANGUAGES) do
        if language.value == value then
            return true
        end
    end
    return false
end

local function addLanguageOption()
    if not languageExists('ko') then
        table.insert(MultiLanguageOptions.AVAILABLE_LANGUAGES, {value = 'ko', text = 'Korean'})
        AddLanguageDropdownOption()
    end

    if MultiLanguageTranslations['ko'] == nil then
        MultiLanguageTranslations['ko'] = {
            description = "서술",
            objectives = "목표"
        }
    end
end

local function addonLoaded(self, event, addonLoadedName)
    if addonLoadedName == addonName then
        addLanguageOption()
    end
end

optionsFrame:RegisterEvent("ADDON_LOADED")
optionsFrame:SetScript("OnEvent", addonLoaded)
