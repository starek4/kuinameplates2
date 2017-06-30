if GetLocale() ~= "zhCN" then return end
local opt = KuiNameplatesCoreConfig
opt["page_names"] = {
    ["auras"] = "光环",
    ["bossmod"] = "Boss 模式",
    ["castbars"] = "施法条",
    ["classpowers"] = "职业资源",
    ["framesizes"] = "框体大小",
    ["general"] = "设置",
    ["healthbars"] = "血条",
    ["nameonly"] = "名称模式",
    ["text"] = "文本",
    ["threat"] = "仇恨",
}
opt["titles"] = {
    ["auras_centre"] = "中心对齐图标",
    ["auras_enabled"] = "显示自身光环",
    ["auras_filtering_sep"] = "过滤",
    ["auras_icon_minus_size"] = "辅助图标大小",
    ["auras_icon_normal_size"] = "常规图标大小",
    ["auras_icon_squareness"] = "图标长宽比",
    ["auras_icons_sep"] = "图标",
    ["auras_maximum_length"] = "最大有效长度",
    ["auras_minimum_length"] = "最小有效长度",
    ["auras_on_personal"] = "在个人框体上显示",
    ["auras_pulsate"] = "闪烁图标",
    ["auras_sort"] = "排序方式",
    ["auras_time_threshold"] = "计时器阈值",
    ["auras_vanilla_filter"] = "使用默认UI过滤",
    ["auras_whitelist"] = "使用白名单",
    ["bar_animation"] = "血条动画",
    ["bar_texture"] = "血条材质",
    ["bossmod_clickthrough"] = "自动显示时允许点击穿越",
    ["bossmod_control_visibility"] = "允许boss模块来控制姓名版是否可见",
    ["bossmod_enable"] = "开启boss模块",
    ["bossmod_icon_size"] = "图标尺寸",
    ["bossmod_x_offset"] = "水平偏移",
    ["bossmod_y_offset"] = "垂直偏移",
    ["bot_vertical_offset"] = "等级/生命值垂直位置",
    ["castbar_colour"] = "施法条颜色",
    ["castbar_enable"] = "开启",
    ["castbar_height"] = "施法条高度",
    ["castbar_icon"] = "显示法术图标",
    ["castbar_name"] = "显示法术名称",
    ["castbar_showall"] = "所有姓名版均显示施法条",
    ["castbar_showenemy"] = "显示敌方施法条",
    ["castbar_showfriend"] = "显示友方施法条",
    ["castbar_showpersonal"] = "显示自己的施法条",
    ["castbar_unin_colour"] = "免疫打断颜色",
    ["class_colour_enemy_names"] = "敌方姓名为职业颜色",
    ["class_colour_friendly_names"] = "友方姓名为职业颜色",
    ["classpowers_bar_height"] = "资源条高度",
    ["classpowers_bar_width"] = "资源条宽度",
    ["classpowers_colour"] = "图标颜色",
    ["classpowers_colour_inactive"] = "资源闲置颜色",
    ["classpowers_colour_overflow"] = "资源溢出颜色",
    ["classpowers_enable"] = "显示职业资源",
    ["classpowers_on_target"] = "在目标上显示",
    ["classpowers_size"] = "图标大小",
    ["clickthrough_enemy"] = "敌对",
    ["clickthrough_friend"] = "友善",
    ["clickthrough_self"] = "个人",
    ["clickthrough_sep"] = "点击穿越框体",
    ["colour_enemy_class"] = "敌对玩家职业颜色",
    ["colour_enemy_pet"] = "敌对玩家宠物",
    ["colour_enemy_player"] = "敌对玩家",
    ["colour_friendly"] = "友善",
    ["colour_friendly_pet"] = "友善目标宠物",
    ["colour_hated"] = "敌对",
    ["colour_neutral"] = "中立",
    ["colour_player"] = "玩家",
    ["colour_player_class"] = "玩家职业颜色",
    ["colour_self"] = "自己",
    ["colour_self_class"] = "自身职业颜色",
    ["colour_tapped"] = "无拾取权",
    ["combat_friendly"] = "战斗动作：友善",
    ["combat_hostile"] = "战斗动作：敌对",
    ["copy_profile_label"] = "为配置输入新名称",
    ["copy_profile_title"] = "复制配置",
    ["delete_profile_label"] = "删除配置 |cffffffff%s|r?",
    ["delete_profile_title"] = "删除配置",
    ["execute_auto"] = "自动检测斩杀血量",
    ["execute_colour"] = "斩杀颜色",
    ["execute_enabled"] = "开启斩杀血量",
    ["execute_percent"] = "斩杀百分比",
    ["execute_sep"] = "斩杀血量",
    ["fade_all"] = "默认渐隐",
    ["fade_alpha"] = "渐隐开始",
    ["fade_avoid_execute_friend"] = "避开低血量友方",
    ["fade_avoid_execute_hostile"] = "避开低血量敌方",
    ["fade_avoid_nameonly"] = "避开姓名模式",
    ["fade_avoid_raidicon"] = "避开副本图标",
    ["fade_avoid_tracked"] = "避开追踪的或在战斗中的",
    ["fade_friendly_npc"] = "渐隐友善的NPC",
    ["fade_neutral_enemy"] = "渐隐中立的敌方",
    ["fade_rules_sep"] = "框体渐隐",
    ["fade_speed"] = "渐隐动画速度",
    ["fade_untracked"] = "渐隐非追踪单位",
    ["font_face"] = "文字",
    ["font_size_normal"] = "常规文字大小",
    ["font_size_small"] = "辅助文字大小",
    ["font_style"] = "文字字体",
    ["frame_glow_size"] = "框体高亮尺寸",
    ["frame_glow_threat"] = "显示威胁高亮",
    ["frame_height"] = "主血条高度",
    ["frame_height_minus"] = "辅助条高度",
    ["frame_height_personal"] = "自身框体高度",
    ["frame_width"] = "主血条宽度",
    ["frame_width_minus"] = "辅助条宽度",
    ["frame_width_personal"] = "自身框体宽度",
    ["glow_as_shadow"] = "显示框体阴影",
    ["guild_text_npcs"] = "显示NPC头衔",
    ["guild_text_players"] = "显示玩家公会",
    ["health_text"] = "显示生命值",
    ["health_text_friend_dmg"] = "友方伤害",
    ["health_text_friend_max"] = "友方最大血量",
    ["health_text_hostile_dmg"] = "敌方伤害",
    ["health_text_hostile_max"] = "敌方最大血量",
    ["health_text_sep"] = "显示生命值",
    ["hide_names"] = "隐藏未追踪姓名",
    ["ignore_uiscale"] = "忽略系统UI比例",
    ["level_text"] = "显示等级",
    ["name_text"] = "显示姓名",
    ["name_vertical_offset"] = "姓名垂直位置",
    ["nameonly"] = "使用只有姓名模式",
    ["nameonly_all_enemies"] = "包括敌方",
    ["nameonly_damaged_friends"] = "包括可被攻击的友方",
    ["nameonly_enemies"] = "包括不可攻击的敌方",
    ["nameonly_health_colour"] = "血量颜色",
    ["nameonly_in_combat"] = "正与你交战的单位",
    ["nameonly_neutral"] = "包括中立敌人",
    ["nameonly_no_font_style"] = "无文本轮廓线",
    ["nameonly_target"] = "包括目标",
    ["new_profile"] = "新配置...",
    ["new_profile_label"] = "输入配置名称",
    ["powerbar_height"] = "能量条高度",
    ["profile"] = "配置",
    ["reaction_colour_sep"] = "颜色",
    ["rename_profile_label"] = "输入新名称为 |cffffffff%s",
    ["rename_profile_title"] = "重命名配置",
    ["reset_profile_label"] = "重置配置 |cffffffff%s|r?",
    ["reset_profile_title"] = "重置配置",
    ["state_icons"] = "显示状态图标",
    ["tank_mode"] = "开启坦克模式",
    ["tankmode_colour_sep"] = "仇恨颜色",
    ["tankmode_force_enable"] = "非T天赋下的坦克模式",
    ["tankmode_force_offtank"] = "强制非坦克模式检测",
    ["tankmode_other_colour"] = "仇恨丢失",
    ["tankmode_tank_colour"] = "仇恨稳固",
    ["tankmode_trans_colour"] = "仇恨不稳",
    ["target_arrows"] = "显示目标箭头",
    ["target_arrows_size"] = "目标箭头尺寸",
    ["target_glow"] = "显示目标高亮",
    ["target_glow_colour"] = "目标高亮颜色",
    ["text_vertical_offset"] = "整体文本垂直位置",
    ["threat_brackets"] = "显示仇恨水平",
    ["title_text_players"] = "显示玩家头衔",
    ["use_blizzard_personal"] = "忽略个人姓名版",
    ["version"] = "%s 作者 %s @ Curse, 版本 %s",
}
opt["tooltips"] = {
    ["auras_enabled"] = "显示你的光环，包括友方buff，敌方的debuff",
    ["auras_icon_squareness"] = "光环图标的长宽比例，1表示正方形",
    ["auras_on_personal"] = "在个人框体上显示图标",
    ["auras_pulsate"] = "持续时间快要结束时图标闪烁",
    ["auras_time_threshold"] = "冷却文字会在当小于或等于图标上剩余时间时显示。-1表示一直显示",
    ["fade_alpha"] = "框架渐隐的不透明度。 请注意，如果设置为0（即不可见），则不可见的姓名版仍然可以单击。 插件不能随意禁用铭牌点击框",
    ["fade_avoid_nameonly"] = "不渐隐当前处于只有姓名模式的姓名版",
    ["fade_avoid_raidicon"] = "不渐隐有raid图标可见的姓名版",
    ["fade_avoid_tracked"] = "不要渐隐跟踪的姓名版或这些姓名版会影响与您的战斗。|n无论是否是跟踪的单位都可以通过更改默认界面选项下Esc > 界面 > 姓名中的“NPC名称”下拉菜单和其他复选框。",
}
