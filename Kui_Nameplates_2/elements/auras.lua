local addon = KuiNameplates
local kui = LibStub('Kui-1.0')
local ele = addon:NewElement('auras')
--[[
TODO
layout aura frame configuration:
layout:SetAuras({
    filter, point, max, size, x_spacing, y_spacing, x_offset, y_offset,
    rows, sort
})
--]]
-- row growth lookup table
local row_growth_points = {
    UP = {'BOTTOM','TOP'},
    DOWN = {'TOP','BOTTOM'}
}
-- aura button functions #######################################################
local function button_OnUpdate(self,elapsed)
    self.__elap = (self.__elap or 0) + elapsed
    if self.__elap > (self.__period or .1) then
        local remaining = self.expiration - GetTime()

        if remaining > 20 then
            self.__period = 1
        elseif remaining > 2 then
            self.__period = .5
        else
            self.__period = .1
        end

        self.cd:SetText(remaining)
    end
end
local function button_UpdateCooldown(self,duration,expiration)
    if expiration and expiration > 0 then
        self.expiration = expiration
        self:SetScript('OnUpdate',button_OnUpdate)
        self.cd:Show()
    else
        self.expiration = nil
        self:SetScript('OnUpdate',nil)
        self.cd:Hide()
    end
end
local function button_SetTexture(self,texture)
    self.icon:SetTexture(texture)
end
-- aura frame functions ########################################################
local function AuraFrame_Update(self)
    self:GetAuras()

    for _,button in ipairs(self.buttons) do
        if button.spellid and not button.used then
            self:HideButton(button)
        end

        button.used = nil
    end

    self:ArrangeButtons()

    if self.visible > 0 then
        self:Show()
    else
        self:Hide()
    end
end
local function AuraFrame_GetAuras(self)
    for i=1,40 do
        local name,_,icon,count,_,duration,expiration,_,_,_,spellid =
            UnitAura(self.parent.unit, i, self.filter)
--            'test',nil,'interface/icons/inv_dhmount',0,0,100,GetTime()+100,nil,nil,nil,math.random(1,100000)
        if not name then break end

        self:DisplayButton(name,icon,spellid,count,duration,expiration,i)
    end
end
local function AuraFrame_GetButton(self)
    if self.spellids[spellid] then
        -- use existing button with this spellid
        return self.spellids[spellid]
    end

    for _,button in ipairs(self.buttons) do
        if not button:IsShown() and not button.spellid then
            -- use unused button
            return button
        end
    end

    -- create new button
    local button = CreateFrame('Frame',nil,self)
    button:SetWidth(self.size)
    button:SetHeight(self.icon_height)

    local icon = button:CreateTexture(nil, 'ARTWORK', nil, 1)
    icon:SetTexCoord(.1,.9,.1+self.icon_ratio,.9-self.icon_ratio)

    local bg = button:CreateTexture(nil, 'ARTWORK', nil, 0)
    bg:SetTexture('interface/buttons/white8x8')
    bg:SetVertexColor(0,0,0,1)
    bg:SetAllPoints(button)

    icon:SetPoint('TOPLEFT',bg,'TOPLEFT',1,-1)
    icon:SetPoint('BOTTOMRIGHT',bg,'BOTTOMRIGHT',-1,1)

    local cd = button:CreateFontString(nil,'OVERLAY')
    cd:SetFont('Fonts\\FRIZQT__.TTF', 12, 'OUTLINE')
    cd:SetPoint('CENTER')

    button.parent = self
    button.icon   = icon
    button.cd     = cd

    button.UpdateCooldown = button_UpdateCooldown
    button.SetTexture     = button_SetTexture

    tinsert(self.buttons, button)
    return button
end
local function AuraFrame_DisplayButton(self,name,icon,spellid,count,duration,expiration,index)
    local button = self:GetButton(spellid)

    button:SetTexture(icon)
    button.used = true
    button.spellid = spellid
    button.index = index

    button:UpdateCooldown(duration,expiration)

    self.spellids[spellid] = button
end
local function AuraFrame_HideButton(self,button)
    if button.spellid then
        self.spellids[button.spellid] = nil
    end

    button:UpdateCooldown()

    button.duration = nil
    button.expiration = nil
    button.__period = nil
    button.__elap = nil

    button.spellid = nil
    button.index = nil

    button:Hide()
end
local function AuraFrame_ArrangeButtons(self)
    local prev,prev_row
    self.visible = 0

    for _,button in ipairs(self.buttons) do
        if button.spellid then
            if not self.max or self.visible < self.max then
                self.visible = self.visible + 1
                button:ClearAllPoints()

                if not prev then
                    button:SetPoint(self.point[1])
                    prev_row = button
                else
                    if  self.rows and self.rows > 1 and
                        (self.visible - 1) % self.num_per_row == 0
                    then
                        button:SetPoint(
                            self.row_point[1], prev_row, self.row_point[2],
                            0, self.y_spacing
                        )
                        prev_row = button
                    else
                        button:SetPoint(
                            self.point[2], prev, self.point[3],
                            self.x_spacing, 0
                        )
                    end

                end

                prev = button
                button:Show()
            else
                button:Hide()
            end
        end
    end
end
-- aura frame metatable
local aura_meta = {
    size = 25,
    squareness = .7,
    x_spacing = 0,
    y_spacing = 0,
    x_offset = 0,
    y_offset = 0,

    Update = AuraFrame_Update,
    GetAuras = AuraFrame_GetAuras,
    GetButton = AuraFrame_GetButton,
    DisplayButton = AuraFrame_DisplayButton,
    HideButton = AuraFrame_HideButton,
    ArrangeButtons = AuraFrame_ArrangeButtons
}
aura_meta.__index = aura_meta
-- local functions #############################################################
local function CreateAuraFrame(parent)
    local auraframe = CreateFrame('Frame',nil,parent)

    -- mixin prototype (can't actually setmeta on a frame)
    for k,v in pairs(aura_meta) do
        auraframe[k] = v
    end

    auraframe.parent = parent
    auraframe.buttons = {}
    auraframe.spellids = {}

    return auraframe
end
-- prototype additions #########################################################
-- messages ####################################################################
function ele.Create(f)
    f.Auras = { frames = {} }

    for i,frame_def in ipairs(addon.layout.Auras) do
        local new_frame = CreateAuraFrame(f)

        -- mixin configuration
        for k,v in pairs(frame_def) do
            new_frame[k] = v
        end

        new_frame.max = new_frame.max or 12

        new_frame.icon_height = new_frame.size * new_frame.squareness
        new_frame.icon_ratio = (1 - (new_frame.icon_height / new_frame.size)) / 2

        -- positioning stuff
        if new_frame.rows then
            if not new_frame.num_per_row then
                new_frame.num_per_row = floor(new_frame.max / new_frame.rows)
            end

            if not new_frame.row_growth then
                new_frame.row_growth = 'UP'
            end

            new_frame.row_point = row_growth_points[new_frame.row_growth]
        end

        -- TODO custom sorting stuff

        f.Auras.frames[i] = new_frame
    end
end
function ele.Show(f)
    ele:AurasUpdate(nil,f)
end
function ele.Hide(f)
    for i,frame in ipairs(f.Auras.frames) do
        frame:Hide()
        -- TODO OnHide recycles buttons etc
    end
end
function ele.Initialised()
    if type(addon.layout.Auras) ~= 'table' or #addon.layout.Auras == 0 then
        -- no frame definitions
        return
    end

    ele:RegisterMessage('Create')
    ele:RegisterMessage('Show')
    ele:RegisterMessage('Hide')

    ele:RegisterEvent('UNIT_AURA','AurasUpdate')
end
-- events ######################################################################
function ele:AurasUpdate(event,f)
    if not f then return end
    for _,auras_frame in ipairs(f.Auras.frames) do
        auras_frame:Update()
    end
end
-- register ####################################################################
ele:RegisterMessage('Initialised')
