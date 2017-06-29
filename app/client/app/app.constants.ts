'use strict';
const angular = require('angular');

export default angular.module('t1App.constants', [])
  .constant('appConfig', require('../../server/config/environment/shared'))
  .name;
