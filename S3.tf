resource "aws_s3_bucket" "log_bucket" {
    bucket = "log-${var.bucket_name}"
   versioning{
    enabled = true
   }
    tags = {
        Env = "Dev"
    }
}

resource "aws_s3_bucket" "CDS_Infra_bucket" {
    bucket = var.bucket_name
    logging{
        target_bucket = aws_s3_bucket.log_bucket.id
        target_prefix = "Log/land_bucket"
    }

   versioning{
    enabled = true
   }
    tags = {
        Env = "Dev"
    }
}

resource "aws_s3_bucket_object" "log_bucket"{
    bucket = aws_s3_bucket.log_bucket.id
    key = "Log/land_bucket"
}

resource "aws_s3_bucket" "glue_bucket_matthew"{
    bucket = "bucket101matthew1"
    
    versioning{
    enabled = true
    }
}

module "glue_bucket_matthew"{
    for_each = var.clients_list
    source = "./modules/client_bucket_directories"
    
    bucket_id = aws_s3_bucket.glue_bucket_matthew.id
    client_name = each.key
}