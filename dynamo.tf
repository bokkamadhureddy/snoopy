resource "aws_dynamodb_table" "terraform_state_locking_dynamodb" {
  name = "terraform-state-locking-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

    attribute {
    name = "LockID"
    type = "S"
  }
 
  tags = {
        "Name" = "DynamoDB Terraform State Lock Table"
    }
}
 

