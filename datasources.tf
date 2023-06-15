provider "aws" {
  region = "ap-southeast-2"
  profile = "test_aws_trn"
  
}

data "aws_subnet" "Sharedapp2c"  {
  filter {
    name = "tag:Name"
    values = ["Controlled SharedApps 2c"]
  }
}

data "aws_subnet" "Shareddata2c"  {
  filter {
    name = "tag:Name"
    values = ["Controlled SharedData 2c"]
  }
}

data "aws_subnet" "PeriDMZ2a"  {
  filter {
    name = "tag:Name"
    values = ["Perimeter Web DMZ 2a"]
  }
}

data "aws_kms_key" "CMKey" {
  key_id = "XXXXXX-XXXX-XXXX-XXXX-XXXXXXXX" 
  
}

data "aws_vpc" "TestVPC" {
   filter {
    name   = "tag:Name"
    values = ["12345678-VPC"]
  }
}

data "aws_security_group" "dmzsg" {
  filter {
    name = "tag:Name"
    values = ["sgrp-XXXX-XXXXX-XXXXXX"]
  }
}

data "aws_subnet" "dmzsna" {
  filter {
    name = "tag:Name"
    values = ["Perimeter Web DMZ 2a"]
  }
}
data "aws_subnet" "dmzsnb" {
  filter {
    name = "tag:Name"
    values = ["Perimeter Web DMZ 2b"]
  }
}
data "aws_subnet" "dmzsnc" {
  filter {
    name = "tag:Name"
    values = ["Perimeter Web DMZ 2c"]
  }
}