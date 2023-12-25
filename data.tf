data "aws_ssm_parameter" "docdb_user" {
  name = "dev.docdb_user"

}
data "aws_ssm_parameter" "docdb_pass" {
  name = "dev.docdb_pass"
}
data "aws_subnets" "vpc_subnets" {

  filter {
    name   = "tag:Name"
    values = ["db_private_subnet_1","db_private_subnet_2"]
  }

  # Add more filters or adjust as needed
}
