<template>
  <img v-if="isExperinecesPage" :src="activityPicture(activity)" class="experience__picture">
  <img v-else :src="activityPictureUsersPage(activity)" class="experience__picture">
</template>

<script>
export default {
  props: ["activity"],
  computed: {
    isExperinecesPage() {
      const currentPath = /\/experiences\/\d{1,}/.test(this.$route.path) || /\/experience\/review/.test(this.$route.path)
      return currentPath ? true : false
    },
  },
  methods: {
    activityPictureUsersPage(activity) {
      return `https://maps.googleapis.com/maps/api/streetview?size=800x600&location=${activity.experience.latitude},${activity.experience.longitude}&heading=${activity.experience.heading}&pitch=${activity.experience.pitch}&fov=${activity.experience.fov}&zoom=${activity.experience.zoom}&key=${process.env.GOOGLE_STREET_VIEW_KEY}`;
    },
    activityPicture(activity) {
      return `https://maps.googleapis.com/maps/api/streetview?size=800x600&location=${activity.latitude},${activity.longitude}&heading=${activity.heading}&pitch=${activity.pitch}&fov=${activity.fov}&zoom=${activity.zoom}&key=${process.env.GOOGLE_STREET_VIEW_KEY}`;
    },
  },
};
</script>

<style scoped>

</style>
