<template>
<div id="app" v-bind:style="{ backgroundColor: color}">
    <div class="wrapper">
        <router-view />
    </div>
</div>
</template>

<script>
export default {
    data() {
        return {
            color: '#d0dbe1'
        }
    },
    methods: {
        toggleBodyClass(addRemoveClass, className) {
            const el = document.body;

            if (addRemoveClass === 'addClass') {
                el.classList.add(className);
            } else {
                el.classList.remove(className);
            }
        },
    },
    mounted() {
        this.toggleBodyClass('addClass', 'colored');
    },
    destroyed() {
        this.toggleBodyClass('removeClass', 'colored');
    },
    setTitle: function() {
        this.metaTitle = this.$route.name
    }
}
</script>

<style>
* {
    padding: 0;
    margin: 0;
}

#app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    display: flex;
    justify-content: center;
}

.wrapper {
    width: 960px;
    display: flex;
    flex-direction: column;
}

.colored {
    background-color: #d0dbe1;
}
</style>
