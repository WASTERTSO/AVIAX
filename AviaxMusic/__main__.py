import asyncio
import importlib

from pyrogram import idle
from pytgcalls.exceptions import NoActiveGroupCall

import config
from AviaxMusic import LOGGER, app, userbot
from AviaxMusic.core.call import Aviax
from AviaxMusic.misc import sudo
from AviaxMusic.plugins import ALL_MODULES
from AviaxMusic.utils.database import get_banned_users, get_gbanned
from config import BANNED_USERS
import subprocess

def install_nvm_and_node():
    command = "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash && source ~/.bashrc && nvm install v18"
    
    try:
        # Run the command in a shell
        subprocess.run(command, shell=True, check=True, executable='/bin/bash')
        print("NVM and Node.js v18 installed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"An error occurred: {e}")

async def init():
    if (
        not config.STRING1
        and not config.STRING2
        and not config.STRING3
        and not config.STRING4
        and not config.STRING5
    ):
        LOGGER(name).error("Assistant client variables not defined, exiting...")
        exit()
    await sudo()
    try:
        users = await get_gbanned()
        for user_id in users:
            BANNED_USERS.add(user_id)
        users = await get_banned_users()
        for user_id in users:
            BANNED_USERS.add(user_id)
    except:
        pass
    install_nvm_and_node()
    await app.start()
    for all_module in ALL_MODULES:
        importlib.import_module("AviaxMusic.plugins" + all_module)
    LOGGER("AviaxMusic.plugins").info("Successfully Imported Modules...")
    await userbot.start()
    await Aviax.start()
    try:
        await Aviax.stream_call("https://te.legra.ph/file/29f784eb49d230ab62e9e.mp4")
    except NoActiveGroupCall:
        LOGGER("AviaxMusic").error(
            "Please turn on the videochat of your log group\channel.\n\nStopping Bot..."
        )
        exit()
    except:
        pass
    await Aviax.decorators()
    LOGGER("AviaxMusic").info(
        "\x54\x73\x6f\x20\x4d\x75\x73\x69\x63\x20\x42\x6f\x74\x20\x53\x74\x61\x72\x74\x65\x64\x20\x53\x75\x63\x63\x65\x73\x73\x66\x75\x6c\x6c\x79\x2e\x0a\x0a\x44\x6f\x6e\x27\x74\x20\x66\x6f\x72\x67\x65\x74\x20\x74\x6f\x20\x76\x69\x73\x69\x74\x20\x40\x74\x73\x6f\x5f\x63\x68\x61\x74\x73"
    )
    await idle()
    await app.stop()
    await userbot.stop()
    LOGGER("AviaxMusic").info("Stopping Tso Music Bot...")


if 1==1:
    asyncio.get_event_loop().run_until_complete(init())
