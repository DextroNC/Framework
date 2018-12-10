#7R bot by Joseph

import discord
import random
from discord.ext import commands
from discord.ext.commands import Bot
import asyncio
from itertools import cycle
import datetime


from tokenKeyF import *

bot = commands.Bot(command_prefix='!') #sets ! as the command prefix

bot.remove_command('help') # removes the help command so own can be used



@bot.event #prints info to console when bot is ready
async def on_ready():
    print ("Ready master")
    print (bot.user.name)
    print (bot.user.id)
    await bot.change_presence(game=discord.Game(name="!help for commands"))
        
    
@bot.command(pass_context=True)
async def ops(ctx):
    embedops = discord.Embed(title="Ops times", description="Wednesdays: 19:00 CET \nSaturdays: 20:00 CET\n", color=0x087B08)#creates an embed and sets the title, description and colour
    await bot.say(embed=embedops) #prints the embed    
    
@bot.command()
async def time():
    now = datetime.datetime.now() + datetime.timedelta(hours=1)
    print(now)
    await bot.say("It is {:%H:%M} CET".format(now))
    
@bot.command(pass_context=True)
async def steam(ctx):#shows link to steam group
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
   
    
    
    
@bot.command(pass_context=True)
@commands.has_any_role('Members', 'NCO', 'Officer')
async def eightball(ctx):#gives an answer to a yes no question
    possible_responses = ["That's a no from me", 'I doubt it', 'Maybe', 'Probably',  'Definitely']#array with possible responses
    await bot.say(random.choice(possible_responses))#chooses response 
    
@bot.command(pass_context=True)
@commands.has_any_role('Members', 'NCO', 'Officer')
@commands.cooldown(1, 30, commands.BucketType.user)#adds cooldown for user for command
async def ff(ctx):#shoutouts user for friendly fire
    channel = ctx.message.channel.id
    print(ctx.message.channel.id)
    if channel == "305472012841910272" or "449619348978663444":
        ffbad = ['Maale', 'Merc', 'Nicolai']#array of user IDs
        ffmsg = [' FRIENDLY FIRE', ' BLUE ON BLUE', ' STOP SHOOTING ME', ' you damn monkey']#array of  jokey responses
        await bot.say("@" + (random.choice(ffbad)) +  (random.choice(ffmsg)))#adds the choices from the 2 arrays together
    else:
        await bot.say("You can only use that command in the chatbox or the bot command channel.")
    
@bot.command()
@commands.has_any_role('Members', 'NCO', 'Officer')
async def roll(num1 : int):#rolls a number between 1 and whatever number said. HAS TO BE AN INT
        await bot.say("You rolled a {}".format(random.randint(1, num1)))#prints number and text combined

@bot.command()
@commands.has_any_role('Members', 'NCO', 'Officer')
async def rand(num1 : int, num2 : int):#picks a number between two numbers entered
        await bot.say(random.randint(num1, num2))#states the result
    
@bot.command(pass_context=True)
@commands.has_any_role('Members', 'NCO', 'Officer')
async def monkey(ctx):#chooses a monkey squad
    squad = ['Alpha', 'Bravo', 'Platoon']#array of squad names
    await bot.say((random.choice(squad)) + " is the monkey squad.")#picks squad then adds text afterwards and prints
    

@bot.command(pass_context=True)
@commands.has_any_role('Members', 'NCO', 'Officer')
@commands.cooldown(1, 30, commands.BucketType.user)#adds cooldown for user for command
async def meme(ctx):#shows a meme image
    channel = ctx.message.channel.id
    print(ctx.message.channel.id)
    if channel == "305472012841910272" or "449619348978663444":
        memezimg = ['https://cdn.discordapp.com/attachments/452195429464145960/452200037875843083/evilhitler.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452200351643336715/traintracks.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452200441170886658/dedbem.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201039312060436/toilet.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201120627032064/dolphin.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201378023079938/art.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201483321081897/overwatch.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201621544370176/rpg.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201724384641050/wnc.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201875224133652/split.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452202500158783499/moru.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452202580614053888/compen.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452202691599400960/yoga.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452202837225766932/weasel.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452202922177069057/plteo.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452202996764508170/mixtape.jpg', 'https://cdn.discordapp.com/attachments/305472092978020352/452444510484692993/20180602143613_1.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/469218045970219009/high_five.jpg', 'https://cdn.discordapp.com/attachments/305472012841910272/507290324012367881/107410_screenshots_20181031212335_1.jpg']
        memedesc = ['Evil Hitler or Hitler Evil?', "Don't stand on train tracks kids", "Is he dead?", "NSFW - Not Safe For War", "Dolphin Sniping", "That's art - Evil", "Overwatch", "When Evil is pushed too far", "War, War never changes", ":-)", "For Mother Russia", "I wonder what Lunete does to compensate for his small...", 'Yoga before War', "Just... lol", "Platoon Lead's during every op", "7R mixtape coming at ya", "Hi","... then we meet in the open field and give Alpha high fives", "I think there's an IED in here."]
        number = random.randint(0, (len(memezimg) - 1))
        await bot.say(memezimg[number])
        await bot.say(memedesc[number])
    else:
        await bot.say("You can only use that command in the chatbox or the bot command channel.")
        
    
@bot.command(pass_context=True) 
@commands.cooldown(1, 30, commands.BucketType.user)
@commands.has_any_role('Members', 'NCO', 'Officer')
async def slav(ctx):
    channel = ctx.message.channel.id
    if channel == "305472012841910272" or "449619348978663444":
        slavi = ['https://cdn.discordapp.com/attachments/452195429464145960/452195497294299137/slav1.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452195899758608394/slav2.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452195971418292225/slav3.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452196070001475584/slav4.jpg', 'https://cdn.discordapp.com/attachments/305472012841910272/521392543129403393/20181209175448_1.jpg']
        await bot.say(random.choice(slavi))
    else:
        await bot.say("You can only use that command in the chatbox.")
    
@bot.command()
@commands.has_any_role('Members', 'NCO', 'Officer')
async def choose(text1 : str, text2 : str):#chooses between two texts
    choice = [text1, text2] #creates array with the two entered texts
    await bot.say(random.choice(choice))#chooses one of the two texts and says it
    
@bot.command()
@commands.has_any_role('Members', 'NCO', 'Officer')
async def medic():
    medic = ["I NEED A MEDIC!", "MEDIC!", "WHERE'S THE DAMN MEDIC", "CORPSMAN!"]
    await bot.say(random.choice(medic))
    
@bot.command()
@commands.has_any_role('Members', 'NCO', 'Officer')
async def rps(choice):
        botChoices = [ "Rock", "Paper", "Scissors" ]
        botChoice = random.choice(botChoices)
        result = ""
        choice=choice.lower()
        if choice == "rock":
            if botChoice == "Scissors":
                result = "Win"
            elif botChoice == "Rock":
                result = "Draw"
            else:
                result = "Loss"
        elif choice == "paper":
            if botChoice == "Rock":
                result = "Win"
            elif botChoice == "Paper":
                result = "Draw"
            else:
                result = "Loss"
        elif choice == "scissors":
            if botChoice == "Paper":
                result = "Win"
            elif botChoice == "Scissors":
                result = "Draw"
            else:
                result = "Loss"
        else:
            await bot.say("You need to pick either Rock, Paper or Scissors!")

        if result != "":
            await bot.say("I picked: {}".format(botChoice))
        if result == "Win":
            await bot.say("You won! Congratulations")
        elif result == "Draw":
            await bot.say("We drew! Replay?")
        elif result == "Loss":
            await bot.say("You lost! Better luck next time!")
            

    
#@bot.command()
#async def reddit():
    #await bot.say("@here Upvote \nLink to reddit ")

bot.run(tokenKey) #makes the bot run