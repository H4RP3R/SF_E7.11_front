<template>
<div class="light-box light-box-sm">
    <div class="list">

        <div v-if="adsListData.ads.length">
            <ul v-for="adData in adsListData.ads" :key="adData.uid">
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
            const axios = require('axios');
            axios.get(URL + 'ads/')
                .then((response) => {
                    this.adsListData = response.data
                    console.log(response.data);
                }).catch((e) => {
                    console.log(e);
                })
        }
    },
    created() {
        this.getData();
    }
}
</script>

<style scoped>
ul {
    list-style-type: none;
}

.list {
    margin-top: 20px;
    max-height: calc(90vh - 290px);
    overflow-x: hidden;
    overflow-y: auto;
    margin-bottom: 20px;
}

::-webkit-scrollbar {
    width: 8px;
    height: 10px;

}

::-webkit-scrollbar-thumb {
    border-radius: 4px;
    background: rgba(0, 0, 0, 0.5);
}

::-webkit-scrollbar-thumb:active {
    background: rgba(85, 87, 144, 0.9);
}
</style>
