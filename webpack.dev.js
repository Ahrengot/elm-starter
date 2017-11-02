const merge = require('webpack-merge');
const baseConf = require('./webpack.common.js');

const conf = merge.strategy({
  'module.loaders': 'replace'
})(baseConf, {
  devtool: "source-map",

  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: [/node_modules/],
        use: ['babel-loader']
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: [
          'elm-hot-loader',
          {
            loader: 'elm-webpack-loader',
            options: {
              debug: true,
              warn: true
            }
          },
        ]
      },
      {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader',
          'postcss-loader',
        ]
      }
    ]
  },

  devServer: {
    stats: 'errors-only'
  }
});

console.log("Combined conf: ", conf)

module.exports = conf;
