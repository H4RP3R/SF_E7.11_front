<template>
<div>
    <ToMain />
    <div class="wrapper">
        <AdForm />
        <AdsList />
    </div>
</div>
</template>

<script>
import AdForm from '@/components/AdForm.vue';
import AdsList from '@/components/AdsList.vue';
import ToMain from '@/components/LinkToMain.vue';

export default {
    name: 'Main',
    components: {
        AdForm,
        AdsList,
        ToMain,
    }
}
</script>

<style scoped>
.wrapper {
    width: 100%;
    display: flex;
    flex-direction: row;
    /* flex-wrap: wrap; */
    justify-content: space-around;
    align-items: center;
    height: 100vh;
}

</style>
