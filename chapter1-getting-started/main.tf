terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_sqs_queue" "terraform_queue1" {
  name = "terraform-chapter1-queue1"
  tags = {
    Environment = "development"
  }
}


resource "aws_sqs_queue" "terraform_queue2" {
  name = "terraform-chapter1-queue2"
}

resource "aws_sns_topic" "terraform_topic1" {
  name = "terraform-chapter1-topic1"
}
