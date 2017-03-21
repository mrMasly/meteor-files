Package.describe({
  name: 'mrmasly:files',
  version: '0.0.2',
  summary: 'Store files in Meteor Mongo Collections',
  git: 'https://github.com/mrMasly/meteor-files',
  documentation: 'README.md'
});


Npm.depends({
  "fs-extra": '2.1.2',
  "lodash": '4.17.4'
});


Package.onUse(function(api) {
  api.versionsFrom('1.4.3.2');
  api.use('ecmascript@0.6.3');
  api.use('coffeescript@1.12.3_1');
  api.use('webapp@1.3.14');
  api.use('mongo@1.1.16');
  api.use('cfs:graphicsmagick@0.0.18');
  api.use('meteorhacks:async@1.0.0');
  api.use('random@1.0.10');
  api.use('zimme:collection-behaviours@1.1.3');
  api.addFiles('src/client.coffee', 'client');
  api.addFiles('src/server.coffee', 'server');
});
