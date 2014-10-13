exports.config =
  # See https://github.com/brunch/brunch/blob/stable/docs/config.md for docs.

  # modules:
  #   wrapper: false
  #   definition: false

  paths:
    watched: ['src', 'test/units', 'vendor', 'dev']
    public: 'lib'

  files:
    stylesheets:
      joinTo:
        'frontend.css': /^src\/(?!backend)/
        'backend.css': /^src\/(?!frontend)/
        'vendor.css': /^(?!src|test|dev)/
        'dev.css': /^dev/

    templates:
      joinTo:
        'frontend.js': /^src\/(?!backend)/
        'backend.js': /^src\/(?!frontend)/
        'full.js': /^src/

    javascripts:
      joinTo:
        'frontend.js': /^src\/(?!backend)/
        'backend.js': /^src\/(?!frontend)/
        'vendor.js': /^(?!src|test|dev)/
        'full.js': /^src/
        'dev.js': /^dev/
        'tests.js': /^test\/units/
      order:
        before: ['src/main.js']

  plugins:
    coffeescript:
      sourceMaps: no
    react:
      autoIncludeCommentBlock: yes
      harmony: yes
