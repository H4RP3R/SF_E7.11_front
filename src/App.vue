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
            color: '#d0dbe1',
            errors: [],
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

input[type=text],
textarea {
    background-color: #d0dbe1;
    color: rgba(10, 10, 10, 0.7);
    border: none;
    padding: 2px 8px;
    border-radius: 8px;
    box-shadow: 0 0 5px rgba(239, 252, 255, 0.4);
    border: 1px solid rgba(239, 252, 255, 0.4);
    font-family: 'Comfortaa', cursive;

}

input {
    text-align: center;
}

textarea {
    padding: 8px 8px;
    resize: vertical;
}


input[type=text]:focus,
textarea:focus {
    outline: none;
    box-shadow: 0 0 5px #effcff;
    border: 1px solid #effcff;
}

label {
    font-family: 'Righteous', cursive;
    color: rgba(0, 0, 0, 0.6);
}

.send-button {
    margin-top: 10px;
    border-radius: 8px;
    width: 420px;
    border: none;
    background-color: rgba(0, 0, 0, 0.6);
    -webkit-transition: all 2s;
    -moz-transition: all 2s;
    -ms-transition: all 2s;
    -o-transition: all 2s;
    transition: all 2s;
    color: rgba(250, 250, 250, 0.8);
    font-family: 'Righteous', cursive;
    font-size: 16px;
}

.send-button:hover {
    background-color: rgba(0, 0, 0, 0.4);
    -webkit-transition: all 2s;
    -moz-transition: all 2s;
    -ms-transition: all 2s;
    -o-transition: all 2s;
    transition: all 2s;
}

.send-button:active {
    outline: none;
    box-shadow: 2px 2px rgba(255, 255, 255, 0.4);
    background-color: rgba(85, 87, 144, 0.9);
    transition: all 0.2s;
    color: rgba(250, 250, 250, 0.9);

}

.required::after {
    content: " *";
    font-size: 12px;
    color: rgba(250, 50, 50, 0.5);
}

.wrapper {
    max-width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.colored {
    background-color: #d0dbe1;
}

.light-box {
    border-radius: 50px;
    padding: 10px;
    background: #d0dbe1;
    box-shadow: 20px 20px 60px #b1babf,
        -20px -20px 60px #effcff;
}

.light-box-sm {
    width: 520px;
}

.light-box-md {
    max-width: 720px;
}

.violet {
    color: rgba(85, 87, 144, 0.9);
}

.error {
    color: rgba(250, 50, 50, 0.5);
    font-size: 12px;
}

.errors {
    margin: 20px;
    display: flex;
    flex-direction: column;
}

.errors>ul {
    list-style-type: none;
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
