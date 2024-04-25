# Tvarkau Lietuvą Frontend

[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/AplinkosMinisterija/tvarkau-lietuva-frontend/badge)](https://securityscorecards.dev/viewer/?platform=github.com&org={AplinkosMinisterija}&repo={tvarkau-lietuva-frontend})
[![License](https://img.shields.io/github/license/AplinkosMinisterija/tvarkau-lietuva-frontend)](https://github.com/AplinkosMinisterija/tvarkau-lietuva-frontend/blob/main/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/AplinkosMinisterija/tvarkau-lietuva-frontend)](https://github.com/AplinkosMinisterija/tvarkau-lietuva-frontend/issues)
[![GitHub stars](https://img.shields.io/github/stars/AplinkosMinisterija/tvarkau-lietuva-frontend)](https://github.com/AplinkosMinisterija/tvarkau-lietuva-frontend/stargazers)

This repository contains the source code and documentation for the Tvarkau Lietuvą Frontend,
developed by the Aplinkos
Ministerija.

## Table of Contents

- [About the Project](#about-the-project)
- [Getting Started](#getting-started)
    - [Installation](#installation)
    - [Usage](#usage)
    - [API Client Generation](#api-client-generation)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

## About the Project

The Tvarkau Lietuvą Frontend is a system designed to publicly disclose all the known and potentially
illegal waste generation sites to the Department of Environmental Protection. The system allows the
public to report previously unrecorded sites and track the status of their investigation.

Key features of the Frontend include:

- Provides ability to create trash reports.
- Retrieves reported trash locations, investigation status.
- Gets information about dumps.

## Getting Started

To get started with the Tvarkau Lietuvą Frontend, follow the instructions below.

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/AplinkosMinisterija/tvarkau-lietuva-frontend.git
   ```

2. Install Flutter https://docs.flutter.dev/get-started/install and
   Melos https://melos.invertase.dev/

3. Install the required dependencies:

   ```bash
   cd tvarkau-lietuva-frontend
   melos bootstrap 
   ```

### Usage

In order to launch the application you need to provide Google Maps API key. [Generate one with these instructions](https://developers.google.com/maps/documentation/javascript/get-api-key)

Insert the key in the web/index.html file:
 ```bash
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
 ```

Start the application:

   ```bash
   flutter run --flavor dev
   ```

### API Client Generation

Generate the API client from the OpenAPI contract in [openapi.yaml](openapi.yaml)
using [openapi_generator](https://pub.dev/packages/openapi_generator).
Run the command below:

```shell
dart run build_runner build --delete-conflicting-outputs
```

## Deployment

### Preview

Each commit creates a new preview environment automatically on pull request to the `main` branch.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open
an issue or submit a
pull request. For more information, see
the [contribution guidelines](https://github.com/AplinkosMinisterija/.github/blob/main/CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](./LICENSE).
