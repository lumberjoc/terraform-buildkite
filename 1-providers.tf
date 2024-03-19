terraform {
  required_providers {
    buildkite = {
      source  = "buildkite/buildkite"
      version = "~> 1.0"
    }

     aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }    
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ssm_parameter" "buildkite_api_token" {
  name = "/buildkite/api/token"
}

# Configure the Buildkite Provider
provider "buildkite" {
  organization = "fruition"
  api_token = data.aws_ssm_parameter.buildkite_api_token.value
}

