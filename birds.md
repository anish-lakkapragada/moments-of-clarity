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
---

Recently, I have gained an appreciation for bird photography. Below are some of the best photographs I've taken for a few bird species.

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

<style>

.column {
    display: flex; 
    flex-direction: row; 
    flex-wrap: wrap; 
    width: 100%;
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

</style>

