# Qt OSM Map Providers Repository Creator

This repository provides scripts to easily setup a Qt OSM Map providers repository to allow use of tile servers that require an API key (including support for high DPI tiles)

A full write up of the method used here can be found at: https://blog.mikeasoft.com/2020/06/22/qt-qml-maps-using-the-osm-plugin-with-api-keys/

## Usage

1. First obtain an API key from https://www.thunderforest.com/docs/apikeys/
2. Next clone this repository `git clone https://github.com/Elleo/qt-osm-map-providers.git`
3. Run: `./set_api_keys.sh your_api_key` (replacing *your_api_key* with the key you obtained in step 1)
4. Copy the files from this repository to your webserver (e.g. http://www.mywebsite.com/osm_repository)
5. Set the *osm.mapping.providersrepository.address* property to point to the location setup in step 4 (see the QML example below)

### QML Example

```
import QtQuick 2.7
import QtQuick.Controls 2.5
import QtLocation 5.10

ApplicationWindow {

    title: qsTr("Map Example")
    width: 1280
    height: 720

    Map {
        anchors.fill: parent
        zoomLevel: 14
        plugin: Plugin {
            name: "osm"
            PluginParameter { name: "osm.mapping.providersrepository.address"; value: "http://www.mywebsite.com/osm_repository" }
            PluginParameter { name: "osm.mapping.highdpi_tiles"; value: true }
        }
        activeMapType: supportedMapTypes[1] // Cycle map provided by Thunderforest
    }
    
}

```
