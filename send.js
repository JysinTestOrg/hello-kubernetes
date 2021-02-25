const { EventHubProducerClient } = require("@azure/event-hubs");

const connectionString = "Endpoint=sb://jysintest.servicebus.windows.net/;SharedAccessKeyName=Write;SharedAccessKey=3hPtVV6bXSe/Vx8y8eTT+vQA35G0TRSRVqlKB4CXfvU=;EntityPath=jysintesteh1";
const eventHubName = "jysintesteh1";

async function main() {

  // Create a producer client to send messages to the event hub.
  const producer = new EventHubProducerClient(connectionString, eventHubName);

  // Prepare a batch of three events.
  const batch = await producer.createBatch();
  batch.tryAdd({ body: "First event" });
  batch.tryAdd({ body: "Second event" });
  batch.tryAdd({ body: "Third event" });    

  // Send the batch to the event hub.
  await producer.sendBatch(batch);

  // Close the producer client.
  await producer.close();

  console.log("A batch of three events have been sent to the event hub");
}

main().catch((err) => {
  console.log("Error occurred: ", err);
});
