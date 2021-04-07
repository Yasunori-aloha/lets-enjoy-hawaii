<template>
  <div>
    <li class="main__wrapper__sm">
      <p class="paragraph__header__sm">関連エリア</p>
      <router-link :to="{name: 'search', params:{name: experienceData.area.island.search, case: 'island', id: experienceData.area.island.id, typeWord: experienceData.area.island.name }}" class="area__genre__sm">
        <span>{{ experienceData.area.island.name }}</span>
        <i class="fas fa-angle-right"></i>
      </router-link>
      <router-link :to="{name: 'search', params:{name: experienceData.area.search, case: 'area', id: experienceData.area.id, typeWord: experienceData.area.name }}" class="area__genre__sm">
        <span>{{ experienceData.area.name }}</span>
        <i class="fas fa-angle-right"></i>
      </router-link>
    </li>
    <li class="main__wrapper__sm">
      <p class="paragraph__header__sm">関連ジャンル</p>
      <router-link :to="{name: 'search', params:{name: experienceData.genre.category.search, case: 'category', id: experienceData.genre.category.id, typeWord: experienceData.genre.category.name }}" class="area__genre__sm">
        <span>{{ experienceData.genre.category.name }}</span>
        <i class="fas fa-angle-right"></i>
      </router-link>
      <router-link :to="{name: 'search', params:{name: experienceData.genre.search, case: 'genre', id: experienceData.genre.id, typeWord: experienceData.genre.name }}" class="area__genre__sm">
        <span>{{ experienceData.genre.name }}</span>
        <i class="fas fa-angle-right"></i>
      </router-link>
    </li>
  </div>
</template>

<script>
export default {
  computed: {
    experienceData() {
      return this.$store.getters.experienceData;
    },
  },
};
</script>

<style scoped>
  .area__genre__sm{
    height: 46px;
    padding: 0 10px;
    font-size: 14px;
    color: #333333;
    text-decoration: none;
    font-weight: bold;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .main__wrapper__sm{
    margin-bottom: 0px;
  }
  .main__wrapper__sm a:first-of-type{
    border-bottom: 1px solid #ccc;
  }
</style>
