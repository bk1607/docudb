data "aws_ssm_parameter" "docdb_user" {
  name = "dev.docdb_user"

}
data "aws_ssm_parameter" "docdb_pass" {
  name = "dev.docdb_pass"
}

