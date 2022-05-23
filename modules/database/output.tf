output "address" {
  description = "RDS database address"
  value       = aws_db_instance.demo-mysql-db.address
}

output "instance_connection_info" {
  description = "Object containing connection info"
  value = {
    address  = aws_db_instance.demo-mysql-db.address
    endpoint = aws_db_instance.demo-mysql-db.endpoint
    id       = aws_db_instance.demo-mysql-db.id
    port     = aws_db_instance.demo-mysql-db.port
    username = aws_db_instance.demo-mysql-db.username
  }
}

output "instance_id" {
  description = "Instance ID of RDS DB"
  value       = aws_db_instance.demo-mysql-db.id
}


output "username" {
  description = "Master username"
  value       = aws_db_instance.demo-mysql-db.username
}