# CHAPTER 1 - Introduction to Basic commands 

## create working directory named chapter1
mkdir chapter1
cd chapter1

## Initializing provider plugins - eg. aws

touch main.tf

#### in main.tf
terraform {  
  required_providers {  
    aws = {  
      source  = "hashicorp/aws"  
      version = "~> 3.27"  
    }  
  }  

  required_version = ">= 0.14.9"  
}  

provider "aws"{  
    region = "us-east-1"  
}  

## Add first resource: a queue named "terraform-chapter1-queue1"
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue  
#### in main.tf
resource "aws_sqs_queue" "terraform_queue1" {  
  name = "terraform-chapter1-queue1"  
}  

terraform plan  
terraform apply  

## Update resource: queue name "terraform-chapter1-queue1"

#### in main.tf for resource "terraform-chapter1-queue1"

resource "aws_sqs_queue" "terraform_queue1" {  
  name = "terraform-chapter1-queue1"  
  tags = {  
    Environment = "development"  
  }  
}  

terraform plan  
terraform apply  


## Add additional resource: a queue named "terraform-chapter1-queue2"

#### in main.tf
resource "aws_sqs_queue" "terraform_queue2" {  
  name = "terraform-chapter1-queue2"  
}  

terraform plan  
terraform apply  

## Add additional resource: a topic named "terraform-chapter1-topic1"
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic  
#### in main.tf
resource "aws_sns_topic" "terraform_topic1" {  
  name = "terraform-chapter1-topic1"  
}  

terraform plan  
terraform apply  

## Get state of the resources

terraform state show aws_sqs_queue.terraform_queue1  
terraform state show aws_sqs_queue.terraform_queue2  
terraform state show aws_sns_topic.terraform_topic1  


## Remove a resource

Remove the block of code for the resource from main.tf  
To remove "terraform-chapter1-queue1", remove the code given below from main.tf  

resource "aws_sqs_queue" "terraform_queue1" {  
  name = "terraform-chapter1-queue1"  
  ....  
}  


## Remove all resources 
terraform destroy  
