<template>
<div class="wrapper">
    <form @submit="sendForm" class="light-box light-box-sm" id="ad-form" method="post">
        <label for="ad-title" class="required">Title</label><br>
        <input v-model="title" type="text" id="title" name="title" required><br>
        <label for="ad-text" class="required">Text</label><br>
        <textarea v-model="text" name="ad-text" rows="4" cols="50" required></textarea><br>
        <div class="form-bottom">
            <div class="pair">
                <label for="tags">Tags</label><br>
                <input v-model="tags" type="text" id="tags" name="tags" placeholder="tag1, tag2, ...">
            </div>
            <div class="pair">
                <label for="author-name" class="required">Your name</label><br>
                <input v-model="author" type="text" name="author-name" id="author-name" required>
            </div>
        </div>
        <input type="submit" value="Send" class="send-button">
        <div class="errors" v-if="errors.length">
            <ul v-for="(error, index) in errors" :key="index">
                <li class="error">[{{ error }}]</li>
            </ul>
        </div>
    </form>
</div>
</template>

<script>
import axios from 'axios';
import {
    eventBus
} from "../main.js";


const URL = 'http://127.0.0.1:8000/';

export default {
    name: 'AdForm',

    data() {
        return {
            title: '',
            text: '',
            author: '',
            tags: '',

            errors: [],
        }
    },

    methods: {
        sendForm: function(e) {
            e.preventDefault();

            this.validateForm();

            if (!this.errors.length) {
                axios({
                    method: 'post',
                    url: URL + 'new_ad/',
                    data: {
                        'title': this.title,
                        'text': this.text,
                        'author': this.author,
                        'tags': this.tags,
                    },
                }).then(() => {
                    eventBus.$emit('runUpdate')
                    this.title = '';
                    this.text = '';
                    this.author = '';
                    this.tags = '';
                }).catch(
                    (e) => {
                        console.log(e);
                    }
                )
            } else {
                console.log(this.errors);
            }
        },

        validateForm: function() {
            this.errors = [];

            //handle tags
            if (this.tags.length > 1) {
                this.tags = this.tags.split(',');
            } else {
                this.tags = [];
            }

            if (this.tags.length) {
                this.tags.forEach((item, i) => {
                    item.trim()
                    if (!item) {
                        this.tags.splice(i)
                    }
                });

            }

            // check tags
            if (this.tags.length) {
                for (let i = 0; i < this.tags.length; i++) {
                    if (this.tags[i].length < 2) {
                        this.errors.push('The tag must be between 2 and 32 characters long.');
                        break;
                    }
                }
            }

            //check author
            if (this.author.length < 3) {
                this.errors.push('Author name at least 3 characters')
            }
        },

        clearForm: function() {
            this.title = '';
            this.text = '';
            this.author = '';
            this.tags = '';
        }
    }

}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Righteous&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Comfortaa:wght@515&display=swap');

#title {
    width: 420px;
}

#tags,
#author-name {
    width: 180px;
}

.wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.form-bottom {
    display: flex;
    justify-content: space-around;
}

::-webkit-input-placeholder {
    /* Edge */
    color: white;
}

:-ms-input-placeholder {
    /* Internet Explorer 10-11 */
    color: white;
}

::placeholder {
    color: white;
}
</style>
