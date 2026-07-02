aws_region = "us-east-2"
app_name   = "rdicidr-stage"

# Override with the real ECR image URI before applying, e.g.:
# container_image = "<account_id>.dkr.ecr.us-east-2.amazonaws.com/rdicidr-stage:latest"
container_image = "123456789012.dkr.ecr.us-east-2.amazonaws.com/rdicidr-stage:latest"

health_check_path = "/health"
desired_count     = 2
