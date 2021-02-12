<template>
  <img :src="imageUrl" alt="no_image"  class="user__image">
</template>

<script>
export default {
  props: ["image"],
  data() {
    return {
      imageUrl: require('../../assets/images/no_image.jpg')
    }
  },
  created() {
    const userImageIsExsits = (this.image !== null) && (this.image !== 'null');

    if (userImageIsExsits) this.imageUrl = this.image;
  },
};
</script>
