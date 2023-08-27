import telebot
import functions

token = "6634635160:AAG2A8EHdfRafEOZUsKgpEjAaz8uWy0yjYg"
bot = telebot.TeleBot(token)

if __name__ == '__main__':
    pr_title, contributor_login, time_of_applying_changes, repo_name = functions.parse_command_line_args()
    bot.send_message(chat_id=453041569, text=f"*{pr_title}*\n\n{contributor_login}\n{time_of_applying_changes}\n{repo_name}", parse_mode='Markdown')