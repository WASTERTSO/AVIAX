HELP_1 = """<b><u>Admin Commands:</b></u>

Just add <b>c</b> in the starting of the channel commands to use them for channel

/pause : Pause the current playing stream

/resume : Resume the paused stream

/skip : Skip the current playing stream and start streaming the next track in queue

/end or /stop : Clear the queue and end the current playing stream

/player : Get a interactive player panel

/queue : Shows the queue tracks list
"""

HELP_2 = """
<u><b>Channel Play:</b></u>

You can stream audio/video in channel

/cplay : Starts streaming the requested audio track on channel's videochat
/cvplay : Starts streaming the requested video track on channel's videochat
/cplayforce or /cvplayforce : Stops the ongoing stream and startz streaming the requested track

/channelplay [Chat username or id] or [disable] : Connect channel to a group and starts streaming tracks by the help of commands sent in group
"""

HELP_3 = """
<u><b>Global Ban</b></u> [only for sudousers] :

/gban [Username or reply to a user] : Globally bans the chutiya from all the served chats and blacklist him from using the bot
/ungban [Username or reply to a user] : Globally unbans the globally banned user
/gbannedusers : Shows the list of globally banned users
"""

HELP_4 = """
<b><u>Loop Stream :</b></u>

<b>Starts streaming the ongoing stream in loop</b>

/loop [enable/disable] : Enable/Disable loop for the ongoing stream
/loop [1, 2, 3, ...] : Enables the loop for the given value
"""


HELP_5 = """
<u><b>Play Commands :</b></u>

<b>v :</b> Stands for video play
<b>force :</b> Stands for force play

/play or /vplay : Starts streaming the requested track on videochat

/playforce or /vplayforce : Stops the ongoing stream and starts streaming the requested track
"""

HELP_6 = """
<b><u>Shuffle Queue:</b></u>

/shuffle : Shuffle's the queue
/queue : Shows the shuffled queue
"""

HELP_7 = """
<b><u>Seek Stream :</b></u>

/seek [Duration in seconds] : Seek the stream to the given duration
/seekback [Duration in seconds] : Backward seek the stream to the given duration
"""

HELP_8 = """
<b><u>Song Download</b></u>

/song [Song name/yt url] : Download any track from youtube in mp3 or mp4 formats
"""
