const express = require('express');
const bodyParser = require('body-parser');
const PORT = 8080;
const app = express();

const sqlite3 = require('better-sqlite3');
const DATABASE_PATH = '../Database/WhiteHouse.db';

var ip = require("ip");
const IPADDRESS = ip.address()

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.listen(PORT, () => {
    console.log(`Server running at: http://${IPADDRESS}:${PORT}/`);
});

app.get("/getDevices", (req, res) => {

    var devices = getDataFromDatabase('SELECT * FROM Devices;');
    var sensors;

    var data = [];

    devices.forEach(item => {
        sensors = getDataFromDatabase(`SELECT * FROM SensorSummary WHERE DeviceID = ${item.DeviceID};`);

        sensors.forEach(element => {
            element.Value.toFixed(1)
        });

        data.push({ Device: item, SensorDataList: sensors });
    });

    var response = {
        type: 'S',
        data: data
    }

    res.send(response);
});

app.post("/insertSensorData", (req, res) => {

    var data = [req.body.DeviceID, req.body.SensorID, req.body.Value];

    var responseDB = insertSensorDataToDatabase(`
    INSERT INTO SensorDatas (
         DeviceID, 
         SensorID, 
         Value)
    VALUES ( ?,?,? )`, data);

    var response = {};

    if (responseDB.changes == 1) {
        response.type = 'S';
        response.message = 'Successfully Inserted';
    } else {
        response.type = 'E';
        response.message = 'Error';
    }

    res.send(response);

});

function insertSensorDataToDatabase(query, data) {
    var database = new sqlite3(DATABASE_PATH);
    var response = database.prepare(`
    INSERT INTO SensorDatas (
         DeviceID, 
         SensorID, 
         Value)
    VALUES ( ?,?,? )`).run(data);

    database.close();
    return response;
}

function getDataFromDatabase(query) {
    var database = new sqlite3(DATABASE_PATH);
    var response = database.prepare(query).all();
    database.close();
    return response;
}