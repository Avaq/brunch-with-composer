# Brunch with Composer

## Introduction

This is a [Brunch] skeleton designed to compile [CoffeeScript] and [ReactJS] source to
output all your JavaScripts for a **classic server-rendered application**. Code is tested
using [Mocha, Chai, Sinon], [Testem] and [Pioneer].

In this skeleton, Brunch is configured to output three scripts:

* `vendor.js`: Contains all libraries. They are separated from the other scripts with the
  presumpsion that vendor libraries won't change as often as application code, and will
  therefore have a longer cache-life.
* `frontend.js`: Contains all application code from `src/global` and `src/frontend`.
* `backend.js`: Contains all application code from `src/global` and `src/backend`.

The idea behind separating frontend and backend like this is based on the classic
separation of visitor/admin. You feed `frontend.js` to any visitor and `backend.js` in the
"admin section" of your site.

[Brunch]: http://brunch.io/
[CoffeeScript]: http://coffeescript.org
[ReactJS]: https://facebook.github.io/react/
[Mocha, Chai, Sinon]: https://nicolas.perriault.net/code/2013/testing-frontend-javascript-code-using-mocha-chai-and-sinon/
[Testem]: https://github.com/airportyh/testem
[Pioneer]: http://pioneerjs.com/

## Developing

### Prerequisites

#### Node >= 0.10.30

* Using [Node Version Manager] - recommended
* Using the [install guide](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager)
* Using one of [these gists](https://gist.github.com/isaacs/579814)

[Node Version Manager]: https://github.com/creationix/nvm

### Coding

* Write source code in `src/<domain>`. Domain can be one of frontend, backend or global.
  Each domain is compiled into separate output files.
* All source code is written in [CoffeeScript].
* Use the `.coffee` file extension.
* Use the `.cjsx` file extension for views. You can embed [ReactJS' JSX syntax] within these files.
* Look at `dev/examples` for examples.
* Assets are copied from within any folder under `src` or `dev` named `assets`.
* Styles may be written in [Stylus] and use the `.styl` extension.

[ReactJS' JSX syntax]: https://facebook.github.io/react/docs/jsx-in-depth.html
[Stylus]: https://learnboost.github.io/stylus/

### Building

* Issue `./cake clean` to remove up old build.
* Issue `./cake build` to build code.
* Include a `--watch` parameter to build continuously.

### Tests

#### Unit testing

* Create unit tests in `test/units/<directory_structure>`. The Directory structure should
  generally be the same as the one preceding the module being tested.
* Unit tests are created using [Mocha, Chai and Sinon].
* Run unit tests by issuing `testem` in the root directory.

[Mocha, Chai and Sinon]: https://nicolas.perriault.net/code/2013/testing-frontend-javascript-code-using-mocha-chai-and-sinon/

#### Integration testing

* Make sure you have ChromeDriver installed. If you trust me you can install it by
  issuing `./script/install-chromedriver-linux64`.
* Create integration tests in `test/integration/`.
* Integration tests are created using [Pioneer].
* Scenarios are described in `test/integration/features/<my_feature>`. See [getting started].
* Step definitions are placed in `test/integration/<my_feature>`. See [getting started].
* [Widgets] can be defined in `test/integration/<my_widget>`.

[Pioneer]: http://pioneerjs.com/
[getting started]: https://github.com/mojotech/pioneer/blob/master/docs/getting_started.md
[Widgets]: https://github.com/mojotech/pioneer/blob/master/docs/widget.md

### Deploying and Integration

* Quit `testem` before running any of the following commands.
* Issue `cake test` to make a quick build and run unit tests and integration tests.
* Issue `cake deploy` to make a clean, optimized production build and run all tests.

Integrating it in your project is as simple as copying the `lib` folder and including the
scripts in the right places.

If you are using PHP you can use Composer with the [Component Installer] to depend on this
repo. For this reason the `lib` folder is not placed in `.gitignore`.

[Component Installer]: https://github.com/robloach/component-installer
