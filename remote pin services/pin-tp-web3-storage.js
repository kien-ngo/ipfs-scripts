const headers = new Headers({
  'Accept': '*/*',
  'Authorization': 'Bearer <nft.storage api key>',
  'Content-Type': 'application/json'
});

const data = {
  "cid": "QmaCsqq6dr1U....grOs",
  "name": "Alias for the CID above"
};

fetch('https://api.web3.storage/pins', {
  method: 'POST',
  headers: headers,
  body: JSON.stringify(data)
}).then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error));
