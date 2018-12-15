import discord
import random
from discord.ext import commands
from discord.ext.commands import Bot
import asyncio
from itertools import cycle
from discord.utils import get
import datetime
import os

class Fun():
    def __init__(self, bot):
        self.bot = bot



    @commands.command(pass_context=True)
    @commands.has_any_role('Members', 'NCO', 'Officer')
    async def eightball(self, ctx):#gives an answer to a yes no question
        possible_responses = ["That's a no from me", 'I doubt it', 'Maybe', 'Probably',  'Definitely']#array with possible responses
        await self.bot.say(random.choice(possible_responses))#chooses response 
    
    @commands.command(pass_context=True)
    @commands.has_any_role('Members', 'NCO', 'Officer')
    @commands.cooldown(1, 30, commands.BucketType.user)#adds cooldown for user for command
    async def ff(self, ctx):#shoutouts user for friendly fire
        channel = ctx.message.channel.id
        print(ctx.message.channel.id)
        if channel == "305472012841910272" or "449619348978663444":
            ffbad = ['Maale', 'Merc', 'Nicolai']#array of user IDs
            ffmsg = [' FRIENDLY FIRE', ' BLUE ON BLUE', ' STOP SHOOTING ME', ' you damn monkey']#array of  jokey responses
            await self.bot.say("@" + (random.choice(ffbad)) +  (random.choice(ffmsg)))#adds the choices from the 2 arrays together
        else:
            await self.bot.say("You can only use that command in the chatbox or the bot command channel.")
    
    @commands.command()
    @commands.has_any_role('Members', 'NCO', 'Officer')
    async def roll(self, num1 : int):#rolls a number between 1 and whatever number said. HAS TO BE AN INT
        await self.bot.say("You rolled a {}".format(random.randint(1, num1)))#prints number and text combined

    @commands.command()
    @commands.has_any_role('Members', 'NCO', 'Officer')
    async def rand(self, num1 : int, num2 : int):#picks a number between two numbers entered
        await self.bot.say(random.randint(num1, num2))#states the result
    
    @commands.command(pass_context=True)
    @commands.has_any_role('Members', 'NCO', 'Officer')
    async def monkey(self, ctx):#chooses a monkey squad
        squad = ['Alpha', 'Bravo', 'Platoon']#array of squad names
        await self.bot.say((random.choice(squad)) + " is the monkey squad.")#picks squad then adds text afterwards and prints
    

    @commands.command(pass_context=True)
    @commands.has_any_role('Members', 'NCO', 'Officer')
    @commands.cooldown(1, 30, commands.BucketType.user)#adds cooldown for user for command
    async def meme(self, ctx):#shows a meme image
        channel = ctx.message.channel.id
        print(ctx.message.channel.id)
        if channel == "305472012841910272" or "449619348978663444":
            memezimg = ['https://cdn.discordapp.com/attachments/452195429464145960/452200037875843083/evilhitler.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452200351643336715/traintracks.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452200441170886658/dedbem.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201039312060436/toilet.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201120627032064/dolphin.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201378023079938/art.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201483321081897/overwatch.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201621544370176/rpg.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201724384641050/wnc.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452201875224133652/split.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452202500158783499/moru.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452202580614053888/compen.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452202691599400960/yoga.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452202837225766932/weasel.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452202922177069057/plteo.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452202996764508170/mixtape.jpg', 'https://cdn.discordapp.com/attachments/305472092978020352/452444510484692993/20180602143613_1.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/469218045970219009/high_five.jpg', 'https://cdn.discordapp.com/attachments/305472012841910272/507290324012367881/107410_screenshots_20181031212335_1.jpg']
            memedesc = ['Evil Hitler or Hitler Evil?', "Don't stand on train tracks kids", "Is he dead?", "NSFW - Not Safe For War", "Dolphin Sniping", "That's art - Evil", "Overwatch", "When Evil is pushed too far", "War, War never changes", ":-)", "For Mother Russia", "I wonder what Lunete does to compensate for his small...", 'Yoga before War', "Just... lol", "Platoon Lead's during every op", "7R mixtape coming at ya", "Hi","... then we meet in the open field and give Alpha high fives", "I think there's an IED in here."]
            number = random.randint(0, (len(memezimg) - 1))
            await self.bot.say(memezimg[number])
            await self.bot.say(memedesc[number])
        else:
            await self.bot.say("You can only use that command in the chatbox or the bot command channel.")
        
    
    @commands.command(pass_context=True) 
    @commands.cooldown(1, 30, commands.BucketType.user)
    @commands.has_any_role('Members', 'NCO', 'Officer')
    async def slav(self, ctx):
        channel = ctx.message.channel.id
        if channel == "305472012841910272" or "449619348978663444":
            slavi = ['https://cdn.discordapp.com/attachments/452195429464145960/452195497294299137/slav1.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452195899758608394/slav2.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452195971418292225/slav3.jpg', 'https://cdn.discordapp.com/attachments/452195429464145960/452196070001475584/slav4.jpg', 'https://cdn.discordapp.com/attachments/305472012841910272/521392543129403393/20181209175448_1.jpg']
            await self.bot.say(random.choice(slavi))
        else:
            await self.bot.say("You can only use that command in the chatbox.")
    
    @commands.command()
    @commands.has_any_role('Members', 'NCO', 'Officer')
    async def choose(self, text1 : str, text2 : str):#chooses between two texts
        choice = [text1, text2] #creates array with the two entered texts
        await self.bot.say(random.choice(choice))#chooses one of the two texts and says it
    
    @commands.command()
    @commands.has_any_role('Members', 'NCO', 'Officer')
    async def medic(self):
        medic = ["I NEED A MEDIC!", "MEDIC!", "WHERE'S THE DAMN MEDIC", "CORPSMAN!"]
        await self.bot.say(random.choice(medic))
    
    @commands.command()
    @commands.has_any_role('Members', 'NCO', 'Officer')
    async def rps(self, choice):
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
            await self.bot.say("You need to pick either Rock, Paper or Scissors!")

        if result != "":
            await self.bot.say("I picked: {}".format(botChoice))
        if result == "Win":
            await self.bot.say("You won! Congratulations")
        elif result == "Draw":
            await self.bot.say("We drew! Replay?")
        elif result == "Loss":
            await self.bot.say("You lost! Better luck next time!")
            

def setup(bot):
     bot.add_cog(Fun(bot))




