---
{
	"title": "Basic churn & re-engagement flow",
	"subtitle": "Sends new signups an email if the user doesn't do something",
	"tags": ["signup", "marketing"],
	"source": "./workflow.cue"
}
---

# Basic churn & re-engagement flow

This workflow runs after every `signup.new` event.  It **waits up to 1 day
for another event**, and if the event **isn't** received it sends the user
that signed up an email.

In the context of a photo-sharing app, we might:

- Wait for a new photo to be uploaded within 1 day
- And, if the user hasn't uploaded photos, send them a push notification.

This example flow is used within Inngest to send reminders when users
don't create workflows after signing up :)

You can change out the email action easily for other messaging actions, for example
if you wanted to send a push notification instead of an email.

## How this helps

- Once events are integrated, product & biz ops can begin creating these campaigns
without engineering input
- No infrastructure is requierd to coordinate between events, manage cron jobs,
or delayed queues.  It's all built in, ready to go
