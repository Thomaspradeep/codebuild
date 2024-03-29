resource "aws_iam_role" "tranunion_lambda_role" {
    name = "transunion_lambda_role"
    managed_policy_arns = [
        aws_iam_policy.transunion_lambda_sns_iam_policy.arn
    ]
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "transunion_lambda_sns_iam_policy" {
    name = "transunion_lambda_sns_iam_policy"
    path = "/"
    policy = <<EOF
{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "Iam",
                "Effect": "Allow",
                "Action": [
                    "iam:DeleteAccessKey",
				    "iam:UpdateAccessKey",
				    "iam:CreateAccessKey",
				    "iam:ListAccessKeys"
                ],
                "Resource": "*"
            },

            {
                "Sid": "SNS",
                "Effect": "Allow",
                "Action": "sns:*",
                "Resource": "*"
            }

        ]
}
EOF
}