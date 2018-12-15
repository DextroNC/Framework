#7R bot by Joseph

import discord
import random
from discord.ext import commands
from discord.ext.commands import Bot
import asyncio
from itertools import cycle
import datetime
from datetime import timedelta
import os


from tokenKeyF import *
# sets ! as the command prefix
bot = commands.Bot(command_prefix='!') 
# Sets an array of extensions 
extensions = ['fun']
# removes the help command so own can be used
bot.remove_command('help') 


#prints info to console when bot is ready
@bot.event 
async def on_ready():
    print ("Ready master")
    print (bot.user.name)
    print (bot.user.id)
    await bot.change_presence(game=discord.Game(name="!help for commands"))

# loading command for cogs
# Params: cog name from extensions
# Output: Loads cog
@bot.command(pass_context=True)
@commands.has_any_role('NCO', 'Officer')
async def load(ctx, extension_name : str):
    try:
        bot.load_extension(extension_name)
    except (AttributeError, ImportError) as e:
        await bot.say("```py\n{}: {}\n```".format(type(e).__name__, str(e)))
        return
    await bot.say("{} loaded.".format(extension_name))



# Unloading command for cogs
# Params: cog name from extensions
# Output: unloads cogs
@bot.command(pass_context=True)
@commands.has_any_role('NCO', 'Officer')
async def unload(ctx, extension_name : str):
    bot.unload_extension(extension_name)
    await bot.say("{} unloaded.".format(extension_name))



# Reloading command for cogs
# Params: cog name from extensions
# Output: reloads cogs
@bot.command(pass_context=True)
@commands.has_any_role('NCO', 'Officer')
async def reload(ctx, extension_name : str):
    try:
        bot.unload_extension(extension_name)
    except (AttributeError, ImportError) as e:
        await bot.say("```py\n{}: {}\n```".format(type(e).__name__, str(e)))
        return
    try:
        bot.load_extension(extension_name)
    except (AttributeError, ImportError) as e:
        await bot.say("```py\n{}: {}\n```".format(type(e).__name__, str(e)))
        return



# Shows ops times
# Params: none
# Output: Times of ops    
@bot.command(pass_context=True)
async def ops(ctx):
    embedops = discord.Embed(title="Ops times", description="Wednesdays: 19:00 CET \nSaturdays: 20:00 CET\n", color=0x087B08)#creates an embed and sets the title, description and colour
    await bot.say(embed=embedops) #prints the embed    

# Shows what time it is in CET
# Params: none
# Output: The time    
@bot.command()
async def time():
    now = datetime.datetime.now() + datetime.timedelta(hours=1)
    nowTime = timedelta( hours = now.hour, minutes = now.minute)
    today = datetime.datetime.now().weekday()
    dayUntilSatOp = today - datetime.datetime(2018, 12, 15).weekday()
    dayUntilWedOp = today - datetime.datetime(2018, 12, 12).weekday()
    satOpTime = timedelta(hours = 20)
    wedOpTime = timedelta(hours = 19)
    print(now)
    print(satOpTime)
    print(wedOpTime)
    print(nowTime)
    wed = wedOpTime - nowTime
    print(wed)
    print(dayUntilWedOp)
    sat = satOpTime - nowTime
    print(sat)
    print(dayUntilSatOp)
    wedhours = wed.seconds//3600
    sathours = sat.seconds//3600
    await bot.say("It is {:%H:%M} CET".format(now))
    if (dayUntilWedOp != 0 and dayUntilWedOp <= 3):
        await bot.say("The next OP is in " + str(dayUntilWedOp) + " day(s), " + str(wed.seconds//3600) + " hour(s) and " + str((wed.seconds//60)%60) + " minute(s).")
    elif (dayUntilWedOp == 0 and wedhours < 18):
        await bot.say("The next OP is in " + str(wed.seconds//3600) + " hour(s) and " + str((wed.seconds//60)%60) + " minute(s).")
    elif (dayUntilSatOp == 0 and sathours < 19):
        await bot.say("The next OP is in " + str(sat.seconds//3600) + " hour(s) and " + str((sat.seconds//60)%60) + " minute(s).")
    else:
        await bot.say("The next OP is in " + str(dayUntilSatOp) + " day(s), " + str(sat.seconds//3600) + " hour(s) and " + str((sat.seconds//60)%60) + " minute(s).")

# Gives a link to the steam grouo
# Params: none
# Output:   
@bot.command(pass_context=True)
async def steam(ctx):
    embedsteam = discord.Embed(title="Steam Group", description="Have a look at our Steam group here:\nhttps://steamcommunity.com/groups/7thRGR", color=0x087B08)
    await bot.say(embed=embedsteam)
    
@bot.command(pass_context=True)
async def unit(ctx):#shows link to arma unit page
    embedunit = discord.Embed(title="Arma Unit", description="Have a look at our Arma unit here:\nhttps://units.arma3.com/unit/7rgr", color=0x087B08)
    await bot.say(embed=embedunit)
    
    
@bot.command(pass_context=True)
async def ping(ctx): #ping command for testing
    await bot.say("Pong!")
    
@bot.event
async def on_command_error(error, ctx): #cooldown message if command is used when on cooldown
    if isinstance(error, commands.CommandOnCooldown):
        await bot.send_message(ctx.message.channel, content="I'm reloading. Try again in %.2fs." % error.retry_after)
    raise error  # re-raise the error so all the errors will still show up in console


    
@bot.command(pass_context=True)
async def info(ctx, user: discord.Member): 
    embedinfo = discord.Embed(title="{}'s info".format(user.name), description="Here's what I found.", color=0x087B08)#creates an embed and sets the title, description and colour
    embedinfo.add_field(name="Name", value=user.name, inline=True)#adds new field with attributes to embed
    embedinfo.add_field(name="Status", value=user.status, inline=True)#adds new field with attributes to embed
    embedinfo.add_field(name="Role", value=user.top_role)#adds new field with attributes to embed
    embedinfo.add_field(name="Joined", value=user.joined_at)#adds new field with attributes to embed
    embedinfo.set_thumbnail(url=user.avatar_url)#adds thumbnail
    await bot.say(embed=embedinfo) #prints the embed

    
    
@bot.command(pass_context=True)
async def training(ctx):
    embedtraining = discord.Embed(title="Training", description="Flight Training is on Saturdays at 16:00 CET and run by Gustav1101  \nYou can always ask for training for your qualifications from an authorised instructor. Use !instructors to find out who that is.", color=0x087B08)#creates an embed and sets the title, description and colour
    await bot.say(embed=embedtraining) #prints the embed
    
@bot.command()
async def instructors():
    embedinstructors = discord.Embed(title="Instructor", description="List of all Instructors - Message who you need to schedule training/qualifying.", color=0x087B08)
    embedinstructors.add_field(name="Infantry Qualification", value="Merc and FluffyThumper", inline=False)
    embedinstructors.add_field(name="Heavy Weapons Qualification", value="Merc", inline=False)
    embedinstructors.add_field(name="Marksman Qualification", value="Evilknievel and Daedalor", inline=False)
    embedinstructors.add_field(name="Engineer Qualification", value="Daedalor", inline=False)
    embedinstructors.add_field(name="Medic Qualification", value="Merc", inline=False)
    embedinstructors.add_field(name="Rotary Qualification", value="Gustav1101", inline=False)
    await bot.say(embed=embedinstructors)
    
@bot.command(pass_context=True)
async def video(ctx): #Link a 7R video
    file = open("video.txt", "r")
    video = file.read()
    await bot.say(video)

@bot.command()
@commands.has_any_role('Members', 'NCO', 'Officer')
async def addvideo(link):
    file = open("video.txt","w")
    file.write(link)
    file.close()
    await bot.say("Your video has been added.")

    
@bot.command(pass_context=True)
async def help(ctx): #lists all the commands and what they do
    embedhelp = discord.Embed(title="List of commands", description="All commands start with an ! and are all lowercase no matter what it says below\nOps - Shows Ops times\nTraining - Shows training information\nIntructors - Shows the instructors \nInfo @user - shows info about a user\nWebsite - Gives a link to the website\nVideo - Gives a link to a 7R video\nServer - Shows server details\nTeamspeak - Shows teamspeak details\nApp - Gives link to Application\nHandbook - Shows link to Handbook\nTime - Give the current time in timezone we use.\nSteam - Gives a link to the steamgroup\nUnit - Gives a link to the arma unit\nFunhelp - Fun hidden here", color=0x087B08)
    await bot.say(embed=embedhelp)
    
@bot.command(pass_context=True)
@commands.has_any_role('Members', 'NCO', 'Officer')
async def funhelp(ctx):
        embedfunhelp = discord.Embed(title="List of fun commands", description="These are fun commands and should only be used for fun! (and written in lowercase)\nMeme - Shows a meme image with a caption\nFF - Friendly Fire...\nSlav - Lunete being a slav\nMonkey - Which squad is it today?\nRoll (number) - Rolls a numbers between 1 and what is picked\nRand (number1) (number2) - Picks a number between the two numbers typed\nChoose (text1) (text2) - Picks between the two choices\nEightball - Answers a yes/no question\nMedic - Where is he?\nrps (choice) - Let's play a game! ", color=0x087B08)
        await bot.say(embed=embedfunhelp)
        
    
@bot.command(pass_context=True)
async def website(ctx):#links website
    embedwebsite = discord.Embed(title="Website", description="https://www.7th-ranger.com/", color=0x087B08)#creates an embed and sets the title, description and colour
    await bot.say(embed=embedwebsite) #prints the embed
    
@bot.command(pass_context=True)
async def server(ctx):#shows server details
    embedserver = discord.Embed(title="Server info", description="Here is the server info.", color=0x087B08)#creates an embed and sets the title, description and colour
    embedserver.add_field(name="Server IP", value="arma.orbitalstrikeforce.com")
    embedserver.add_field(name="Password", value="orbs", inline=False)
    await bot.say(embed=embedserver) #prints the embed
    
@bot.command(pass_context=True)
async def teamspeak(ctx):#shows teamspeak address
    embedteamspeak = discord.Embed(title="Teamspeak Address", description="TS.7th-ranger.com", color=0x087B08)#creates an embed and sets the title, description and colour
    await bot.say(embed=embedteamspeak) #prints the embed
    
@bot.command(pass_context=True)
async def app(ctx):#shows link to application
    embedapp = discord.Embed(title="Application Form", description="Submit your app here:\nhttps://www.7th-ranger.com/armarecruitment", color=0x087B08)
    await bot.say(embed=embedapp)
    
@bot.command(pass_context=True)
async def faq(ctx):#displays FAQ
    await bot.say("FAQ\nTo be completed soon tm")
    
@bot.command(pass_context=True)
async def handbook(ctx):#gives link to handbook
    embedhandbook = discord.Embed(title="Handbook", description="https://www.7th-ranger.com/armaguide/m/40131059/page/Introduction", color=0x087B08)#creates an embed and sets the title, description and colour
    await bot.say(embed=embedhandbook)#prints the embed


@bot.event
async def on_member_join(member):
    channel = member.server.get_channel("305471712546390017")
    msg = "Hi {}\nWelcome to the 7R Discord.\nPlease ping a Recruiter if you have any questions. Our Members will also be able to help you.\nPlease note you're only seeing a tiny part of the discord.\nHave a nice stay!".format(member.name)
    print(channel)
    await bot.send_message(channel, msg)
    embedapp = discord.Embed(title="Application Form", description="Submit your app here:\nhttps://www.7th-ranger.com/armarecruitment", color=0x087B08)
    await bot.send_message(channel, embed=embedapp)
   
    
            
if __name__ == "__main__":
    for extension in extensions:
        try:
            bot.load_extension(extension)
        except Exception as e:
            exc = '{}: {}'.format(type(e).__name__, e)
            print('Failed to load extension {}\n{}'.format(extension, exc))

    
#@bot.command()
#async def reddit():
    #await bot.say("@here Upvote \nLink to reddit ")

bot.run(tokenKey) #makes the bot run