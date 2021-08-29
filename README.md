# About this POC

The goal of this project is exercise the ability to submit data to a Chainpoint Blockchain network using Ruby on Rails. 

## Running Locally

### Clone the repository

```shell
git clone git@github.com:diego-oliveira/chainpoint-poc.git
cd chainpoint-poc
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.1p64`

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle install
```

```shell
cd nextjs && yarn
```

### Set environment variables

Copy the `.env.example` file to a new file called `.env`. Change the vars as you will.


### Start the server

```shell
rails s
```

```shell
cd nextjs && yarn dev
```

Done! Now you have the backend running on port 3000 and the front end on 3001.

