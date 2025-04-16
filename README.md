# Docker Helm Client Agent

![Scrutinizer build (GitHub/Bitbucket)](https://img.shields.io/scrutinizer/build/g/open-source-srilanka/helm-client/main)
![Docker Pulls](https://img.shields.io/docker/pulls/projectoss/helm-client)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/projectoss/helm-client)
![Made With By (ProjectOSS)](https://img.shields.io/badge/made%20with%20love%20by-ProjectOSS-orange)

## Overview

The Docker Helm Client Agent is a specialized Docker image that acts as a Helm client, enabling seamless management of Kubernetes deployments. It provides a convenient and portable solution for interacting with Helm charts and deploying applications to chart repositories without the need to install Helm on your local machine or CI/CD pipelines.

## Key Features

- **Helm Commands Made Easy**: Execute Helm commands directly from within the Docker container, without the need to install Helm on your local machine or CI/CD pipelines.

- **Consistency Across Environments**: Ensure consistent Helm versions and configurations across various environments, reducing potential issues related to Helm installations.

- **Optimized for CI/CD Pipelines**: Integrate this Docker image effortlessly into your CI/CD pipelines to automate deployments.

- **Customizable**: Easily extend the image to include your specific Helm charts or other tools required for your workflows.

## Usage 

```
projectoss/helm-client:latest
```
Currently `latest` tag refers to Helm version `v3.17.3`

Sample Jenkins Pipeline Stage

```groovy
stage('Package Helm Chart') {
    agent {
        docker {
            image 'projectoss/helm-client:latest'
        }
    }
    steps {
        sh 'helm version'
        // your helm commands here
    }
}

```
For more detailed usage instructions, please refer to the [Jenkinsfile](https://github.com/dinushchathurya/helm-client-chart/blob/master/Jenkinsfile) in this repository.

Sample GitHub Action Workflow

```yaml
- name: Check Helm version
  uses: docker://projectoss/helm-client:latest
  with:
    run: | 
        helm version
        # other helm commands here
```
For more detailed usage instructions, please refer to this [action.yaml](https://github.com/dinushchathurya/helm-client-chart/blob/master/.github/workflows/action.yaml) in this repository.

## Contributing

We welcome contributions from the community to enhance and improve this project! If you'd like to contribute, please follow these steps:

1. **Fork the Repository**: Click the "Fork" button at the top right corner of this repository. This will create a copy of the project in your GitHub account.

2. **Clone the Fork**: On your local machine, use `git` to clone the forked repository:

3. **Make Changes**: Now, you can make your desired changes and improvements to the codebase.

4. **Commit Changes**: Once you've made your changes, commit them with a descriptive commit message:

5. **Push Changes**: Push your changes to your forked repository:

6. **Create Pull Request**: Go to the original repository (the one you forked) on GitHub. You should see a "Compare & pull request" button. Click on it, and you can create a pull request to submit your changes for review.

7. **Wait for Review**: Your pull request will be reviewed by the project maintainers. Be open to feedback and iterate on your changes if necessary.

8. **Celebrate**: Once your pull request is approved and merged, your contributions will be part of the project. Congratulations on your successful contribution!

Please ensure your code adheres to our coding guidelines and standards, and provide proper tests for any new features you introduce. Thank you for contributing to this project and helping us make it even better!

## License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2024 ProjectOSS

