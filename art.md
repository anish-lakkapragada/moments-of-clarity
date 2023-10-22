---
layout: page
title: art
permalink: /birdart/
images:
  - image_path: /art/edrlevin.jpg
    title: Beautiful Aging of a Heron
  - image_path: /art/goldfinches.jpg
    title: Backyard Birding on a Branch
  - image_path: /art/mockingbirds.jpg
    title: Three-State Bird Trio
  - image_path: /art/sizes.jpg
    title: Size Switcheroo, Chickadees and Juncoes
  - image_path: /art/sparrows.jpg
    title: Sister Sparrows
  - image_path: /art/sf.jpg
    title: Subtle Transformations
  - image_path: /art/feeder.jpg
    title: Feeder Loop
---

<p class="reg"> I'm not great at art by any stretch of the imagination. That being said, here's a few pieces I recently made. All of them depict birds which do not really exist. </p>

<div class="container"> 
    <div class="photo-gallery">
        <div class="column">
            {% for image in page.images %}
                <div class="photo">
                    <img src="{{image.image_path}}">
                    <p> <em>{{image.title}} </em> </p>
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
