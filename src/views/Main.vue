<template>
<div class="wrapper">
    <AdForm />
    <AdsList />
</div>
</template>

<script>
import AdForm from '@/components/AdForm.vue';
import AdsList from '@/components/AdsList.vue';

export default {
    name: 'Main',
    components: {
        AdForm,
        AdsList,
    }
}
</script>

<style scoped>

</style>
