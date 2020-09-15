<template>
    <div class>
        <a href="/">
            <div class="wrapper">
                <span class="text">to Main</span>
                <i class="arrow down"></i>
            </div>
        </a>
    </div>
</template>

<script>
export default {
    name: 'ToMain'
}
</script>

<style scoped>
.wrapper {
    width: 260px;
    height: 80px;
    background-color: rgba(250, 50, 50, 0.4);
    position: absolute;
    top: -65px;
    transition: 0.8s;
    left: calc(50% - 130px);
}

.wrapper:hover {
    top: -30px;
    transition: 1s;
}

.text {
    color: rgba(255, 255, 255, 0.8);
    font-family: 'Comfortaa', cursive;
    margin-top: 50px;
    font-weight: bold;
    font-size: 14px;
}

.arrow {
    border: solid rgba(255, 255, 255, 0.8);
    border-width: 0 3px 3px 0;
    display: inline-block;
    padding: 3px;
}

.down {
    transform: rotate(45deg);
    -webkit-transform: rotate(45deg);
}

a {

}

</style>
