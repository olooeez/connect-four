[![test](https://github.com/olooeez/connect-four/actions/workflows/test.yml/badge.svg)](https://github.com/olooeez/connect-four/actions/workflows/test.yml)

# connect-four

Connect Four is a two-player connection board game, in which the players choose a color and then take turns dropping colored tokens into a seven-column, six-row vertically suspended grid. The pieces fall straight down, occupying the lowest available space within the column. The objective of the game is to be the first to form a horizontal, vertical, or diagonal line of four of one's own tokens.

## Demo

![Demo of connect-four](https://raw.githubusercontent.com/olooeez/connect-four/main/img/demo.png)

## Usage

Below is how you can use connect-four. Feel free to fork or copy them, but be aware of the limitations that this repository license implies.

You can use the following options to use connect-four:

1. [Run in your machine](#run-in-your-machine)
2. [Run in a Docker container](#run-in-a-docker-container)
3. [Run in your browser](#run-in-your-browser)

### Run in your machine

#### Clone the repo

To run connect-four, you must clone this repository with the following command:

```
git clone https://github.com/olooeez/connect-four.git
```

#### Enter the cloned repository

After cloning, you must enter the local repository using the following command:

```
cd connect-four
```

#### Install the dependencies

Install [Ruby](https://www.ruby-lang.org) and [Bundler](https://bundler.io/) on your system and run it with the command bellow:

```
bundler install
```

#### Run the project

Finally use the command below to run the project:

```
ruby lib/connect_four.rb
```

### Run in a Docker container

#### Clone the repo

To run the program in a docker container, clone the repository to your machine first:

```
git clone https://github.com/olooeez/connect-four.git
```

#### Enter the cloned repository

After cloning, you must enter the local repository using the following command:

```
cd connect-four
```

#### Build the docker image

Then, use the command below to build the Docker image:

```
docker build -t olooeez/connect-four:latest .
```

#### Run the image in a container

Then, to run the image in a container, use the following command:

```
docker run -it --rm olooeez/connect-four:latest
```

### Run in your browser

To run the application in your browser, checkout the [Replit](https://replit.com/@olooeez/connect-four) version.


## Contributing

If you would like to contribute to this project, please feel free to open a pull request. All contributions are welcome!

## License

This project is licensed under the [MIT](https://github.com/olooeez/connect-four/blob/main/LICENSE) License. See the LICENSE file for details.
