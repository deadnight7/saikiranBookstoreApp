const functions = require('firebase-functions');
const admin = require("firebase-admin")

var serviceAccount = require("./saikiranbookstoreapp-firebase-adminsdk-uv1i1-a2f5d92c32.json");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://saikiranbookstoreapp.firebaseio.com"
});

const app = require('express')();
const cors = require('cors');

// Automatically allow cross-origin requests
app.use(cors({ origin: true }));

app.get("/products", async (req, res) => {
    try{

        let products = [];
        let data = await admin
            .firestore()
            .collection("products")
            .get()

        data.forEach(doc => {
            products.push(doc.data())
        })
        res.send(products)
    }catch (error){
        console.error("error: "+error)
        res.send(error)

    }

})

app.post('/signUp', (req, res) => {
    res.contentType = "text/json"

    let requestBody = req.body;
    let response = {};

    //Get username
    let userName =  req.body.userName;

    //Get Password

    //Register user

    //Set status

    //Send Success / Failure Error Response
    res.send()
});

app.get('/', (req, res) => {
    res.contentType = "text/json"
    res.send({"api-server": "1.0.0"})
});

// Expose Express API as a single Cloud Function:
exports.api = functions.https.onRequest(app);