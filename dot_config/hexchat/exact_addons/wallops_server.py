"""
Wallops to server buffer
---
2024 0x5c
Public Domain
"""

import hexchat


__module_name__ = "wallops_server"
__module_version__ = "1.0.0"
__module_description__ = "Sends wallops to the server buffer"


def handle_wallops(word, word_eol, userdata, attrs):
    nick = word[0].removeprefix(":").split("!", maxsplit=1)[0]
    msg = word_eol[2].removeprefix(":")
    ctx = find_serv_buf()
    ctx.emit_print("Receive Wallops", nick, msg, time=attrs.time)
    ctx.command("GUI COLOR 3")
    return hexchat.EAT_HEXCHAT


def find_serv_buf():
    for chan in hexchat.get_list('channels'):
        if chan.type == 1 and chan.id == hexchat.get_prefs('id'):
            return chan.context


hexchat.hook_server_attrs("WALLOPS", handle_wallops)
