/** File to send everything. */

const client = require("@mailchimp/mailchimp_marketing");

client.setConfig({
  apiKey: process.env.MAILCHIMP_API_KEY,
  server: "us21",
});

const date = new Date();

let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear() + 3;

// This arrangement can be altered based on how we want the date's format to appear.
let currentDate = `${day}-${month}-${year}`;


// LIST ID: d9dd760afb
// TEMPLATE ID: 10563982, 10563987 (CB_TEMPLATE)
const run = async () => {
    const response = await client.templates.list(); 
    console.log(response);
    const campaignCreation = await client.campaigns.create({ 
        type: "regular", 
        recipients: {list_id: "d9dd760afb"}, 
        settings: {
            subject_line: "Moments of Clarity Has a New Post", 
            preview_text: "Anish Cookin.", 
            title: `Moments of Clarity v2.0 Campaign-${currentDate}`, 
            from_name: "Anish Krishna Lakkapragada", 
            inline_css: true,
            reply_to: "anish.lakkapragada@gmail.com", 
            template_id: 10563987
        }
    });
    console.log(campaignCreation);

    // send this new thing over to everyone on the list bro  
    const sendCampaign = await client.campaigns.send(campaignCreation.id);
    console.log(sendCampaign); 
}

run();











