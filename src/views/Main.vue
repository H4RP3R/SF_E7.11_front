<template>
<div class="wrapper">
    <ToMain />
    <AdForm />
    <AdsList />
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

</style>
