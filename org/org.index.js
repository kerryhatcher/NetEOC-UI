import {hawtioPluginLoader } from 'adminjs-core';

var Org;
(function (Org) {



    Org.pluginName = 'Org';
    Org.templatePath = '';

    Org._module = angular.module(Org.pluginName, ['http-auth-interceptor', require('angular-cookies'), require('angular-resource'), 'UserPlugin']);

    Org.tab = undefined;


    // import Routes
    Org.OrgRoutes = require('./org.routes')(Org);

    //console.log('meep');

    Org.OrgService = require('./org.services')(Org);

    Org.OrgControllers = require('./org.controllers')(Org);

    Org._module.run(['HawtioNav', '$rootScope', '$location', 'Session', function(HawtioNav, $rootScope, $location, Session) {
        HawtioNav.add(Org.tab);
    }]);


    hawtioPluginLoader.addModule(Org.pluginName);



})(Org || (Org = {}));


module.exports = Org;
