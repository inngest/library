package main

import (
	"inngest.com/workflows"
)

workflow: workflows.#Workflow & {
	name: "Churn"
	triggers: [{
		event: "signup.new"
	}]
	actions: [{
		clientID: 1
		name:     "Wait for a workflow to be created"
		dsn:      "com.inngest/wait-for-event"
		metadata: {
			// We're waiting up to 1 day for a workflow created event from the
			// very same user.
			event: "workflow.created"
			match: "async.user.external_id == '{{ event.user.external_id }}'"
			ttl:   "1d"
		}
	}, {
		clientID: 2
		name:     "Send a re-engagement email"
		dsn:      "mailchimp.inngest.com/send-transactional-email"
		metadata: {
			from_email: "hello@inngest.com"
			from_name:  "Inngest"
			subject:    "Make your first serverless flow in seconds! ➡️"
			to:         "{{ event.user.email }}"
		}
	}]
	edges: [{
		outgoing: "trigger"
		incoming: 1
		metadata: {
			type: "edge"
			name: ""
			if:   ""
		}
	}, {
		outgoing: 1
		incoming: 2
		// If the "wait for event" action times out, we're going to traverse
		// this edge.  This means that the event _was not_ received within 1 day.
		metadata: {
			type: "edge"
			name: "When the event isn't received"
			if:   "response.timeout == true"
		}
	}]
}
