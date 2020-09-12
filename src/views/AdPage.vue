<template>
<div class="wrapper">
    <div class="light-box light-box-sm">
        <h1>{{ title }}</h1>
        <div class="adtext">
            <p>{{ text }}</p>
        </div>
        <div class="ad-info">
            <span><b class="violet">Author:</b> {{ author }} / </span>
            <span><b class="violet">At:</b> {{ updated }}</span>
        </div>
    </div>
</div>
</template>

<script>
import axios from 'axios';

const URL = 'http://localhost:8000/'

export default {
    name: 'AdPage',

    data() {
        return {
            title: '',
            text: '',
            author: '',
            tags: '',
            updated: '',
        }
    },

    components: {},

    methods: {
        getData: function() {
            axios.get(URL + 'ads/' + this.$route.params.uid)
                .then((response) => {
                    this.title = response.data.ad.title;
                    this.text = response.data.ad.text;
                    this.author = response.data.ad.author;
                    this.tags = response.data.ad.tags;
                    this.updated = response.data.ad.updated;
                    console.log(response.data.ad);
                }).catch((e) => {
                    console.log(e);
                })
        }
    },

    created: function() {
        this.getData();
    }
}
</script>

<style scoped>
h1 {
    color: rgba(250, 50, 50, 0.5);
    text-transform: capitalize;
    font-family: 'Comfortaa', cursive;
    text-decoration: underline;
    font-size: 20px;
    margin-top: 4px;
}

.adtext {
    margin-top: 8px;
}

.ad-info {
    font-size: 14px;
    font-style: italic;
}
</style>
