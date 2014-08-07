angular.module('ng.router').config(['$urlRouterProvider','$stateProvider',function($urlRouterProvider, $stateProvider) {
    $stateProvider.state('guest', {
        abstract: true,
        url: '',
        template: JST['views/layouts/layout']
    }).state('guest.index', {
        url: "/",
        views: {
            "header@guest": {
                template: JST['views/partials/header'],
                controller : 'HeaderCtrl'
            },
            "section@guest": {
                template: JST['views/index'],
                controller : 'IndexCtrl'
            },
            "footer@guest": {
                template: JST['views/partials/footer']
            }
        }
    });
    $urlRouterProvider.otherwise('/');
}]);