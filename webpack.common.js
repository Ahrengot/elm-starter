var path = require("path");
var webpack = require("webpack");
var HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  context: path.resolve(__dirname, './src'),

  entry: [
    './app.js',
  ],

  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].js'
  },

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
          'elm-webpack-loader'
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
    ],
    noParse: /\.elm$/
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: './index.html',
      hash: true,
    })
  ]

};
