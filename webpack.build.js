const webpack = require('webpack');
const merge = require('webpack-merge');
const baseConf = require('./webpack.common.js');

const UglifyJSPlugin = require('uglifyjs-webpack-plugin');

module.exports = merge(baseConf, {
  plugins: [
    new UglifyJSPlugin(),
    new webpack.DefinePlugin({
      'process.env': {
        'NODE_ENV': JSON.stringify('production')
      }
    })
  ],
});
