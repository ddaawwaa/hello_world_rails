<template>
  <div id="user-list">
    <ul>
      <li v-for="user in users" v-bind:key="user.account">
        <div>{{user.account}}</div>
        <div>{{user.name}}</div>
        <div>{{user.email}}</div>
      </li>
    </ul>
  </div>
</template>


<script lang="ts">
  import axios from "axios"
  import { Vue, Component } from "vue-property-decorator"

  @Component
  export default class UserList extends Vue {
    users: String[] = []

    async mounted(): Promise<void>  {
      await this.fetchUsers();
    }

    async fetchUsers(): Promise<void> {
      await axios.get("/users").then((response) => {
        response.data.map((user: any) => {
          this.users.push(user);
        })
      })
    }
  }
</script>

<style lang="scss" scoped>
.user-list {
  height: 100%;
}
</style>