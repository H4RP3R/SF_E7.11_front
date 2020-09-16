<template>
<div class="wrapper">
    <div class="light-box light-box-sm">
        <form @submit="sendForm" class="" id="ad-form" method="post">
            <label for="comment-text" class="required">Comment</label><br>
            <textarea v-model="text" name="ad-text" rows="4" cols="50" required></textarea><br>
            <label for="author-name" class="required">Your name</label><br>
            <input v-model="author" type="text" name="author-name" id="author-name" required>
            <input type="submit" value="Reply" class="send-button replybtn">
            <div class="errors" v-if="errors.length">
                <ul v-for="(error, index) in errors" :key="index">
                    <li class="error">[{{ error }}]</li>
                </ul>
            </div>
        </form>
        <div class="comments">
            <div v-for="(comment, index) in comments.slice().reverse()" :key="index" class="">
                <div class="comment">
                    <span><b class="violet">{{ comment.author }}</b> said:</span>
                    <span class="comment-text">{{ comment.text }}</span>
                    <span class="post-time"><b class="red">at:</b> {{ dt(comment.created) }}</span>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import axios from 'axios';

const URL = 'http://0.0.0.0:8000/';

export default {
    name: 'CommentsSection',

    data() {
        return {
            text: '',
            author: '',

            errors: [],
        }
    },

    props: ['comments'],

    methods: {
        sendForm: function(e) {
            e.preventDefault();

            this.validateForm();

            if (!this.errors.length) {
                axios({
                    method: 'post',
                    url: URL + `ads/${this.$route.params.uid}/comments/`,
                    data: {
                        'text': this.text,
                        'author': this.author,
                    },
                }).then(() => {
                    this.clearForm();
                    this.$emit('newCommentAdded')
                }).catch(
                    (e) => {
                        console.log(e);
                    }
                )
            }
        },

        dt: function(time) {
            const t = new Date(time)
            const year = t.getFullYear()
            const month = ('0' + t.getMonth()).slice(-2)
            const date = ('0' + t.getDate()).slice(-2)
            const hours = ('0' + t.getHours()).slice(-2)
            const min = ('0' + t.getMinutes()).slice(-2)
            const sec = ('0' + t.getSeconds()).slice(-2)
            return `${year}-${month}-${date} ${hours}:${min}:${sec}`
        },

        validateForm: function() {
            this.errors = [];

            //check author
            if (this.author.length < 3) {
                this.errors.push('Author name at least 3 characters')
            }
        },

        clearForm: function() {
            this.text = '';
            this.author = '';
        },
    },

}
</script>

<style scoped>
.wrapper {
    margin-left: 30px;
}

.replybtn {
    width: 50px;
    font-size: 11px;
    text-transform: uppercase;
    padding: 2px 0;
    margin-left: 5px;
}

.comments {
    /* height: calc(65vh - 190px); */
    max-height: 68vh;
    overflow-x: hidden;
    overflow-y: auto;
    margin-bottom: 10px;
    margin-top: 10px;
}

.comment {
    display: flex;
    font-size: 14px;
    justify-content: center;
    text-align: left;
    padding: 4px;
    border-radius: 6px;
    margin: 4px 12px;
    border: 1px solid rgba(0, 0, 0, 0.2);
    flex-direction: column;
    align-items: flex-start;
    padding-left: 20px;
}

.comment>span {
    margin-top: 5px;
}

.red {
    color: rgba(250, 50, 50, 0.5);
}

.violet {
    text-decoration: underline;
}

.post-time {
    font-size: 12px;
}

.comment-text::before {
    content: "- ";
}
</style>
