const params = {
  arg: ['cid1', 'cid2', 'cid3'],
};

const headers = new Headers();
headers.set('Authorization', 'Basic ' + btoa('<username>:<password>'));

fetch('https://ipfs.infura.io:5001/api/v0/pin/add', {
  method: 'POST',
  headers: headers,
  body: JSON.stringify(params)
}).then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error));
