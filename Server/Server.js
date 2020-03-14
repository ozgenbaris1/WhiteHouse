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
            element.Value = element.Value.toFixed(1)
        });

        data.push({ Device: item, SensorDataList: sensors });
    });

    res.send({
        type: 'S',
        message: null,
        data: data
    });
});

app.get("/getSensorDataSummary", (req, res) => {

    if (req.query['DeviceID'] == null || req.query['SensorID'] == null) {
        res.send({
            type: 'E',
            message: 'Wrong Query Parameters',
            data: []
        });
    }

    var sensor = getDataFromDatabase(`SELECT * FROM Sensors WHERE SensorID = ${req.query.SensorID};`)[0];

    var sensorData = getDataFromDatabase(`SELECT CreatedDate, Value FROM SensorDatas WHERE SensorDatas.DeviceID = ${req.query.DeviceID} AND ` +
        `SensorDatas.SensorID = ${req.query.SensorID} ORDER BY SensorDatas.CreatedDate DESC LIMIT 10;`);

    sensorData.sort(function(a, b) {

        var dateA = new Date(a.CreatedDate);
        var dateB = new Date(b.CreatedDate);

        if (dateA < dateB) {
            return -1;
        }
        if (dateA > dateB) {
            return 1;
        }
        return 0;
    });

    sensorData.forEach((sensorItem) => {
        sensorItem.CreatedDate = formatDate(sensorItem.CreatedDate);
        sensorItem.Value = sensorItem.Value.toFixed(1) //(Math.round(sensorItem.Value * 100) / 100).toFixed(1); // parseFloat(sensorItem.Value.toFixed(1)); 
    });

    res.send({
        type: 'S',
        message: null,
        data: {
            sensor: sensor,
            sensorData: sensorData
        }
    });
});

app.get("/getLastSensorData", (req, res) => {

    if (req.query['DeviceID'] == null || req.query['SensorID'] == null) {
        res.send({
            type: 'E',
            message: 'Wrong Query Parameters',
            data: []
        });
    }

    res.send({
        type: 'S',
        message: null,
        data: {
            lastValue: getDataFromDatabase(`SELECT Value, Max(CreatedDate) FROM SensorDatas WHERE DeviceID = ${req.query.DeviceID} AND SensorID = ${req.query.SensorID};`)[0].Value.toFixed(1),
        }
    });
});

app.get("/getDailySensorData", (req, res) => {

    var sensor = getDataFromDatabase(`SELECT * FROM Sensors WHERE SensorID = ${req.query.SensorID};`)[0];

    var dailySensorData = getDataFromDatabase(`SELECT * from DailySensorData WHERE DeviceID = ${req.query.DeviceID} AND ` +
        `SensorID = ${req.query.SensorID};`);

    dailySensorData.forEach((item) => {
        // item.CreatedDate = formatDate(item.CreatedDate);
        item.Value = item.Value.toFixed(1) //(Math.round(sensorItem.Value * 100) / 100).toFixed(1); // parseFloat(sensorItem.Value.toFixed(1)); 
    });

    res.send({
        type: 'S',
        message: null,
        data: {
            sensor: sensor,
            sensorData: dailySensorData
        }
    });
});

app.get("/getWeeklySensorData", (req, res) => {

    var sensor = getDataFromDatabase(`SELECT * FROM Sensors WHERE SensorID = ${req.query.SensorID};`)[0];

    var weeklySensorData = getDataFromDatabase(`SELECT * from WeeklySensorData WHERE DeviceID = ${req.query.DeviceID} AND ` +
        `SensorID = ${req.query.SensorID};`);

    weeklySensorData.forEach((item) => {
        // item.CreatedDate = formatDate(item.CreatedDate);
        item.Value = item.Value.toFixed(1) //(Math.round(sensorItem.Value * 100) / 100).toFixed(1); // parseFloat(sensorItem.Value.toFixed(1)); 
    });

    res.send({
        type: 'S',
        message: null,
        data: {
            sensor: sensor,
            sensorData: weeklySensorData
        }
    });
});

app.get("/getYearlySensorData", (req, res) => {

    var sensor = getDataFromDatabase(`SELECT * FROM Sensors WHERE SensorID = ${req.query.SensorID};`)[0];

    var yearlySensorData = getDataFromDatabase(`SELECT * from YearlySensorData WHERE DeviceID = ${req.query.DeviceID} AND ` +
        `SensorID = ${req.query.SensorID};`);

    yearlySensorData.forEach((item) => {
        // item.CreatedDate = formatDate(item.CreatedDate);
        item.Value = item.Value.toFixed(1) //(Math.round(sensorItem.Value * 100) / 100).toFixed(1); // parseFloat(sensorItem.Value.toFixed(1)); 
    });

    res.send({
        type: 'S',
        message: null,
        data: {
            sensor: sensor,
            sensorData: yearlySensorData
        }
    });
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
    var response = database.prepare(query).run(data);
    database.close();
    return response;
}

function getDataFromDatabase(query) {
    var database = new sqlite3(DATABASE_PATH);
    var response = database.prepare(query).all();
    database.close();
    return response;
}

function formatDate(dateTime) {

    var date = dateTime.split(" ")[0];
    var time = dateTime.split(" ")[1];

    var tmp = date.split("-");

    var year = tmp[0]
    var month = tmp[1]
    var day = tmp[2]

    return day + '.' + month + '.' + year + ' ' + time;
}