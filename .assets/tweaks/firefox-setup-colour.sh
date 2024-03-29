#!/usr/bin/env bash
source '../include.sh'
CATPPUCCIN_MOCHA='https://color.firefox.com/?theme=XQAAAAJHBAAAAAAAAABBqYhm849SCicxcUcPX38oKRicm6da8pFtMcajvXaAE3RJ0F_F447xQs-L1kFlGgDKq4IIvWciiy4upusW7OvXIRinrLrwLvjXB37kvhN5ElayHo02fx3o8RrDShIhRpNiQMOdww5V2sCMLAfehhpWbjL_1RPuSDS6JMrP5SMm3V5s8DPdjrylB8odQkBKx3hwS8DfSgUd_K1gnYDiqF6FLqjZ1i5o2Ag7ndcuIMtTOff0Mv_AUAr9gmCgTwJLuHS5akRaMkSVVO8YgQjswELYw-q6z3M9DY23nuubC_GQIUqlw0_94uTV6vwegBVDkZbRRpVsBlfXUf_GqVF9q79Pr6uBA49roImTVMPyDZ9TZWf4oGlebH55k7lGonhR7tIVq6T0EitalyQmofr7ZRrkD9AZTe2f1aJuLnVsX_37dxUN2Qzo48s6AGZ7O1x-eVU1x4fGwGN3uMKhlk7umStxFC_xhSJTiVloH7_g2XYIb96FY63jjMAnWH3NlYewHQpDH4WEe-AcSxUy9IkyEnirYFd0aPe_x62ahv3L4HEH_8pylyA'

if cmd_check 'firefox-beta'; then
	FIREFOX='firefox-beta'
elif cmd_check 'firefox'; then
	FIREFOX='firefox'
else
	log_error "Firefox not installed!"
fi

paru -S --needed firefox-color
${FIREFOX} "${CATPPUCCIN_MOCHA}"
