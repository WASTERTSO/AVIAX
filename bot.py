from pyrogram import Client, filters
import asyncio
import redis

app = Client("my_bot", api_id, api_hash)
redis_client = redis.Redis(host='localhost', port=6379, db=0)

@app.on_message(filters.command("play"))
async def play_music(client, message):
    song_name = message.text.split(" ")[1]
    
    if redis_client.exists(song_name):
        song = redis_client.get(song_name)
    else:
        song = await client.get_song(song_name)
        redis_client.set(song_name, song)
    
    await message.reply(song.file_id)

app.run()
