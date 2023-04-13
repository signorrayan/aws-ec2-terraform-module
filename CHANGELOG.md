## [1.3.5](https://github.com/signorrayan/aws-ec2-terraform-module/compare/v1.3.4...v1.3.5) (2023-04-13)


### Bug Fixes

* **module:** Fix the vpc_security_group_ids issue to assign it correctly. ([a6c62f1](https://github.com/signorrayan/aws-ec2-terraform-module/commit/a6c62f18373692e352f37f31cb1667a63fd21f6a))
* **module:** Fix the vpc_security_group_ids issue to assign it correctly. ([2808f1d](https://github.com/signorrayan/aws-ec2-terraform-module/commit/2808f1de3ead261a46a45ee85de9fa129fe12863))

## [1.3.5](https://github.com/signorrayan/aws-ec2-terraform-module/compare/v1.3.4...v1.3.5) (2023-04-13)


### Bug Fixes

* **module:** Fix the vpc_security_group_ids issue to assign it correctly. ([2808f1d](https://github.com/signorrayan/aws-ec2-terraform-module/commit/2808f1de3ead261a46a45ee85de9fa129fe12863))

## [1.3.4](https://github.com/signorrayan/aws-ec2-terraform-module/compare/v1.3.3...v1.3.4) (2023-04-13)


### Bug Fixes

* **module:** Remove the providers.tf to be usable as a module. ([da85356](https://github.com/signorrayan/aws-ec2-terraform-module/commit/da8535673c21452e2388448ef0599a6fc99de3cc))

## [1.3.3](https://github.com/signorrayan/aws-ec2-terraform-module/compare/v1.3.2...v1.3.3) (2023-04-12)


### Bug Fixes

* **module:** Fix the instance naming issues, and change the instance_id to id ([85eb991](https://github.com/signorrayan/aws-ec2-terraform-module/commit/85eb9918a00e22c021c184e61957df84babee99e))

## [1.3.2](https://github.com/signorrayan/aws-ec2-terraform-module/compare/v1.3.1...v1.3.2) (2023-03-31)


### Bug Fixes

* **module:** Fix attaching the security group ids to the ec2 instance. ([d9a720c](https://github.com/signorrayan/aws-ec2-terraform-module/commit/d9a720c75cc6cf582afee76b8b54f7b83ae10166))

## [1.3.1](https://github.com/signorrayan/aws-ec2-terraform-module/compare/v1.3.0...v1.3.1) (2023-03-27)


### Bug Fixes

* **module:** Error-Missing resource instance key for sg ([bc77b78](https://github.com/signorrayan/aws-ec2-terraform-module/commit/bc77b787d2be50550f8252a761dcfb028378fc50))

# [1.3.0](https://github.com/signorrayan/aws-ec2-terraform-module/compare/v1.2.1...v1.3.0) (2023-03-27)


### Features

* **module:** add outputs.tf to show the final information ([e409ecb](https://github.com/signorrayan/aws-ec2-terraform-module/commit/e409ecb7840643382540116f55fbdce9b2a1aebe))

## [1.2.1](https://github.com/signorrayan/aws-ec2-terraform-module/compare/v1.2.0...v1.2.1) (2023-03-27)


### Bug Fixes

* **module:** add data.tf for aws_ami, aws_partition, aws_iam_policy_document ([55f9a76](https://github.com/signorrayan/aws-ec2-terraform-module/commit/55f9a76c1177482afb74a1fde3d828da7b99a780))

# [1.2.0](https://github.com/signorrayan/aws-ec2-terraform-module/compare/v1.1.0...v1.2.0) (2023-03-27)


### Features

* **module:** add security groups to allow outgoing traffic and ssh ([2a51a91](https://github.com/signorrayan/aws-ec2-terraform-module/commit/2a51a917d9fd05ab1777dc121b1ee772e7eece47))

# [1.1.0](https://github.com/signorrayan/aws-ec2-terraform-module/compare/v1.0.0...v1.1.0) (2023-03-27)


### Features

* **module:** add 'aws_iam_role' and 'aws_iam_instance_profile' resources ([5f89f9a](https://github.com/signorrayan/aws-ec2-terraform-module/commit/5f89f9a7ae561934d2b1b6c6bddc80e0fd46309f))

# 1.0.0 (2023-03-27)


### Performance Improvements

* **module:** add the main structure of module ([07d9867](https://github.com/signorrayan/aws-ec2-terraform-module/commit/07d9867d5f947c636e48af6e2904244b1d32c5a3))


### BREAKING CHANGES

* **module:** The aws_instance resource has been added to create an EC2 instance
