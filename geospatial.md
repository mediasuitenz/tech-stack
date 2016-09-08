# Geospatial Tools

## ogr2ogr

## PostGIS

## QuantumGIS

## MyWorksites Serverside (Node.js) GeoJSON Rendering
- Lewis

## Leaflet

## Mapbox

Mapbox can render images from your GeoJSON using their [static maps API](https://www.mapbox.com/api-documentation/#static-classic)
E.g. [The TFC](http://tfc.govt.nz/current-conditions/incidents/) incidents page uses this ([see the code](https://github.com/mediasuitenz/transport-for-x/blob/master/mysite/assets/js/pages/incidents/incident.js)). This example also includes using proj4 js to convert projection from NZMG to WGS84.

They have many other very useful features. E.g. before using the above API, consider using their static maps, where you send them GeoJSON and they render it directly on map tiles. This is more efficient for the client as they only need the base tiles instead of plain tiles and rendering the GeoJSON on top.

### [Mappy](https://github.com/mediasuitenz/mappy)
Mappy is a wrapper for Leaflet, which you essentially just give JSON config. It was useful in [Transport for Christchurch](https://github.com/mediasuitenz/transport-for-x) where due to restrictions on deployment environment, updating files isn't easy, but using mappy we could define the config in the CMS allowing us to change map styling etc without deployment.

Unfortunately it mostly just hides away Leaflet in a custom layer of obscure config, so unless you want a very simple map quickly, or are willing to update the mappy lib as needed, you're likely best with plain Leaflet or something else.

- Matt

# To explore:

## Turfjs
