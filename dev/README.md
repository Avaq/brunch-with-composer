# Dev

This directory contains some symlinks to devDependencies because Brunch has no method to
add them to the compiler.

Note: `sinon.js` is not a symlink. This is because this is a modified version of
`sinon.js` that allows for flawless loading with CommonJS.

This directory is also used for code-examples because that way they are compiled to
`dev.js`. The assets defined here will be copied to `lib` like any other. They can then be
hosted using, for example, `../brunch watch --sever`.
