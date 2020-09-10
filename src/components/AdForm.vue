<template>
<div class="wrapper">
    <form @submit="sendForm" id="ad-form" method="post">
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
    </form>
</div>
</template>

<script>
import axios from 'axios';

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
            if (this.tags.length == 1) {
                this.tags = [this.tags[0]]
            } else if (this.tags.length > 1) {
                this.tags = this.tags.split(',');
            } else {
                this.tags = [];
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

#title {
    width: 420px;
}

#tags,
#author-name {
    width: 180px;
}

#ad-form {
    margin-top: 28px;
    width: 480px;
    border-radius: 50px;
    padding: 10px;
    background: #d0dbe1;
    box-shadow: 20px 20px 60px #b1babf,
        -20px -20px 60px #effcff;
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

.required::after {
    content: " *";
    font-size: 12px;
    color: rgba(250, 50, 50, 0.5);
}
</style>
