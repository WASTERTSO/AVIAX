const TelegramBot = require('node-telegram-bot-api');
const ffmpeg = require('fluent-ffmpeg');

const bot = new TelegramBot(process.env.TELEGRAM_TOKEN, { polling: true });

bot.onText(/\/play (.+)/, (msg, match) => {
  const song = match[1];
  // Play song using ffmpeg
});
