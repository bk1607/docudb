# creating docdb cluster
resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = var.cluster_name
  engine                  = var.engine
  engine_version          = var.engine_version
  master_username         = data.aws_ssm_parameter.docdb_user.value
  master_password         = data.aws_ssm_parameter.docdb_pass.value
  backup_retention_period = var.backup
  skip_final_snapshot     = var.skip_final_snapshot
  db_subnet_group_name = aws_docdb_subnet_group.main.name
}


#local variables
locals {
  db_subnet_ids =  data.aws_subnets.vpc_subnets.ids
}

## creating subnet group
resource "aws_docdb_subnet_group" "main" {
  name       = "docdb_subnet_group"

  subnet_ids = local.db_subnet_ids

  tags = {
    Name = "My docdb subnet group"
  }
}

#cluster instance creation
resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "docdb-cluster-demo"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = "db.t3.medium"
}
