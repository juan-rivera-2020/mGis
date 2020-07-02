export default {
  methods: {
    getSorted(array) {
      if (typeof(array[0]) === 'number') {
        let temp = array[0]
        array[0] = array[1]
        array[1] = temp
      }
      else {
        array.map((element) => this.getSorted(element))
      }
    },
    guid() {
      return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8)
        return v.toString(16)
      })
    },
    random() {
      return Math.floor(new Date().valueOf() * Math.random())
    },
    getAverage(_count, _total) {
      return (((_count / _total) * 100) || 0).toFixed(2)
    },
    upsert(array, item) {
      const i = array.findIndex(_item => _item.hasOwnProperty(Object.keys(item)[0]))
      if (i > -1) array[i] = item
      else array.push(item)
    }
  }
}
