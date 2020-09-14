<template>
<div class="light-box light-box-sm">
    <div class="list">
        <div v-if="adsListData.length">
            <ul v-for="adData in adsListData" :key="adData.uid">
                <li>
                    <AdsListItem v-bind:adData="adData" />
                </li>
            </ul>
        </div>
        <div v-else>
            <span>no data</span>
        </div>
    </div>
</div>
</template>

<script>
import AdsListItem from '@/components/AdsListItem.vue';
import axios from 'axios';
import {eventBus} from '../main.js';


const URL = 'http://localhost:8000/'

export default {
    name: 'AdsList',

    data() {
        return {
            adsListData: [],
        }
    },

    components: {
        AdsListItem,
    },

    methods: {
        getData: function() {
            axios.get(URL + 'ads/')
                .then((response) => {
                    this.adsListData = response.data.reverse()
                }).catch((e) => {
                    console.log(e);
                })
        }
    },
    created() {
        this.getData();
        eventBus.$on('runUpdate', () => {
            this.getData();
        })
    },
}
</script>

<style scoped>
ul {
    list-style-type: none;
}

.list {
    margin-top: 20px;
    height: calc(90vh - 290px);
    overflow-x: hidden;
    overflow-y: auto;
    margin-bottom: 20px;
}
</style>
