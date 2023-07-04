# Introduction
This project is a set of samples intended to demonstrate to developers the various different means of extending Clever Credit.

## ExternalBusinessEvents - Hook onto External Business Events in Power Automate Flows
This example shows how you can create a business event that is triggered when a sales document is credit held at the point of release/post. The same scenario can be applied for service documents by tweaking code. Using the Business Central connecter in Business Central, a Power Automate Flow can then enable you to send a notification to a Teams channel when the document is credit held. The credit controller in Teams can respond by Releasing the document and also commenting against it.

## FlowReleaseCreditHeldDocs.zip - Setup Power Automate Flow for Credit Releasing Sales Documents
Ensure "Power Automate Environment" is completed in the assisted setup in Business Central. Once that is done, in Power Automate go to the "My Flows" page. Import the FlowReleaseCreditHeldDocs.zip file provided by us on github (within the ExternalBusinessEvents/src folder) by selecting the "Import Package (Legacy)" action. This will enable you to have a copy of the flow which will then need to be modified to your own environment and tenant
