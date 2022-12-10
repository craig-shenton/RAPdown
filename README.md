# qdown

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/craig-shenton/qdown/">
    <img src="_assets/img/quarto.png" alt="Logo" height="120">
  </a>

  <h3 align="center">R Reporting</h3>

  <p align="center">
    NHS England R Community
    <br />
    <a href="/"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/craig-shenton/qdown/issues">Report Bug</a>
    ·
    <a href="https://github.com/craig-shenton/qdown/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#package-stucture">Package Structure</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

Quarto Markdown project

_**Note:** No private data are stored in this repository._

### Package Structure
```
qdown
│   README.md
│
├───my_project
│   │   create_publication.py
│   │   params.py
│   │
│   └───utilities
│       │   data_connections.py
│       │   field_definitions.py
│       │   processing_steps.py
|
├───reports
│   │
│   ├───input_profile
│   └───output_profile
│
└───tests
    ├───unittests
    │       │   test_data_connections.py
    │       │   test_field_definitions.py
    │       │   test_processing_steps.py
    │
    └───backtests
            test_compare_outputs.py
```
Some things to notice about this structure:

* In the repository there are two files: `create_publication.py` and `params.py`. These top level files are the highest level of abstraction and should be the main place where users interact with the code. 

    * The `params.py` file contains all of the parameters that we expect to change frequently, e.g. input data. 
    * The `create_publication.py` file organises the steps in a simple, easy-to-understand manner that should be readable by anyone, even if they don't know python. In this way, we aim to reduce risk by make the code accessible to new staff. 

* The next level down contains the meaty parts of the code. By organising the code into logical sections, we make it easier to understand but also to maintain and test. Moreover, tucking the complex code out of the way means that users don't need to understand everything about the code all at once. 
    * The `data_connections.py` file handles reading data in and writing data back out. 
    * The `field_definitions.py` file contains the definitions for each of the fields (columns) derived in the process. By abstracting these definitions out of the code and making them reuseable, we achieve some great benefits. First, it becomes much easier to maintain. When the specifications change next year, we only need to make the change in one location. Next, it becomes much easier to test. We write unit tests for each of these definitions and can then reuse these definitions in many places without increasing risk. 
    * The `processing_steps.py` file contains the core business logic. 

Note that we never store passwords or any sensitive credentials in the repo to prevent the situation where it can mistakenly committed into the git. There are several ways to deal with the secret, keys and passwords such as using Git Hooks or final cleansing process before publishing. 

### Built With

- [Quarto](https://quarto.org/)
- [R](https://www.r-project.org/)
- [GitHub Actions](https://github.com/features/actions)

<!-- GETTING STARTED -->

## Getting Started

Please refer to the [Quarto Tutorial](https://openscapes.github.io/quarto-website-tutorial/) site

<!-- ROADMAP -->

## Roadmap

See the [open issues](https://github.com/craig-shenton/qdown/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING-->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

_See [CONTRIBUTING.md](https://github.com/craig-shenton/qdown/blob/main/CONTRIBUTING.md) for detailed guidance._

<!-- LICENSE -->

## License

Distributed under the MIT License. _See [LICENSE.md](https://github.com/craig-shenton/qdown/blob/main/LICENSE) for more information._

<!-- CONTACT -->

## About

Project contact email: [craig.shenton@nhs.net](mailto:craig.shenton@nhs.net)

## Acknowledgements

* []()
* []()
* []()
