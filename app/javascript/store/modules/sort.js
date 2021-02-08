export default {
  state: {
    sort: {
      activeSort: {
        createdAt: true,
        score: false,
        reviewCounts: false,
        favoriteCounts: true,
      },
      activeList: null,
      isFadeIn: false,
    },
  },
  getters: {
    sort: state => state.sort,
  },
  mutations: {
    resetSort(state) {
      const resetSort = {
        activeSort: {
          createdAt: true,
          score: false,
          reviewCounts: false,
          favoriteCounts: true,
        },
        activeList: null,
        isFadeIn: false,
      };

      this.state.sort.sort = resetSort;
    },
    sortCreatedAt(state) {
      const notSortedYet = !(this.state.sort.sort.activeSort['createdAt']);
      if (notSortedYet) {
        // 'mapメソッド'を使って'review'と'スコア'が入った配列を作成する。
        let tmp = this.state.experience.experienceData.reviews.map(review => {
          return {
            review,
            key: review['created_at']
          };
        // 作成した配列内の'スコア'を基に降順ソートしていく。
        }).sort((a,b) =>{
          if (a.key > b.key) {
            return -1;
          } else {
            return 1;
          }
        // ソートした配列から'review'だけを取り出した配列を作成してそれを代入する。
        }).map(sortCreatedAt => {
          return sortCreatedAt.review;
        });

        // 並び替えボタンの表示を変更する。
        this.state.sort.sort.activeSort['createdAt'] = true;
        this.state.sort.sort.activeSort['score'] = false;

        this.state.sort.sort.isFadeIn = true;
        setTimeout(() => {
          this.state.sort.sort.isFadeIn = false;
        }, 750);

        return this.state.experience.experienceData.reviews = tmp;
      }
    },
    sortScore(state, currentPath) {
      const notSortedYet = !(this.state.sort.sort.activeSort['score']);
      const experiencesPage = /\/experiences\/\d{1,}\/reviews/.test(currentPath);

      if (notSortedYet) {
        if (experiencesPage) {
          // 'mapメソッド'を使って'review'と'スコア'が入った配列を作成する。
          let tmp = this.state.experience.experienceData.reviews.map(review => {
            return {
              review,
              key: review['score']
            };
          // 作成した配列内の'スコア'を基に降順ソートしていく。
          }).sort((a,b) =>{
            if (a.key > b.key) {
              return -1;
            } else {
              return 1;
            }
          // ソートした配列から'review'だけを取り出した配列を作成してそれを代入する。
          }).map(sortScore => {
            return sortScore.review;
          });

          // 並び替えボタンの表示を変更する。
          this.state.sort.sort.activeSort['createdAt'] = false;
          this.state.sort.sort.activeSort['score'] = true;

          this.state.sort.sort.isFadeIn = true;
          setTimeout(() => {
            this.state.sort.sort.isFadeIn = false;
          }, 750);

          return this.state.experience.experienceData.reviews = tmp;
        } else {
          // 'mapメソッド'を使って'アクティビティリスト'と'スコア'が入った配列を作成する。
          let tmp = this.state.sort.sort.activeList.map(list => {
            return {
              list,
              key: list['score'],
            };
          // 作成した配列内の'スコア'を基に降順ソートしていく。
          }).sort((a,b) => {
            if (a.key > b.key) {
              return -1;
            } else {
              return 1;
            }
          // ソートした配列から'アクティビティリスト'だけを取り出した配列を作成してそれを代入する。
          }).map(sortScore => {
            return sortScore.list;
          });

          // 並び替えボタンの表示を変更する。
          this.state.sort.sort.activeSort['score'] = true;
          this.state.sort.sort.activeSort['reviewCounts'] = false;
          this.state.sort.sort.activeSort['favoriteCounts'] = false;

          this.state.sort.sort.isFadeIn = true;
          setTimeout(() => {
            this.state.sort.sort.isFadeIn = false;
          }, 750);

          return this.state.sort.sort.activeList = tmp;
        }
      }
    },
    sortReviewCounts(state) {
      const notSortedYet = !(this.state.sort.sort.activeSort['reviewCounts']);
        // 'mapメソッド'を使って'アクティビティリスト'と'お気に入り数'が入った配列を作成する。
      if (notSortedYet) {
        let tmp = this.state.sort.sort.activeList.map(list => {
          return {
            list,
            key: list['favorite_counts'],
          };
        // 作成した配列内の'お気に入り数'を基に降順ソートしていく。
        }).sort((a,b) => {
          if (a.key > b.key) {
            return -1;
          } else {
            return 1;
          }
        // ソートした配列から'アクティビティリスト'だけを取り出した配列を作成してそれを代入する。
        }).map(sortReviewCounts => {
          return sortReviewCounts.list;
        });

        // 並び替えボタンの表示を変更する。
        this.state.sort.sort.activeSort['favoriteCounts'] = false;
        this.state.sort.sort.activeSort['reviewCounts'] = true;
        this.state.sort.sort.activeSort['score'] = false;

        this.state.sort.sort.isFadeIn = true;
        setTimeout(() => {
          this.state.sort.sort.isFadeIn = false;
        }, 750);

        return this.state.sort.sort.activeList = tmp;
      };
    },
    sortFavoriteCounts(state) {
      const notSortedYet = !(this.state.sort.sort.activeSort['favoriteCounts']);
        // 'mapメソッド'を使って'アクティビティリスト'と'お気に入り数'が入った配列を作成する。
      if (notSortedYet) {
        let tmp = this.state.sort.sort.activeList.map(list => {
          return {
            list,
            key: list['favorite_counts'],
          };
        // 作成した配列内の'お気に入り数'を基に降順ソートしていく。
        }).sort((a,b) => {
          if (a.key > b.key) {
            return -1;
          } else {
            return 1;
          }
        // ソートした配列から'アクティビティリスト'だけを取り出した配列を作成してそれを代入する。
        }).map(sortFavoriteCounts => {
          return sortFavoriteCounts.list;
        });

        // 並び替えボタンの表示を変更する。
        this.state.sort.sort.activeSort['favoriteCounts'] = true;
        this.state.sort.sort.activeSort['reviewCounts'] = false;
        this.state.sort.sort.activeSort['score'] = false;

        this.state.sort.sort.isFadeIn = true;
        setTimeout(() => {
          this.state.sort.sort.isFadeIn = false;
        }, 750);

        return this.state.sort.sort.activeList = tmp;
      };
    },
  },
};
