package main

import (
	"inngest.com/workflows"
)

workflow: workflows.#Workflow & {
	name: "Post-signup workflow"

	triggers: [{
		event: "signup.new"
	}]

	actions: [
		{
			clientID: 1
			name:     "Send the user a welcome email"
			dsn:      "mailchimp.inngest.com/send-transactional-email"
			metadata: {
				to:         "{{ event.user.email }}"
				subject:    "Welcome to my service!"
				from_email: "hi@example.com"
				html:       "<h1>Hello {{ event.user.name }}!</h1>"
			}
		},
		{
			clientID: 2
			name:     "Add the user to our marketing list"
			dsn:      "mailchimp.inngest.com/add-to-list"
			metadata: {
				listID: "example-id"
				email:  "{{ event.user.email }}"
				status: "subscribed"
			}
		},
		{
			clientID: 3
			name:     "Add the user as a Close lead"
			dsn:      "closeio.inngest.com/add-lead"
			metadata: {
				listID: "example-id"
				name:   "{{ event.user.name }}"
			}
		},
	]

	edges: [
		{
			outgoing: "trigger"
			incoming: 1
			metadata: {
				type: "edge"
				name: ""
				if:   ""
			}
		},
		{
			outgoing: "trigger"
			incoming: 2
			metadata: {
				type: "edge"
				name: "User subscribed to the newsletter"
				if:   "event.data.newsletter == true"
			}
		},
		{
			outgoing: "trigger"
			incoming: 3
			metadata: type: "edge"
		},
	]
}
