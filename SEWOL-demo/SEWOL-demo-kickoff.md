# SEWOL Demo Kickoff - 2026/06/08 15:58 EDT - Gemini Transcript

Transcript
Dan M: All I think the rest of each other but don't know me. So I'm Dan. I believe this beginning of my fourth week at Rise 8. and this was one of the first things I did was help Clayton with this seaw wall proposal. There's a ton of context. hopefully everybody had a chance to at least sort of flip through the documents that I provided, but I'm going to try to set this up. Please feel free to interrupt at any point if you have questions or save it. whatever. I'm not rigid about this.

Dan M: So seaw wall what we're going to talk about here in the context of this opportunity is a three-year effort to replace the manually intensive EWC2 processes that mission delta 3 is the customer here that their EWOs go through. there shouldn't be anything surprising here both around manual processes around EW and around C2 targeting asset management scheduling and pairing and COP because everybody in DoD has a COP in 2026. This is a multiple multifphased effort if you will.

Dan M: So, we're here today. What we're going to talk about is what happens between now and the end of July. So, we submitted a technical proposal that I put in the channel so everybody had the chance to read about what we would deliver for this entire effort. We submitted that at the beginning of June. So we expect to hear back the beginning of July if we were selected to participate in this presentation and demonstration which is the third or fourth week of July. All we know about what happens in July is that it is an person presentation and demonstration of working software and then a tabletop exercise of what they call their agile and design process.

Dan M: out of that July activity, the government is going to select up to three vendors, so hopefully us and two other vendors to do a threemonth sprint or a three-month competition, if you will. and then at the end of that three months, they're going to down select one or potentially none, but they're going to select one of the three vendors to then do to go on to phase two, which is another six months. And then if all of that goes however many months to get us to three years is phase three. 36 minus 9, 27 months. So that's the goal here, right?

Dan M: is we want to put together a credible demonstration in July so that we can be one of the three that are selected and then we want to execute in that three months so that we can be the one team that's selected to do the big work which is phase two is $10 million and then phase three is $40 million. those of you on the call may or may not be on the team that ultimately ends up doing the work come phase three. don't know what that's going to look like yet, but for now just focus on between now and July. Any questions so far cool I put this in the chat. This is the road map that the government provided.

Dan M: So the first column here the mission app MVP down select is phase one. So in order for us to get onto this road map we have to get through July. This is small I know it is what it says in PI1 which is their 12week program increment is stuff like the framework SDK and then the core functionality target management mission management scheduling there's an integration down here for UDL work core and to start planning for project 7 integration none of that is strictly relevant except

Dan M: that if we wait, the reason we're doing this now is if we wait until August to start, there's no way we're going to do all of this in 3 months. So, first priority here is put together a credible demonstration. I'm going to talk about what that looks like. but also we really just want to get started so that the team who hits the ground in August is not starting from zero. they're starting from something so that they can actually deliver and ideally beat our competition in that 3-month window. So, the MVP, I'm going to sort of work backwards with that in mind, I'm going to work backwards like what the government has said they expect the quote unquote MVP to look like in November, which is at the end of that three-month window. So from the operator's perspective they can ingest a formal STTO directly from project 7 or create one.
00:05:00

Dan M: They can manage geo only targets and then they can initiate an automated pairing process to pair assets to targets to tasks to fill out that STTO to visualize it on a globe to see it on a sync matrix to be able to do deconliction and then ultimately to be able to hand something to system operators. they give four specific capabilities that they expect to be able to do at the end of that to machine interface with project 7 which strictly speaking is not what their road map says but I think it's open to our interpretation. There's an ability to build a slice of that integration if not the entire data exchange for STTO plan pair schedule that's resilient.

Dan M: So if project 7 is not available, they can create spins, and manage all of that within our framework. a map they want an operator experience. So a globe, a sync matrix, an actual interface, and then an SDK, what they call mature SDK. this I think is one of the main opportunities for us to differentiate ourselves. So just something to keep in mind. And then they also give what it looks like to exceed the baseline. So they give some examples. The first one is achieving a continuous authority to operate. This is where I think we are going to stand out. nobody does this Rise 8. Then there's other stuff around mature digital support center. I'm not really sure what that means other than I guess automated support maybe. Chats are for integration.

Dan M: feels kind of easy if we find we have time over the next few weeks and then MO and LEO targets. again for July. This is exceeding the baseline in November. So how do we win? What is getting to phase one look like? they tell us what they're going to do. So they are reviewing the written proposals which is what they're doing right now. They're going to notify and invite us hopefully in the first week of July and tell us when we go do this presentation and demonstration. And then this is all that they've told us that it looks like is literally a demonstration of working software plus a tabletop exercise of agile design development methodologies. That's literally all they've said. Have no idea what else it's going to entail.

Dan M: And then assuming we do well in July, that three-month window, so getting to phase two, they're going to evaluate the products of all three vendors. They're going to look at demonstrations. They're going to look at the quality of features. They're going to look at the process and utility, all of these things to make a decision how they get from the three vendors down to one for phase two and phase three. So, we know what they're looking at. We know what they're going to evaluate. we sort of know if not the specific things that are going to be on the test, we know the structure of the test. So, Rise 8 how do we differentiate ourselves? How do we stand out against the competition? That candidly is going to include things like Anderil's Lattis, right? big vendors who do quote unquote C2. so we're going to build on Mission core OS.

Dan M: We're going to build on mission OS core. Sorry for that. continuous ATO is one of the things that they call out right. So primarily in July especially I think we're going to spend a lot of time talking about the utility of mission OS core and rise experience in continuous ATO like our industry leadership in that space our emphasis on security and build credibility for that specifically. The second thing is thirdparty integrators as first class citizens.

Dan M: If anybody has spent any time building in MOSA or talking to the government about MOSA, the thing that tends to happen here is that companies take this sort of approach to MOSA where as long as we can integrate anything like we are treating that as modular and open- source architecture and meeting that MOSA requirement. I think the thing that's going to help us stand out here is not building ourselves as the bottleneck or building ourselves as the center of gravity but treating the true thirdparty integrations as the goal.
00:10:00

Dan M: So can somebody who is not rise 8 can a third-party integrator pick up our SDK can they pick up the documentation that we provide the ICDs that we provide whatever that is and easily build on the system that is going to be a thing that's on the test and I say from top to bottom because there's application SDKs can they build on the framework but there's also the platform so mission OS core itself and then AI first SDKs they call out a couple times being AI first.

Dan M: This is I think an area where we can do some experimentation over the next few weeks but in my mind this is at both the application and platform level first capabilities so type libraries CLIs MCP servers maybe AI first documentation but treating those thirdparty integrations not just as a development team from another company but if somebody were building or if we were building a Gentic cap

Dan M: capabilities on top of this framework supporting that on the loop or without human intervention and then the tabletop exercise even though we don't know what it looks like given that it is agile and design process I think we will and we need to shine in that environment I think in my experience nobody does this rise 8 so I think it's an opportunity for us to show that any questions here yeah Sean

Dan: I agree 100%. For July. So the government's stance is that there is no capability for this seaw wall project. There's no capability that exists. But there are systems they call out that we need to integrate with for phase one, two, and three. So for July one of the things that I've talked to the team internally about is that there are integrations here that Rise 8 has firsthand knowledge of specifically UDL and Warport and then Shfire which is a two integration I think. Let me find it. Yeah, Shfire starts in phase two.

Dan: So there are integrations that we could build if we find we have time between now and July to build credibility. We could build real integrations, right? Or at least real adapters because there's classification concerns to help tell that story specifically. but I agree wholeheart that's when I say where did I have it? this guy so third party integrators as first class citizens.

Dan: I think what you just said is exactly what I'm feeling is that can other people integrate with us without doing a rain dance in voodoo and relying on our FTEEs. So to me what this looks like is between now and July I think we have some space for experimentation like I said and I'll talk about why in a second. We have to build on Mission Noah's core because we have to demonstrate that we have to talk about it in July. It's a big part of our proposal and it's going to be our big differentiator. So to me that means and I don't know I haven't seen if Mike or Drew joined, but to me that means the continuous atto piece.

Dan: to the pipelines, the onboarding stuff that I think they showed today developer experience for how people other than Rise 8 build on the framework. I think we need to build a data tier and show credibility for realistic data for realistic ontology here for things like space tasking order for jeros for CDAS things that are common to the space that we're not going to have time to do discovery and build in three months when we need to actually build the operator experience domain services and I like I think slices here

Dan: or a slice here of domain service to meet this EW and C2 capabilities that they're talking about. So this to me for example is a pairing service like target management, asset management, we need to be able to create an STO things like that that don't feel particularly heavy to me. And then an SDK layer I just talked about around an adapter model around libraries and CLIs and documentation that allow other people to integrate and then our own operator experience. So a globe forms to STTO a button to click to do pairing a sync matrix those types of things.

Dan: Also I vibe coded this operator experience myself in a half a day that part doesn't feel particularly like a heavy lift. SDKs are going to be important here. So at the application layer is it easy to push data and pull data from the domain services? at the technical level are we providing open API capabilities, hyped libraries in different languages, CLIs, documentation at the platform level.


Dan: So at the mission OS core level that SDK as well onboarding automation which I know we're building pipeline and scaffolding automation which I know we have some of and are maybe building documentation reference projects that people can use to get started or whatever and then AI first and I forgot to actually change the bullets here AI first sorry so treating agentic capabilities as one of our core users of the platform. is it easy for claude to come in or aentic developers to come in as external users and actually integrate with the platform to build on the SDK to get observability data out of the platform things like that. Mike

Mike Gehard: Dan, do you have any…
Mike Gehard: what is your definition of age AI or agentic first just so we're dealing with ubiquitous language here not all guessing
Dan: there. …

Dan: between now and July, I think anything we can demonstrate to be credible between now and November, they have some things that they want. So, they want an agent to agent interface, for example. there's some requirements they have for the MVP and for phase two. I think for us meeting their requirements between now and July are not as important as picking where we think we can shine where we think we can demonstrate credibility.

Dan: I think for example in the operator experience if we could build in the operator experience we could have an AI side panel right like a chat interface feels like low hanging fruit we could demonstrate at the SDK layer an interface that shows it's easy for AI to ingest and understand and build against the APIs that we've built or the CLIs that we provide or whatever. I'm not super opinionated about between now and July, Mike. I think like you and Drew or the team, if you guys have opinions about what we can show that demonstrates I think that's fair game.

Dan: is that it feels like a non-answer to your question, but I think I don't have a good answer to your question.

Dan: Maybe. Yeah.

Mike Gehard: And that's…
Mike Gehard: why I asked. I think none of us have good answers to this stuff. I think it's just so this team is all clear of what we mean and then I think we can go forward and build it. So, I think yeah again I'm trying to get out of just slapping an AI sticker on things and I want us to a add AI where AI adds value but also understanding to your point we got to come in with something AI or we don't get our foot in the door. So it's going to I think be this balance of what we can do there. I really like the SDK piece. I think there's a lot we can do around building that SDK to make it very consumable by agents,…

Mike Gehard: which might get us 90% of the way that we're there.

Dan: So, one of the agree and…

Dan: if you go read the tech approach, I think this is the one where we put in that we don't just slap AI and everything. in my head the things that I've been thinking about where AI sort of could be of utility here. one example is COA development.
00:20:00

Dan: So we need to do a plan pair schedule loop an automated pairing around scheduling which does not need to be AI but we could develop a COA development thing where we don't just say here's in my vibe coded thing you'll see I gave sort of three I gave optimize for coverage or optimize for asset the wear and tear on the asset, but we could develop a COA capability which has natural language on top of it.

Dan: So the operator comes in and says generate me a COA that optimizes for this or the operator the EWO gives some natural language COA that they want to plan for that then does something to feed that into the planning engine the pairing engine, right? something like that I don't know if it's feasible between now and July. but to your point, Mike, I don't want to just slap AI because AI is cool. I want to have a story behind it. So, we don't need to demonstrate AI between now and July. If we can, that would be great. I think all we need to show in July in this presentation demonstration is that we are thinking about agentic development. We are thinking about use cases. We're thinking about AI use cases.

Dan: So in human language, What I think we need to demonstrate in July to be credible, what Dan thinks we need to demonstrate in July to be credible, is that an EWO can ingest a formal STTO from sample data or create one from scratch. They can manage geo only targets. They can see that stuff on a map and then with a command or with a click of a button, they can do an automated pairing process. they can see that schedule in a sync matrix and they can export that schedule to something and then from an integrator's perspective this feels very loose to me. So Drew Mike I think this is more just what the mission OS core story is.

Dan: less about what I think we need but an integrator can onboard they can get a project in source control they can find documentation they can find example projects or references to use and they can deploy like a sample application that leverages the framework so I should have capitalized framework.
Mike Gehard: And that framework is built into Mission OS core or okay this is the thing we're building. Okay.

Dan: It's the thing we're building. It's the seaw wall. I think I tried to call it like mission OSC2 or something but it's like the framework is the seaw wall all of the stuff the SDK the ontology the operator experience all the stuff that we're building for seaw wall

Dan: when you look at what they're evaluating there is a lot of complexity in the EW domain for sure or in the electromagnetic spectrum just the management domain specifically that is not called out in what they're evaluating certainly in July or in phase one where

Dan: to me where we need the sort of the floor for us to be credible I think is primarily around ontology and schema for things like the space tasking order for spins like these common data elements that are more about C2 and…

Dan: space planning than specifics of the bandwidth and capabilities of specific assets and the way that EW work is done if that makes sense. I wouldn't be too worried about that right now. Yeah.

Sean: It does.

Sean: And I think that's just something that I'm like trying to catch up into my head is what is essentially the thing that's going to knock their socks off as far as EW because it is very

Dan: I will say are the companies and the products we're competing against Anderil for example we are not going to beat Anderal in the next two months on EW that's just not going to happen. so we need to be credible but that's not where those aren't the strength The strengths we need to press are our continuous ATO like industry leadership, the platform, the rise 8 process around like that the agile process, right? Design, all of that stuff. and then I think separating ourselves by the way that we think about and deliver SDK at both the platform and application level.

Dan: If they were buying an EW management suite, that's what they would be buying. They would be talking about we want a tool that does EW. But that's not what they talk about, They talk about building the framework, open architecture, interoperability. True.
00:30:00

Andrew McFarland: Yeah, sorry. I didn't want to take away from some of the product use case discussions. on the mission OS core side, do we know which engineers we have working on the demo?

Dan: No. …
Andrew McFarland: Okay, Once we identify those, if they could reach out to me and Mike so we can make sure we get the going on the right foot, that would be great.

Dan: there's a lot of moving parts here.

Dan: there should be some continuity between this team and the demo. So maybe that means one or two people. We don't know how many people they're going to invite. We don't know specifically what they're going to ask for. We don't know who's going to be available. So able

Andrew McFarland: Okay,…

Andrew McFarland: Yeah, that helps. I just want to make sure we're looking at the right environment able to support their tech stack. Sounds good.

Abel: Yeah, kind of piggy back what Drew said. There's eight people, maybe 11 depending on how you look at the channel that we're all in.

Abel: Do you know, Dan, as far as who are the people that are going to be working on this demo?
Dan: So between now and…
Dan: July, everybody that's in the channel is the list of names that Max so I don't know specifically everybody's availability I think we need to figure out a cadence and who's actually spending time here. My understanding is that you guys have all been working together over the past few weeks anyways. So that's kind of my hope is that you guys can tell me what

Dan: who has time or what the team looks like I guess.

Abel: And I know we're over time and…

Abel: I personally feel and that's something we talked about retro. There are some of us aside from some of the folks who are working on the TACLAN Management prototype concept they're also doing some beach work but across other project allocate forge and so forth I know that some of us are working on also a prototype for TAK as far as orchestration platform so to speak and some continuation stuff. So yeah, that's a different call, maybe that's for Max to answer. We're just kind of curious because when we're going over a retrospective last week, we were kind of talking about how can we prevent that we are set in not just to show up for rise during this competition,…

Abel: but also we're not burned out or we're not overstretched thin across various areas of work.

Dan: Yeah. Yeah.

Dan: That's fair. I need to talk to Max about it. we have talked about that, but I don't know that we ever came to an answer. that's fair. I will talk to Max and Adam about it.

Abel: What do you suggest we do moving forward?

Abel: What instead of just waiting? I feel there's a lot we could start doing and I want to also show up and you guys help us up.

Dan: Yeah. Yeah.

Dan: I agree. I mean I think yeah what's my ask here? So we need I guess not first but sort of in parallel we need to get set up on mission OS core.

Dan: So we need to get onboarded here. understand what that looks so Drew, I'm hoping that you can either help or point me who to talk to help with that. I think we have some time to do experimentation for what specific slice we want to build here. from operator experience at the domain level what we want to build. I need help. I don't have the domain context here specifically at that domain level for spins. I'm hoping either somebody on this team does or otherwise I can go talk to Clark and burner and see who to talk to.

Dan: But I kind of want to just go through a mini discovery here. Decide specifically this week what we want to build. and then just start going

Abel: So sorry just really quick as far as the prototype that you vive coded as you stated is that a direction is that just to sort of talk through it have visual sort of aid for that? because you did sort of talk a lot about how we can show up and you mentioned ontologies for the space task in order for spin talked about schemas you talk about I think you call them common data elements so I was just kind of curious…
00:35:00

Abel: if that's already sort of quoteunquote baked into your prototype the vive code or that is something up for the engineers to start digging into after the mission on boarding and such.

Dan: Yeah, that is very much up to the engineers.

Dan: What I built is like at the operator experience level. and I built it specifically just to put screenshots in the proposal. So, it works, but the data part specifically is probably not realistic. I will share the codebase here soon. so I thank you everybody for sticking around. I will talk to Max and get from him specifically what he plans for your guys's allocation. which I know I'm certain is not just add 20% to your day.

Dan: So I'll talk to him and figure out and understand what he expects specifically. we will get in mission OS core. and then I'm going to look to who's the PM in this group?

Abel: Mary and myself. They still sound good.

Dan: Mary and Abel. So I'll talk to you guys about setting up how you guys want to work as far as process.

Abel: Cool.

Dan: Okay, cool. I will send out this deck or…

Dan: I'll put it on the Slack channel. I appreciate everybody sticking around for eight extra minutes here. and I will follow up probably in the morning because it's late, but maybe this afternoon.

Abel: Cool, man.

