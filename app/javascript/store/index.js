import http from './../common/http'
import * as Moment from 'moment'
import {extendMoment} from 'moment-range'
const moment = extendMoment(Moment)
import createPersistedState from 'vuex-persistedstate'
import * as Cookies from 'js-cookie'

// utility function
const getSimpleDate = (date) => {
  var dt = [undefined, null, 'N/A'].includes(date) ? new Date : new Date(date)
  var y = dt.getFullYear()
  var m = dt.getMonth()
  var d = dt.getDate()
  return new Date(y, m, d, 0, 0, 0).getTime()
}

export default new Vuex.Store({
  state: {
    mapLoading: true,
    sideLoading: true,
    projects: [],
    facilities: [],
    facilityGroups: [],
    statuses: [],
    taskTypes: [],
    issueTypes: [],
    issueSeverities: [],
    currentProject: null,
    currentFacility: null,
    currentFacilityGroup: null,
    mapFilters: [],
    projectStatusFilter: null,
    taskTypeFilter: null,
    facilityGroupFilter: null,
    facilityNameFilter: null,
    facilityProgressFilter: null,
    facilityDueDateFilter: null,
    issueTypeFilter: null,
    issueSeverityFilter: null,
    issueProgressFilter: null,
    taskProgressFilter: null
  },

  mutations: {
    setMapLoading: (state, loading) => state.mapLoading = loading,
    setSideLoading: (state, loading) => state.sideLoading = loading,
    setProjects: (state, projects) => state.projects = projects,
    setFacilities: (state, facilities) => state.facilities = facilities,
    setFacilityGroups: (state, facilityGroups) => state.facilityGroups = facilityGroups,
    setStatuses: (state, statuses) => state.statuses = statuses,
    setTaskTypes: (state, taskTypes) => state.taskTypes = taskTypes,
    setIssueTypes: (state, issueTypes) => state.issueTypes = issueTypes,
    setIssueSeverities: (state, issueSeverities) => state.issueSeverities = issueSeverities,
    setCurrentProject: (state, project) => state.currentProject = project,
    setCurrentFacility: (state, facility) => state.currentFacility = facility,
    setCurrentFacilityGroup: (state, facilityGroup) => state.currentFacilityGroup = facilityGroup,
    setMapFilters: (state, filters) => state.mapFilters = filters,
    updateFacilities: (state, {index, facility}) => Vue.set(state.facilities, index, facility),
    updateMapFilters: (state, {key, filter, same, _k}) => {
      if (filter && !filter.includes(null) && Array.isArray(filter) && filter.length > 0) {
        var i = state.mapFilters.findIndex(f => f.hasOwnProperty(key))
        if (i < 0) i = state.mapFilters.length
        var value = {[key]: same ? filter : _.map(filter, _k || 'id')}
        Vue.set(state.mapFilters, i, value)
      }
      else {
        state.mapFilters = _.filter(state.mapFilters, f => !f.hasOwnProperty(key))
      }
    },
    setProjectStatusFilter: (state, filter) => state.projectStatusFilter = filter,
    setTaskTypeFilter: (state, filter) => state.taskTypeFilter = filter,
    setFacilityGroupFilter: (state, filter) => state.facilityGroupFilter = filter,
    setFacilityNameFilter: (state, filter) => state.facilityNameFilter = filter,
    setFacilityProgressFilter: (state, filter) => state.facilityProgressFilter = filter,
    setFacilityDueDateFilter: (state, filter) => state.facilityDueDateFilter = filter,
    setIssueTypeFilter: (state, filter) => state.issueTypeFilter = filter,
    setIssueSeverityFilter: (state, filter) => state.issueSeverityFilter = filter,
    setIssueProgressFilter: (state, filter) => state.issueProgressFilter = filter,
    setTaskProgressFilter: (state, filter) => state.taskProgressFilter = filter
  },

  getters: {
    mapLoading: state => state.mapLoading,
    sideLoading: state => state.sideLoading,
    projects: state => state.projects,
    facilities: state => state.facilities,
    facilityGroups: state => state.facilityGroups,
    statuses: state => state.statuses,
    taskTypes: state => state.taskTypes,
    issueTypes: state => state.issueTypes,
    issueSeverities: state => state.issueSeverities,
    currentProject: state => state.currentProject,
    currentFacility: state => state.currentFacility,
    currentFacilityGroup: state => state.currentFacilityGroup,
    mapFilters: state => state.mapFilters,
    filteredFacilities: (state, getters) => (_status='active') => {
      return _.filter(getters.facilities, (facility) => {
        var valid = _status === 'all' || facility.status === _status
        if (!valid) return valid
        _.each(state.mapFilters, (f) => {
          var k = Object.keys(f)[0]
          switch(k) {
            case "dueDate": {
              var range = moment.range(f[k][0], f[k][1])
              valid = valid && facility[k] && range.contains(new Date(facility[k].replace(/-/g, '/')))
              break
            }
            case "progress": {
              var ranges = f[k].map(r => r.split("-").map(Number))
              var is_valid = false
              for (var range of ranges) {
                is_valid = range[1] !== undefined ? range[0] <= facility[k] && range[1] >= facility[k] : facility[k] == range[0]
                if (is_valid) break
              }
              valid = valid && is_valid
              break
            }
            case "taskTypeIds": {
              var ids = _.map(facility.tasks, 'taskTypeId')
              valid = valid && _.intersection(f[k], ids).length > 0
              break
            }
            case "issueTypeIds": {
              var ids = _.map(facility.issues, 'issueTypeId')
              valid = valid && _.intersection(f[k], ids).length > 0
              break
            }
            case "issueProgress":
            case "taskProgress": {
              var progressFor = k === 'taskProgress' ? facility.tasks : facility.issues
              var progress = _.uniq(_.map(progressFor, 'progress'))
              var ranges = f[k].map(r => r.split("-").map(Number))
              var is_valid = false
              for (var range of ranges) {
                var size = range[1] ? (range[1] - range[0]) + 1 : 1
                is_valid = _.intersection(progress, Array.from(Array(size), (_, i) => i + range[0])).length > 0
                if (is_valid) break
              }
              valid = valid && is_valid
              break
            }
            case "issueSeverityIds": {
              var ids = _.map(facility.issues, 'issueSeverityId')
              valid = valid && _.intersection(f[k], ids).length > 0
              break
            }
            case "facilityGroupIds": {
              valid = valid && f[k].includes(facility.facilityGroupId)
              break
            }
            case "ids": {
              valid = valid && f[k].includes(facility.id)
              break
            }
            case "statusIds": {
              valid = valid && f[k].includes(facility.statusId)
              break
            }
            default: {
              valid = valid && facility[k] == f[k]
              break
            }
          }
        })
        return valid
      })
    },
    filteredFacilityGroups: (state, getters) => {
      var ids = _.map(getters.filteredFacilities('active'), 'facilityGroupId')
      return _.filter(getters.facilityGroups, fg => ids.includes(fg.id))
    },
    facilityCount: (state, getters) => {
      return getters.filteredFacilities('all').length
    },
    facilityProgress: (state, getters) => {
      var mean = _.meanBy(getters.filteredFacilities('active'), 'progress') || 0
      return mean.toFixed(2)
    },
    filterFacilitiesWithActiveFacilityGroups: (state, getters) => {
      var ids = _.map(_.filter(state.facilityGroups, fg => fg.status === 'active'), 'id')
      return _.filter(getters.filteredFacilities('active'), (f) => ids.includes(f.facilityGroupId) && f.status === 'active')
    },
    unFilterFacilities: (state) => {
      var ids = _.map(_.filter(state.facilityGroups, fg => fg.status === 'active'), 'id')
      return _.filter(state.facilities, (f) => ids.includes(f.facilityGroupId) && f.status === 'active')
    },
    activeFacilityGroups: (state, getters) => (id=getters.currentProject.id) => {
      return _.filter(getters.facilityGroups, f => f.status === 'active' && f.projectIds.includes(id))
    },
    currentTasks: (state, getters) => {
      return _.flatten(_.map(getters.filterFacilitiesWithActiveFacilityGroups, 'tasks'))
    },
    facilityGroupFacilities: (state, getters) => (group) => {
      var ids = _.map(getters.filteredFacilities('active'), 'id')
      return _.filter(group.facilities, f => ids.includes(f.facilityId) && f.projectId === getters.currentProject.id)
    },

    // gantt chart view
    ganttData: (state, getters) => {
      var hash = new Array

      // for project
      var p_id = `p_${getters.currentProject.id}`
      var p_s_date = _.min(_.map(getters.currentTasks, 'startDate')) || 'N/A'
      var p_e_date = _.max(_.map(getters.currentTasks, 'dueDate')) || 'N/A'
      var p_duration = getSimpleDate(p_e_date) - getSimpleDate(p_s_date) || 0
      var p_progress = _.meanBy(getters.currentTasks, 'progress') || 0

      hash.push(
        {
          id: p_id,
          name: getters.currentProject.name,
          duration: p_duration,
          durationInDays: `${Math.ceil(p_duration / (1000 * 3600 * 24)) || 0} days`,
          percent: p_progress.toFixed(2),
          start: getSimpleDate(p_s_date),
          startDate: p_s_date,
          endDate: p_e_date,
          type: 'project'
        }
      )

      // for facility_groups
      var groups = _.groupBy(getters.filterFacilitiesWithActiveFacilityGroups, 'facilityGroupName')
      for (var group in groups) {
        var fg_id = `${p_id}_fg_${group}`
        var fg_tasks = _.flatten(_.map(groups[group], 'tasks'))
        var fg_s_date = _.min(_.map(fg_tasks, 'startDate')) || 'N/A'
        var fg_e_date = _.max(_.map(fg_tasks, 'dueDate')) || 'N/A'
        var fg_duration = getSimpleDate(fg_e_date) - getSimpleDate(fg_s_date) || 0
        var fg_progress = _.meanBy(fg_tasks, 'progress') || 0

        hash.push(
          {
            id: fg_id,
            parentId: p_id,
            name: group,
            duration: fg_duration,
            durationInDays: `${Math.ceil(fg_duration / (1000 * 3600 * 24)) || 0} days`,
            percent: fg_progress.toFixed(2),
            start: getSimpleDate(fg_s_date),
            startDate: fg_s_date,
            endDate: fg_e_date,
            type: 'milestone'
          }
        )

        // for facilities under facility_groups
        for (var facility of groups[group]) {
          var f_id = `${fg_id}_f_${facility.id}`
          var f_s_date = _.min(_.map(facility.tasks, 'startDate')) || 'N/A'
          var f_e_date = _.max(_.map(facility.tasks, 'dueDate')) || 'N/A'
          var f_duration = getSimpleDate(f_e_date) - getSimpleDate(f_s_date) || 0
          var f_progress = _.meanBy(facility.tasks, 'progress') || 0

          hash.push(
            {
              id: f_id,
              parentId: fg_id,
              name: facility.facility.facilityName,
              duration: f_duration,
              durationInDays: `${Math.ceil(f_duration / (1000 * 3600 * 24)) || 0} days`,
              percent: f_progress.toFixed(2),
              start: getSimpleDate(f_s_date),
              startDate: f_s_date,
              endDate: f_e_date,
              type: 'milestone'
            }
          )

          // for task_types under facilities
          var types = _.groupBy(facility.tasks, 'taskType')
          for (var type in types) {
            var tasks = types[type]
            var tt_id = `${f_id}_tt_${type}`
            var tt_s_date = _.min(_.map(tasks, 'startDate'))
            var tt_e_date = _.max(_.map(tasks, 'dueDate'))
            var tt_duration = getSimpleDate(tt_e_date) - getSimpleDate(tt_s_date)
            var tt_progress = _.meanBy(tasks, 'progress')

            hash.push(
              {
                id: tt_id,
                parentId: f_id,
                name: type,
                duration: tt_duration,
                durationInDays: `${Math.ceil(tt_duration / (1000 * 3600 * 24))} days`,
                percent: tt_progress.toFixed(2),
                start: getSimpleDate(tt_s_date),
                startDate: tt_s_date,
                endDate: tt_e_date,
                type: 'task'
              }
            )

            // for tasks under task_types
            for (var task of tasks) {
              var t_id = `${tt_id}_t_${task.id}`
              var t_duration = getSimpleDate(task.dueDate) - getSimpleDate(task.startDate)

              hash.push(
                {
                  id: t_id,
                  parentId: tt_id,
                  name: task.text,
                  duration: t_duration,
                  durationInDays: `${Math.ceil(t_duration / (1000 * 3600 * 24))} days`,
                  percent: task.progress.toFixed(2),
                  start: getSimpleDate(task.startDate),
                  startDate: task.startDate,
                  endDate: task.dueDate,
                  type: 'task'
                }
              )

              // for checklists under tasks
              for (var checklist of task.checklists) {
                var c_id = `${t_id}_t_${checklist.id}`
                hash.push(
                  {
                    id: c_id,
                    parentId: t_id,
                    name: checklist.text,
                    duration: t_duration,
                    durationInDays: `${Math.ceil(t_duration / (1000 * 3600 * 24))} days`,
                    percent: task.progress.toFixed(2),
                    start: getSimpleDate(task.startDate),
                    startDate: task.startDate,
                    endDate: task.dueDate,
                    type: 'task'
                  }
                )
              }
            }
          }
        }
      }

      return hash
    }
  },

  actions: {
    fetchFacilities({commit, dispatch}, id) {
      return new Promise((resolve, reject) => {
        http.get(`/projects/${id}/facilities.json`)
          .then((res) => {
            var facilities = []
            for (var facility of res.data.facilities) {
              facilities.push({...facility, ...facility.facility})
            }
            commit('setFacilities', facilities)
            commit('setCurrentProject', res.data.project)
            resolve()
          })
          .catch((err) => {
            console.error(err)
            reject()
          })
      })
    },
    fetchProjects({commit}) {
      return new Promise((resolve, reject) => {
        http.get('/projects.json')
          .then((res) => {
            commit('setProjects', res.data.projects)
            resolve()
          })
          .catch((err) => {
            console.error(err)
            reject()
          })
      })
    },
    fetchFacilityGroups({commit}, id) {
      let url = '/api/facility_groups.json'
      if (id !== undefined) url = url + `?=project_id=${id}`
      return new Promise((resolve, reject) => {
        http.get(url)
          .then((res) => {
            commit('setFacilityGroups', res.data.facilityGroups)
            resolve()
          })
          .catch((err) => {
            console.error(err)
            reject()
          })
      })
    },
    fetchStatuses({commit}) {
      return new Promise((resolve, reject) => {
        http.get('/api/statuses.json')
          .then((res) => {
            commit('setStatuses', res.data.statuses)
            resolve()
          })
          .catch((err) => {
            console.error(err)
            reject()
          })
      })
    },
    fetchTaskTypes({commit}) {
      return new Promise((resolve, reject) => {
        http.get('/api/task_types.json')
          .then((res) => {
            commit('setTaskTypes', res.data.taskTypes)
            resolve()
          })
          .catch((err) => {
            console.error(err)
            reject()
          })
      })
    },
    fetchIssueTypes({commit}) {
      return new Promise((resolve, reject) => {
        http.get('/api/issue_types.json')
          .then((res) => {
            commit('setIssueTypes', res.data.issueTypes)
            resolve()
          })
          .catch((err) => {
            console.error(err)
            reject()
          })
      })
    },
    fetchIssueSeverities({commit}) {
      return new Promise((resolve, reject) => {
        http.get('/api/issue_severities.json')
          .then((res) => {
            commit('setIssueSeverities', res.data.issueSeverities)
            resolve()
          })
          .catch((err) => {
            console.error(err)
            reject()
          })
      })
    },
    async fetchDashboardData({dispatch}, {id, cb}) {
      await dispatch('fetchProjects')
      await dispatch('fetchFacilities', id)
      await dispatch('fetchFacilityGroups', id)
      await dispatch('fetchStatuses')
      await dispatch('fetchTaskTypes')
      await dispatch('fetchIssueTypes')
      await dispatch('fetchIssueSeverities')
      if (cb) return cb()
    }
  },

  plugins: [
    createPersistedState({
      localStorage: {
        getState: key => Cookies.getJSON(key),
        setState: (key, state) => Cookies.set(key, state, { expires: 3 }),
        removeItem: key => Cookies.remove(key),
      },
      paths: [
        'projectStatusFilter',
        'taskTypeFilter',
        'facilityGroupFilter',
        'facilityNameFilter',
        'facilityProgressFilter',
        'facilityDueDateFilter',
        'issueTypeFilter',
        'issueSeverityFilter',
        'issueProgressFilter',
        'taskProgressFilter',
        'mapFilters'
      ]
    })
  ]
})