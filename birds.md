---
layout: page
title: birds
permalink: /birds/
images:
  - image_path: /bird-pics/wcrown-sparrow.jpg
    title: White-Crowned Sparrow
    location: Denali, Alaska
  - image_path: /bird-pics/tswallow.jpg
    title: Tree Swallow 
    location: Anchorage, Alaska 
  - image_path: /bird-pics/bheron.jpg
    title: Black-Crowned Night Heron
    location: Milpitas, CA
  - image_path: /bird-pics/gcrown.jpg
    title: Golden-Crowned Sparrow
    location: Milpitas, CA
  - image_path: /bird-pics/ahumm.jpg
    title: Anna's Hummingbird 
    location: Santa Clara, CA
  - image_path: /bird-pics/djunco.jpg
    title: Dark-Eyed Junco 
    location: San Jose, CA
  - image_path: /bird-pics/lgoldfinch.jpg
    title: Lesser Goldfinch 
    location: San Jose, CA
  - image_path: /bird-pics/wthroated.jpg
    title: White-Throated Sparrow 
    location: Philadelphia, PA
  - image_path: /bird-pics/mdove.jpg
    title: Mourning Dove
    location: San Jose, CA
locations: 
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "Lynbrook High School - San Jose, CA"},
    "geometry": {
        "type": "Point",
        "coordinates": [-122.0047, 37.3006]
    }
  }'  
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "Ulistac Natural Area - Santa Clara, CA"},
    "geometry": {
        "type": "Point",
        "coordinates": [-121.9544, 37.4038]
    }
  }'  
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "Henry Coe State Park - Morgan Hill, CA"},
    "geometry": {
        "type": "Point",
        "coordinates": [-121.4360, 37.1914]
    }
  }'
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "Palo Alto Baylands Park - Palo Alto, CA"},
    "geometry": {
        "type": "Point",
        "coordinates": [-121.4360, 37.1914]
    }
  }'
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "Palo Alto Baylands Park - Palo Alto, CA"},
    "geometry": {
        "type": "Point",
        "coordinates": [-122.1076, 37.4575]
    }
  }'
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "Guadalupe Oak Grove - San Jose, CA"},
    "geometry": {
        "type": "Point",
        "coordinates": [-121.8805, 37.2374]
    }
  }'
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "Guadalupe Oak Grove - San Jose, CA"},
    "geometry": {
        "type": "Point",
        "coordinates": [-121.8805, 37.2374]
    }
  }'
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "San Francisco, CA"},
    "geometry": {
        "type": "Point",
        "coordinates": [-122.4194, 37.7749]
    }
  }'
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "Half Moon Bay, CA"},
    "geometry": {
        "type": "Point",
        "coordinates": [-122.4286, 37.4636]
    }
  }'
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "Bair Island State Marine Park - Redwood City, CA"},
    "geometry": {
        "type": "Point",
        "coordinates": [-122.225680, 37.520921]
    }
  }'
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "Anchorage, Alaska"},
    "geometry": {
        "type": "Point",
        "coordinates": [-149.8897, 61.2176]
    }
  }'
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "Denali, Alaska"},
    "geometry": {
        "type": "Point",
        "coordinates": [-151.1926, 63.1148]
    }
  }'
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "Charles H. Rogers Wildlife Refugee - Princeton, NJ"},
    "geometry": {
        "type": "Point",
        "coordinates": [-74.660049, 40.343899]
    }
  }'
  - geojson: '{
    "type": "Feature", 
    "properties": {"popupContent": "John Heinz National Wildlife Refuge - Philadelphia, PA"},
    "geometry": {
        "type": "Point",
        "coordinates": [-75.2572, 39.8922]
    }
  }'

---

<p class="reg"> Recently, I have gained an appreciation for bird photography. Below are some of the best photographs I've taken for a few bird species. </p>

<div class="container"> 
    <div class="photo-gallery">
        <div class="column">
            {% for image in page.images %}
                <div class="photo">
                    <img src="{{image.image_path}}">
                    <p> <em>{{image.title}} </em> in {{image.location}}  </p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>

<p class="reg"> Below is a map of all the places I've taken bird photos at (mostly in Bay Area, CA). I'm excited to add more. </p>

{% leaflet_map {"zoom" : 2,
                "center" : [50, -114],
                "providerBasemap": "OpenStreetMap.Mapnik"} %}
{%- for geojson in page.locations -%}
{% leaflet_geojson {{geojson.geojson}} %}
{% endfor %}
{% endleaflet_map %}

<style>

.column {
    display: flex; 
    flex-direction: row; 
    flex-wrap: wrap; 
    width: 100%;
}

@media(min-width: 800px) and (max-width: 1000px) {
  .photo {
    margin-left: 0.25em;
    margin-right: 0.25em;
  }
} 

@media(max-width: 800px) {
    .column {
        gap: 1em;
    }
}

.photo {
    flex: 33.33%
}

img {
    width: 10em; 
    object-fit: cover;
}

p {
    font-size: 0.5em;
}

.reg {
  font-size: 0.8em; 
}

</style>
