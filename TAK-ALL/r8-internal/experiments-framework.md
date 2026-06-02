# 1. EXPERIMENT CARD GUIDE
By The foundtain institute - created by Jeff Humble (thefountaininstitute.com/resources)

## ASSUMPTIONS

What are the assumptions behind your solution idea? There are always a few assumptions in your team’s ideas. De-risk assumptions with a test before investing time in a complete build.

Finding assumptions on your own is difficult. This section is a great area to collaborate with your team to make sure you're identifying all of the non-obvious assumptions.

Pro Tip: It's easier to measure results if you focus your experiment on one assumption. Pick the riskiest assumption and set up your test based on that.

Use the 4 lenses of innovation to examine your idea and uncover assumptions. You’ll find these prompts in subtle gray text on the Experiment Card to guide you in this process.
- Viability - Should we build it?
- Desirability - Will users value it?
- Usability - Will users understand it?
- Feasibility - Can we build it?

Examples:"Our users want to pay monthly, rather than yearly" (highest risk assumption)"We understand the user expectations needed for a subscription model.""A subscription model can be offered alongside a one-time fee pricing model."

Don’t try to pull out assumptions by yourself. You’ll be much more rigorous if you share the task of identifying risk with your team. If you work on a product design team, consider bringing in these experts:
- Product Manager - experts in viability, feasibility, and desirability
- Product Designer - experts in usability and desirability
- Engineers - experts in feasibility

## HYPOTHESIS

Experiments aren’t experiments if they can’t be proven wrong. That’s why it’s essential to guess the expected behavior.

We are using a simple format to predict a cause-and-effect relationship. Cause-and-effect is essential for isolating variables and establishing causality later as your experiments mature.

If [cause], then [effect].

The [cause] or the independent variable can be simulated with a prototype or live A/B test. The [effect] or the 
dependent variable is the metrics you will use to evaluate the effect in your experiment.

That’s the most straightforward hypothesis format; I think it’s the best place to start.

*Pro Tip: If past research informs your hypothesis, link it next to your card. The research that informs your experiment is known as the hypothesis rationale. Hypotheses should have a rationale based on prior research or experiments. You’re making a bold prediction with your hypothesis, so you want it to be based on as much data as possible. We recommend you link to the research or rationale that informs your hypothesis. Summarizing the past research will help you and your stakeholders understand the thinking behind your hypothesis.*

## TEST SETUP

The Test Setup details what you will do to simulate the cause stated in your hypothesis. Think of this section as a way to plan exactly what you will do in the experiment.

Describe what you will do to tackle your assumption. Use this section to discuss any designs you will create and who you will test them on. Aim for a Minimum Viable Experiment (MVE) here, not the Minimum Viable Product (MVP).

Prioritize test approaches that create learning. Once you've validated the riskiest assumptions, you can follow up the test with more polished designs.

Questions to ask yourself:
- What's the quickest way to test this assumption?
- How might we simulate and prototype early?
- Is there an easier way to evaluate this assumption?
- How can we get an early signal that we're on the right track?

Example: “We will run a click test with potential customers to see if they click subscription rather than one-time payment when given a task”

## TARGET METRICS

The Target Metric goes into more detail about the metrics that will represent your predicted effect. Think of this section as a place to describe specific numbers representing the effect in your hypothesis.

The Target Metrics state what needs to be true for the assumption to be supported or refuted. This is a bold target that attempts to predict the impact that the experiment will have.

When you start running experiments, setting a reasonable target for your experiments is hard. Don’t worry, you will get better in time. Do a little research into any related metrics you can access through analytics and base your target on that.

Use these questions to ensure you format your metric properly:
**Who:** Who will be impacted?
**How much:** By how much will they be impacted?
**When:** In what time-frame will they be impacted?

If your metric answers those three questions, it’s a good metric. Metrics can always improve, but those three criteria are the baseline. Ask a data scientist or a business analyst if you want to improve your experiment metrics beyond these three questions.

Make sure you write these before you start gathering data. Target metrics are like “calling your shot” when shooting the eight-ball in billiards: If you don’t call it out before, it doesn’t count.

By defining the success or failure metrics beforehand, you can avoid Hindsight Bias, the psychological term for when you convince yourself after an event that you accurately predicted it before it happened. With experiments, we want to avoid the mentality of “Let’s see what happens,” commonly called a “Spaghetti Test.”

[image-1]
An infinity loop Left side "Discovery" and Right side "Delivery", 

The Discovery side has "Evidence" (correlation)
The Delivery side has "Proof" (causation)
With a horizontal line --> "progress-->
[image-end]

When you’re in the early Discovery Phase, your burden of proof will be lower than in the later Delivery Phase. As you move closer to delivery, the burden of proof increases, making your metrics slightly different in the Delivery Phase.

[image-2]
The same infinity loop, but with the following 3 additions

1. An Uncertainty verical line
2. a dotted red diagonal line "riskiness of the assumptions" running left-to-right from the top of the Uncertainty verical line to right-end of the horizontal progress line

3. a dotted glue diagonal line "burden of proof" running left-to-right from the bottom of the horizontal progress line to right top end of the progress line
[image-end]

An early discovery experiment might give you lots of evidence with only ten users involved. When ideas are early, any evidence you can generate is useful. If you’re running experiments with low numbers, the results might be due to noise, but that might be unavoidable if you don’t have access to lots of testers. Run a series of experiments to counteract your low numbers and work towards testing with larger groups where you can achieve statistical significance.

[image-3]
The same infinity loop image
- Left side - Lo-fi Metrics, evidence (correlation)
- Right side - Hi-Fi Metrics, proof (causation)
The same horizontal line --> "progress-->
[image-end]

**Lo-Fi Metric:** “In this click test, 6 out of 10 testers will click subscription links in the prototype during the test” (Discovery Experiment Metric)

**Hi-Fi Metric:** “The launch of this subscription option will increase adoption for new customers by 25% after 30 days” (Delivery Experiment Metric)

Stakeholders often have high expectations for precision, but the more precise your measurements, the more the experiment will cost. Make sure you know the costs involved to achieve statistically significant results. Hi-fi metrics with 95% statistical significance (common in science) might cost more than most stakeholders are willing to pay for the results. Discuss this with your team before you make assumptions about your experiment metrics.

## Experiment Start & End Dates

Time is a very important element of your experiment planning. If you are testing with low numbers, you may have to run the test for longer than you think.

For longer experiments, it can be tempting to stop measuring when you see early results, but those results can fluctuate quite a bit during an experiment. By marking the beginning and end of your measuring period, you will ensure that you stick to the schedule.

## Pre-Test Decisions

**There are three possible outcomes for any experiment:**
- The hypothesis is supported
- The hypothesis is refuted
- The results are inconclusive

Knowing this, try to **get the team to agree on what you will do in these three scenarios.** And make sure you write this down BEFORE you run your experiment. Deciding this before will protect you from stakeholders changing their minds after seeing the experiment data (Hindsight Bias). By putting the decisions in writing, you can hold the team accountable for the user data you collect.

## EXPERIMENT CARD

* Designed By:
* Date: 

*[State the background]*
* Big Idea:
* Desired Business Outcome:

*[Make the idea testable]*
1. Assumption - the success of the idea depends on the assumption that... 
- Will it be good for business? (viability)
- Will people find value in it? (desirability)
- Will people be able to use it? (Usability)
- Can we build it? (feasibility)

- What is the riskies assumption?

2. Hypothesis - To test the assumption(s), we predict that...
- Is the cause testable? Is the effect measurable?

**If** [the-cause] **then** [the-effect].
(the cause: the indepedent variable or treatment, the thing you will chagne)
(the dependent variable or quantifiable result, the thing you will measure)

*[Plan the details]*
3. Test Setup - To simulate the cause from our hypothesis, we will...
- What's the smallest test we can run?
- What's the fastest way to set it up?
- Can we prototype something scrappy?

4. Target Metric - To evaluate the effect, we will measure... 
- Who will be impacted?
- By how much?
- In what timeframe?
- Did you research your ideal sample size? [Yes] or [No] ?

5. Pre-Test Decisions - We are committing to these possible outcomes..

> If it passes, we will 
*(i.e., we hit our target threshold)* 
> "place your decisions here" 
*(the hypothesis is supported)*

> If it fails, we will.. 
(i.e., we didn't hit our targer threshold): 
> "Place your decisins here" 
*(the hypothesis is refuted)*

* Experiment Start Date:
* Experiment End Date:

---

# 2. ANALYSIS CARD (Experiment Retro) GUIDE

## Resulting Data

After your measurement data, you can gather the results from your experiment. This space is big enough to screenshot a graph or other visual data element.

Be transparent about your results. Here are some tips for presenting data on your card:
- Include a visual like a bar chart or a line graph
- Show both numerator and denominator, rather than using percentages for small audiences of less than 100
- Write whole numbers like “25” rather than “25.03” when you are testing with small audiences of less than 1,000
- Write down your “confidence interval” if you average results or have a big margin of error.
- Note if you achieved statistical significance (not due to chance) with the results

> It's a good idea to also "call your shot" with the decision connected to this experiment.

There are three possible outcomes for any experiment:
- The hypothesis is supported
- The hypothesis is refuted
- The results are inconclusive

**Pro Tip:** Since there are three possible outcomes, you can call your shot by making decisions before the experiment. Facilitate team decisions on the three possible outcomes before you start the experiment. I like to write down a possible decision for each outcome in a Post-it below the Experiment Card. You may not have the agency to make those decisions, so bring your team lead into this process.

## FACTS

Write down what happened during the project. This is a great place to record customer behaviors worth capturing as an experiment. You can include screenshots or links to the data here as well.

## INTERFACES

What are the facts from the test? What prior facts can you combine with this experiment to create a new inference? Write down what you learned before you forget it! This space is a great place to revisit when planning experiments.

What’s the difference between an observation and an inference? An observation is based on the five senses. Inferences are conclusions drawn from those facts. Here are some examples:

Sense | Observation | Influence |
sight | 	The sky is blue |	The weather is pleasant |
hearing |	I hear someone calling my name	I must be late for dinner
smell |	There is an unpleasant smell outside |	Someone must have forgotten to take out the trash |
taste |	This pickle has a sweet taste |	This must be a “bread and butter” pickle |
touch |	The dog feels fluffy to the touch | The dog must shed a lot

## RECOMENDATIONS

Write down what decisions you will take due to your observations and inferences. Documenting these is essential so that you have them for review later.

If you encounter resistance, remind your team that data-driven product companies make decisions this way, even if it’s painful.

>" There is no such thing as failed experiment, only experiments with unexpected otucomes"

## ANALYSIS CARD

* Designed By:
* Date: 
*[State the background]*
* Big Idea:
* Desireed Business Outcome:

*[Collect the data]*
1. Resulting Data (The results of this experimetn were..)
- [place screenshots of experiment data here]
- What does the data tell you about your hypothesis? [supported], [refuted], or [inconclusive]

*[Analyze the data]*
2. Facts (What we observed in the experiment...), i.e., what did we see?
3. Interfaces (the conslusions and opinions we formed..) i.e., Why do we think that happened?
4. Recommendations (How we will proceed..), How would we improve the idea?