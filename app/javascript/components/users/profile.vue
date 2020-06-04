<template>
  <div id="users_wrapper" v-if="!loading">
    <h5 class="my-3">Edit User Profile</h5>
    <form @submit.prevent="handleSubmit" class="w-100" autocomplete="off">
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">Title</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" v-model="profile.title" placeholder="Mr.">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">Firt Name</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" v-model="profile.firstName" placeholder="John">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">Last Name</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" v-model="profile.lastName" placeholder="Doe">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-10">
          <input type="email" readOnly class="form-control" v-model="profile.email" placeholder="johndoe@example.com" autocomplete="off">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">Password <span class="font-sm text-success" @click.prevent.stop="editPass=true">(click to edit)</span></label>
        <div class="col-sm-10">
          <input type="password" class="form-control" placeholder="Password" v-model="profile.password" :readOnly="!editPass" autocomplete="off">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">Password Confirmation</label>
        <div class="col-sm-10">
          <input type="password" :readOnly="!editPass" class="form-control" placeholder="Password Confirm" v-model="profile.passwordConfirmation" autocomplete="off">
          <span v-if="!C_passCheck" class="font-sm text-danger">Password mismatch</span>
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">Phone Number</label>
        <div class="col-sm-10">
          <vue-phone-number-input
            :value="C_phone"
            @update="onUpdatePhone"
            id="phone-number__input"
            :default-country-code="C_code"
          />
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">Address</label>
        <div class="col-sm-10">
          <GmapAutocomplete
            class='gmap-input form-control'
            @place_changed="updateAddress"
            :value="profile.address"
            @input.stop="profile.address.address=$event.target.value"
            @keypress.enter="$event.preventDefault"
          />
          <div v-if="C_addressDrawn" class='gmap-wraper'>
            <GmapMap
              map-type-id="terrain"
              ref="googlemap"
              :zoom="15"
              :options="{
                rotateControl: false,
                minZoom: 2,
                zoomControl: true,
                mapTypeControl: false,
                scaleControl: false,
                streetViewControl: false,
                fullscreenControl: false
              }"
              style="width: 100%; height: 99%"
              :center="center"
              >
              <GmapMarker
                :animation="4"
                :position="C_latLng"
              />
            </GmapMap>
          </div>
        </div>
      </div>
      <div class="form-group row d-flex justify-content-end">
        <button class="btn btn-sm btn-primary m-3" :disabled="!enableEdit">Update</button>
      </div>
    </form>
  </div>
</template>

<script>
  import http from './../../common/http'
  export default {
    data() {
      return {
        loading: true,
        editPass: false,
        profile: {
          email: '',
          firstName: '',
          lastName: '',
          title: '',
          phoneNumber: '',
          address: '',
          role: '',
          lat: '',
          lng: '',
          password: '',
          passwordConfirmation: '',
          countryCode: ''
        },
        phoneData: {},
        gmap_address: {},
        center: {lat: 40.64, lng: -74.66}
      }
    },
    mounted() {
      this.fetchProfile()
    },
    methods: {
      fetchProfile() {
        http.get('/current_user.json')
          .then((res) => {
            this.profile = {...this.profile, ...res.data}
            this.gmap_address.formatted_address = this.profile.address
            if (this.C_addressDrawn) {
              this.center = {lat: this.profile.lat, lng: this.profile.lng}
            }
            this.loading = false
          })
          .catch((err) => {
            console.log(err)
          })
      },
      onUpdatePhone(data) {
        this.phoneData = data
        if (data.formattedNumber)
        {
          this.profile.phoneNumber = data.formattedNumber
          this.profile.countryCode = data.countryCode
        }
      },
      updateAddress(address) {
        this.gmap_address = address
      },
      handleSubmit(event) {
        if (!this.enableEdit) return;
        let data = Object.assign({}, this.profile)
        if (!this.editPass) {
          delete data.password
          delete data.passwordConfirmation
        }
        http.post('/profile.json', {profile: data})
          .then((res) => {
            console.log("profile-updated")
          })
          .catch((err) => {
            console.log(err)
          })
      }
    },
    computed: {
      C_phone() {
        return this.phoneData.phoneNumber ? this.phoneData.formatNational : this.profile.phoneNumber
      },
      C_code() {
        return this.phoneData.phoneNumber ? this.phoneData.countryCode : this.profile.countryCode
      },
      C_addressDrawn() {
        return this.profile.lat !== '' && this.profile.lng !== ''
      },
      C_latLng() {
        this.center = {lat: Number(this.profile.lat), lng: Number(this.profile.lng)}
        return this.center
      },
      C_passCheck() {
        if (this.editPass) {
          return this.profile.password === this.profile.passwordConfirmation
        } else {
          return true
        }
      },
      C_passValidation() {
        return this.profile.password.length >= 10 && this.profile.password === this.profile.passwordConfirmation
      },
      enableEdit() {
        return this.editPass ? this.C_passValidation : true
      }
    },
    watch: {
      gmap_address: {
        handler: function(value) {
          this.profile.address = value.formatted_address
          if (value.geometry) {
            this.profile.lat = value.geometry.location.lat()
            this.profile.lng = value.geometry.location.lng()
          }
        }, deep: true
      }
    }
  }
</script>

<style lang="scss" scoped>
  #users_wrapper {
    padding: 20px 70px;
    height: calc(100vh - 90px);
    width: 80%;
    margin: 0 auto;
    display: flex;
    flex-wrap: wrap;
  }
  .gmap-wraper {
    width: 100%;
    height: 300px;
    margin-top: 10px;
  }
</style>