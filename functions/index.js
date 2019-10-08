const functions = require('firebase-functions');
const admin = require("firebase-admin")
const firebase = require("firebase")

var serviceAccount = require("./saikiranbookstoreapp-firebase-adminsdk-uv1i1-a2f5d92c32.json");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://saikiranbookstoreapp.firebaseio.com"
});
const firebaseConfig = {
    apiKey: "AIzaSyCWVZSgj-K6or94bEoRJokxbwiDMvzaWRg",
    authDomain: "saikiranbookstoreapp.firebaseapp.com",
    databaseURL: "https://saikiranbookstoreapp.firebaseio.com",
    projectId: "saikiranbookstoreapp",
    storageBucket: "saikiranbookstoreapp.appspot.com",
    messagingSenderId: "548321228315",
    appId: "1:548321228315:web:21d758ca767819372beabe",
    measurementId: "G-VPR0DKR82B"
};
firebase.initializeApp(firebaseConfig)

const app = require('express')();
const cors = require('cors');

// Automatically allow cross-origin requests
app.use(cors({ origin: true }));

app.get("/products", async (req, res) => {
    try {
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

app.post("/login", async (req, res) => {

    //get user details
    let userDetails = {
        email: req.body.email,
        password: req.body.password,
    }

    try{
        let data = await firebase.auth().signInWithEmailAndPassword(userDetails.email, userDetails.password)
        res.status(200).json({user : data.user})
    }catch (error) {
        res.status(500).json({error : error})
    }

})

app.post('/signUp', async (req, res) => {
    res.contentType = "text/json"

    let requestBody = req.body;
    let response = {};

    //Get user details
    let userDetails = {
        email : req.body.email,
        password : req.body.password,
        confirmPassword : req.body.confirmPassword
    }

    try{

        //Register user
        let data = await firebase.auth().createUserWithEmailAndPassword(userDetails.email, userDetails.password)

        //Set status
        res.status(201).json({ message: `User ${data.user.uid} signedUp successfully`})

        //Send Success / Failure Error Response
        //res.send(userDetails)
    }
    catch(error){
        console.error(error)
        res.status(500).json({ error })
    }

});

app.get('/', (req, res) => {
    res.contentType = "text/json"
    res.send({"api-server": "1.0.0"})
});

// Expose Express API as a single Cloud Function:
exports.api = functions.https.onRequest(app);
