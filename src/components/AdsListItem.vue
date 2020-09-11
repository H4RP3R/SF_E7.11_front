<template>
<div class="ad-list-item">
    <div class="">
        <h4 class="red">{{ adData.title }}</h4>
    </div>
    <div class="">
        <span><b class="violet">Author:</b> {{ adData.author }} / </span>
        <span><b class="violet">At:</b> {{ adData.updated }}</span>
    </div>
    <div class="">
        <span><b class="violet">uid:</b> {{ adData.uid }}</span>
    </div>
</div>
</template>

<script>
export default {
    name: 'AdsListItem',

    props: ['adData'],
}
</script>

<style scoped>
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

.violet {
    color: rgba(85, 87, 144, 0.9);
}

.red {
    color: rgba(250, 50, 50, 0.5);
    text-transform: capitalize;
    font-family: 'Comfortaa', cursive;
    text-decoration: underline;
}
</style>
