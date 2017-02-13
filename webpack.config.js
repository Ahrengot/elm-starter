var path = require("path");

var webpack = require("webpack");
var HtmlWebpackPlugin = require('html-webpack-plugin');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  devtool: "source-map",
  entry: {
    'app': './src/app.js'
  },
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].js'
  },
  module: {
    loaders: [
      {
        test: /\.elm$/,
        exclude: [/node_modules/, /elm-stuff/],
        use: {
          loader: 'elm-webpack-loader',
          query: {
            // cwd: path.resolve(__dirname, 'src')
          }
        }
      },
      {
        test: /\.css$/,
        use: ExtractTextPlugin.extract({
          use: [
            'css-loader',
            'postcss-loader',
          ]
        })
      }
    ],
    noParse: /\.elm$/
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/index.html',
      title: 'Elm App',
      hash: true,
    }),
    new ExtractTextPlugin( 'main.css' )
  ],
  devServer: {
    inline: true,
    stats: 'errors-only'
  }
};
