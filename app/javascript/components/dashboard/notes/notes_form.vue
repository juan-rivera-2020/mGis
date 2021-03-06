<template>
  <div>
    <div class="notes_input mt-2" :class="{'_disabled': loading}">
      <span class="close-icon" @click.stop="$emit('close-note-input')" :class="{'_disabled': loading}">
        <i class="fas fa-times"></i>
      </span>
      <center>{{title}}</center>
      <div class="form-group">
        <label class="badge badge-secondary">Note</label>
        <textarea class="form-control" v-model="DV_note.body" rows="5" v-validate="'required'" placeholder="your note comes here..."></textarea>
      </div>
      <div class="input-group mb-2">
        <div v-for="file in filteredFiles" class="d-flex mb-2 w-100">
          <div class="input-group-prepend">
            <div class="input-group-text clickable" :class="{'btn-disabled': !file.uri}" @click.prevent="downloadFile(file)">
              <i class="fas fa-file-image"></i>
            </div>
          </div>
          <input
            readonly
            type="text"
            class="form-control form-control-sm mw-95"
            :value="file.name || file.uri"
          />
          <div
            :class="{'_disabled': loading}"
            class="del-check clickable"
            @click.prevent="deleteFile(file)"
            >
            <i class="fas fa-times"></i>
          </div>
        </div>
      </div>
      <div class="form-group" >
        <attachment-input
          @input="addFile"
          :show-label="true"
        />
      </div>
      <div class="d-flex form-group mt-4">
        <button
          :disabled="!readyToSave || loading"
          class="btn btn-success btn-sm"
          @click.prevent.stop="saveNote"
          >
          Save
        </button>
      </div>
    </div>
    <div v-if="loading" class="load-spinner spinner-border text-dark" role="status"></div>
  </div>
</template>

<script>
  import axios from 'axios'
  import humps from 'humps'
  import AttachmentInput from './../../shared/attachment_input'
  import {mapGetters} from 'vuex'

  export default {
    props: ['facility', 'note', 'title'],
    components: {AttachmentInput},
    data() {
      return {
        DV_note: {
          body: '',
          noteFiles: []
        },
        loading: true,
        destroyedFiles: []
      }
    },
    mounted() {
      if (this.note) {
        this.DV_note = {...this.DV_note, ..._.cloneDeep(this.note)}
        this.addFile(this.note.attachFiles)
      }
      this.loading = false
    },
    methods: {
      addFile(files) {
        let _files = [...this.DV_note.noteFiles]
        for (let file of files) {
          file.guid = this.guid()
          _files.push(file)
        }
        this.DV_note.noteFiles = _files
      },
      deleteFile(file) {
        if (!file) return;

        var confirm = window.confirm(`Are you sure, you want to delete attachment?`)
        if (!confirm) return;

        if (file.uri) {
          var index = this.DV_note.noteFiles.findIndex(f => f.guid === file.guid)
          Vue.set(this.DV_note.noteFiles, index, {...file, _destroy: true})
          this.destroyedFiles.push(file)
        }
        else if (file.name) {
          this.DV_note.noteFiles.splice(this.DV_note.noteFiles.findIndex(f => f.guid === file.guid), 1)
        }
      },
      saveNote() {
        this.$validator.validate().then((success) =>
        {
          if (!success || this.loading) {
            this.showErrors = !success
            return;
          }

          this.loading = true
          var formData = new FormData()
          formData.append('note[body]', this.DV_note.body)
          formData.append('note[destroy_file_ids]', _.map(this.destroyedFiles, 'id'))
          for (var file of this.DV_note.noteFiles) {
            if (!file.id) {
              formData.append('note[note_files][]', file)
            }
          }

          var url = `/projects/${this.currentProject.id}/facilities/${this.facility.id}/notes.json`
          var method = "POST"
          var callback = "note-created"

          if (this.note && this.note.id) {
            url = `/projects/${this.currentProject.id}/facilities/${this.facility.id}/notes/${this.note.id}.json`
            method = "PUT"
            callback = "note-updated"
          }

          axios({
            method: method,
            url: url,
            data: formData,
            headers: {
              'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').attributes['content'].value
            }
          })
          .then((response) => {
            this.$emit(callback, humps.camelizeKeys(response.data))
          })
          .catch((err) => {
            console.log(err)
          })
          .finally(() => {
            this.loading = false
          })
        })
      },
      downloadFile(file) {
        let url = window.location.origin + file.uri
        window.open(url, '_blank');
      }
    },
    computed: {
      ...mapGetters([
        'currentProject'
      ]),
      readyToSave() {
        return (
          this.DV_note &&
          this.DV_note.body !== ''
        )
      },
      filteredFiles() {
        return _.filter(this.DV_note.noteFiles, f => !f._destroy)
      }
    }
  }
</script>

<style scoped lang="scss">
  .notes_input {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 15px;
  }
  .close-icon {
    float: right;
    cursor: pointer;
    display: flex;
    flex-direction: row-reverse;
  }
  .del-check {
    position: relative;
    top: -5px;
    display: flex;
    right: 10px;
    background: #fff;
    height: fit-content;
    color: red;
  }
</style>
