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
    color: rgba(0, 0, 0, 0.6);
    display: flex;
    justify-content: center;
}

.wrapper {
    width: 960px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.colored {
    background-color: #d0dbe1;
}

.light-box {
    margin-top: 28px;
    border-radius: 50px;
    padding: 10px;
    background: #d0dbe1;
    box-shadow: 20px 20px 60px #b1babf,
        -20px -20px 60px #effcff;
}

.light-box-sm {
    width: 480px;
}

.light-box-md {
    width: 720px;
}

.violet {
    color: rgba(85, 87, 144, 0.9);
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
