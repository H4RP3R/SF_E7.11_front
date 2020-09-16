<template>
<div class="ad-list-item tooltip" @mouseenter="getStat">
    <a :href="'ads/' + adData.uid">
        <div class="">
            <h4 class="red">{{ adData.title }}</h4>
        </div>
        <div class="">
            <span><b class="violet">Author:</b> {{ adData.author }} / </span>
            <span><b class="violet">At:</b><time datetime="2018-07-07">{{ dt }}</time></span>
        </div>
        <div class="">
            <span><b class="violet">uid:</b> {{ adData.uid }}</span>
        </div>
        <span class="tooltiptext">
            tags: {{ statistics.tags_num }} | comments: {{ statistics.comments_num }}
        </span>
    </a>
</div>
</template>

<script>
import axios from 'axios';

const URL = 'http://0.0.0.0:8000/'

export default {
    name: 'AdsListItem',

    props: ['adData'],

    data() {
        return {
            statistics: '',
        }
    },

    computed: {
        dt: function() {
            const t = new Date(this.adData.updated)
            const year = t.getFullYear()
            const month = ('0' + t.getMonth()).slice(-2)
            const date = ('0' + t.getDate()).slice(-2)
            const hours = ('0' + t.getHours()).slice(-2)
            const min = ('0' + t.getMinutes()).slice(-2)
            const sec = ('0' + t.getSeconds()).slice(-2)
            return `${year}-${month}-${date} ${hours}:${min}:${sec}`
        }
    },

    methods: {
        getStat: function() {

            axios.get(URL + `ads/${this.adData.uid}/statistics/`)
                .then((response) => {
                    this.statistics = response.data
                }).catch((e) => {
                    console.log(e);
                })
        }
    }
}
</script>

<style scoped>
a {
    text-decoration: none;
    color: inherit;
}

.ad-list-item {
    display: flex;
    font-size: 14px;
    justify-content: center;
    padding: 4px;
    border-radius: 6px;
    margin: 4px 12px;
    border: 1px solid rgba(0, 0, 0, 0.2);
    flex-direction: column;
}

.ad-list-item:hover {
    box-shadow: 0 0 5px #effcff;
    border: 1px solid #effcff;
}

.red {
    color: rgba(250, 50, 50, 0.5);
    text-transform: capitalize;
    font-family: 'Comfortaa', cursive;
    text-decoration: underline;
}

.tooltip {
    position: relative;
}

.tooltip .tooltiptext {
    visibility: hidden;
    min-width: 150px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
    position: absolute;
    z-index: 1;
    bottom: 50%;
    left: 21%;
    margin-left: -91px;
    opacity: 0;
    transition: opacity 0.3s;
}

.tooltip .tooltiptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
    opacity: 0.55;
}
</style>
