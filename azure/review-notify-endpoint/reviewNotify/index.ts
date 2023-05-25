import { AzureFunction, Context, HttpRequest } from "@azure/functions";

const githubNameToDiscordIdMap = {
	"na2na-p": "443669016536416267",
	Issiki0416: "885124658393919548",
	ryota658: "1098067196363690114",
	aogumobc: "712943792121970719",
	mokoxy: "598439305467396121",
	"4s2r9": "712618597960253491",
	"884344": "849490351097774090",
	"yuuu-m": "675971170687909908",
	N55039: "850009838318256170",
	"Xx-shiina1121-xX": "612615566020313098",
} as const;

const webhookEndpointUri =
	"https://discord.com/api/webhooks/1110906264483012713/RTqfKuSrCUOk3dSc8MTM1SObDn-7OPdBsyEtz2ZpcQskddxUkHKzenPs7S02u8bRDbB8";

const httpTrigger: AzureFunction = async function (
	context: Context,
	req: HttpRequest
): Promise<void> {
	context.log("HTTP trigger function processed a request.");
	context.res = {
		// status: 200, /* Defaults to 200 */
		body: "ok",
	};
	const payload = req.body;

	// stdout the request
	if (payload.action !== "review_requested") {
		return;
	}

	const bodyOptions = {
		htmlUrl: payload.pull_request.html_url,
		avatarUrl: payload.pull_request.user.avatar_url,
		issuer: payload.pull_request.user.login,
		title: payload.pull_request.title,
		description: payload.pull_request.body,
		requestedReviewer:
			githubNameToDiscordIdMap[payload.requested_reviewer.login],
	} as const;

	const discordPayload = {
		avatar_url: bodyOptions.avatarUrl,
		username: bodyOptions.issuer,
		content: `<@${bodyOptions.requestedReviewer}>\nReview Requested by ${bodyOptions.issuer}`,
		embeds: [
			{
				title: bodyOptions.title,
				description: bodyOptions.description,
				url: bodyOptions.htmlUrl,
				color: Math.floor(Math.random() * 16777215),
				footer: {
					text: `Requested at ${new Date().toLocaleString("ja-JP", {
						timeZone: "Asia/Tokyo",
					})}`,
				},
			},
		],
	} as const;

	fetch(webhookEndpointUri, {
		method: "POST",
		headers: {
			"Content-Type": "application/json",
		},
		body: JSON.stringify(discordPayload),
	});

	return;
};

export default httpTrigger;
