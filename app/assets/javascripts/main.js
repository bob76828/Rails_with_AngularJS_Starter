angular.module("rails.with.angularJS.starter",
    ['ngResource','ngAnimate','ng.router','ng.controller','ng.model','ng.directive','ui.router','ui.bootstrap'])
    .config(['$httpProvider',
        function($httpProvider) {
            $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
        }])
    .run(['$rootScope',
        function($rootScope) {

        }]);

angular.element(document).ready(function() {
    angular.bootstrap(document, ['rails.with.angularJS.starter']);
});


