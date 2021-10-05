---
{
	title: "Post-signup workflow",
	tags: ["signup", "marketing", "sales", "operations"]
}
---

# Post-signup workflow example

This workflow runs after every `signup.new` event.  Each time a user signs up,
the workflow sends the user a welcome email and adds the user to Close.IO for
sales followup, and adds the user to a marketing list - if the event data
says they've subscribed to a newsletter.

You can change out any of the example integrations easily, such as using
Sendgrid instead of Mandrill - or Salesforce instead of Close.io.  It's also a
good idea to add the user to places like Zendesk.

## How this helps

- Engineers don't have to write the initial integrations or spend time working
on non-product requests
- Biz ops, sales, and marketing can be kept in the loop and make changes to
things like mailing lists etc.
- Any time integrations change (which happens as a company ages), it's easy to
version and update the workflows with new integrations
- It's easy to debug which users ran through which versions of a workflow
via the built in audit trails
