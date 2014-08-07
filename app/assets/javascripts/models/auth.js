angular.module('ng.model').factory('Auth', ['$resource', function($resource) {
    function Auth() {
        this.url = '/auth/';
        return $resource(this.url, {id: '@id'},{
            'sign_in':    {method:'POST','url':this.url+'sign_in'},
            'sign_out':  {method:'DELETE','url':this.url+'sign_out'},
            'is_sign': {method:'GET','url':this.url+'is_sign'},
            'sign_up': {method:'POST','url':this.url+'sign_up'}
        });
    };
    return new Auth();
}]);
