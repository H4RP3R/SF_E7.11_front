<template>
<div class="wrapper">
    <div class="light-box light-box-sm">
        <div class="inner-border">
            <h1>{{ title }}</h1>
            <div class="adtext">
                <p>{{ text }}</p>
            </div>
            <div v-for="(tag, index) in splitedTags" v-bind:key="index" class="tags" :class="{active: tagsIsActive}">
                <span>{{ tag }}</span>
            </div>
            <div class="tagsubdate" :class="{inactive: tagsIsActive}">
                <form class="" method="post" v-on:submit.prevent="updateTags">
                    <input type="text" id="tags" name="tags" :bind="tags" v-model="tags">
                    <input type="submit" value="update" class="send-button">
                </form>
            </div>
            <div class="ad-info">
                <span><b class="violet">Author:</b> {{ author }} / </span>
                <span><b class="violet">At:</b> {{ updated }}</span>
                <button v-on:click="toggleTags" type="button" class="send-button" name="button">
                    edit tags
                </button>
            </div>
        </div>
    </div>
    <CommentsSection v-bind:comments="comments" v-on:newCommentAdded="getData" />
</div>
</template>

<script>
import axios from 'axios';
import CommentsSection from '@/components/CommentsSection.vue';

const URL = 'http://localhost:8000/'

export default {
    name: 'AdPage',

    data() {
        return {
            title: '',
            text: '',
            author: '',
            tags: [],
            updated: '',
            comments: [],

            tagsIsActive: true,
            formIsActive: true,

            oldTags: [],
            tagsUpdated: false,
        }
    },

    computed: {
        splitedTags() {
            if (typeof this.tags === 'string') {
                return this.tags.split('"')
            } else {
                return this.tags
            }
        }
    },

    components: {
        CommentsSection,
    },

    methods: {
        getData: function() {
            axios.get(URL + 'ads/' + this.$route.params.uid)
                .then((response) => {
                    this.title = response.data.ad.title;
                    this.text = response.data.ad.text;
                    this.author = response.data.ad.author;
                    this.tags = response.data.ad.tags;
                    this.updated = response.data.ad.updated;
                    this.comments = response.data.ad.comments;
                    console.log(response.data.ad);
                }).catch((e) => {
                    console.log(e);
                })
        },
        toggleTags: function() {
            if (this.formIsActive) {
                this.oldTags = this.tags
            } else {
                if (!this.tagsUpdated) {
                    this.tags = this.oldTags
                }
            }
            this.tagsIsActive = !this.tagsIsActive;
            this.formIsActive = !this.formIsActive;
            this.updated = false;
        },
        updateTags: function() {
            this.validateForm();
            axios({
                method: 'post',
                url: URL + `ads/${this.$route.params.uid}/tags/`,
                data: this.tags
            }).then(() => {
                this.tagsUpdated = true;
                this.toggleTags();
            }).catch((e) => {
                console.log(e);
            })
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
            console.log(this.tags);
        },

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
    font-size: 13px;
    font-style: italic;
}

.inner-border {
    padding: 8px;
    margin: 4px;
    border-radius: 50px;
    box-shadow: 0 0 5px rgba(239, 252, 255, 0.4);
    border: 1px solid rgba(239, 252, 255, 0.4);
}

.tags {
    display: inline-block;
    margin: 8px;
    display: none;
}

.tags>span {
    background-color: rgba(250, 50, 50, 0.5);
    border-radius: 8px;
    padding: 0 3px;
    color: #d0dbe1;
    font-family: 'Comfortaa', cursive;
    font-size: 14px;
    font-weight: bold;
}

.send-button {
    width: 70px;
    font-size: 12px;
    margin-left: 4px;
}

.active {
    display: inline-block;
}

.inactive {
    display: none;
}

.tagsubdate {
    margin-top: 5px;
}
</style>
