resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization" {
  alarm_name          = "High CPU Utilization"
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  statistic          = "Average"
  period             = 300
  evaluation_periods  = 1
  threshold          = 80
  comparison_operator = "GreaterThanThreshold"
  dimensions = {
    InstanceId = "<INSTANCE_ID>"
  }
  alarm_description   = "This alarm will trigger if CPU utilization exceeds 80%"
  alarm_actions       = ["<SNS_TOPIC_ARN>"]
}

resource "aws_cloudwatch_metric_alarm" "high_request_count" {
  alarm_name          = "High Request Count"
  metric_name        = "RequestCount"
  namespace          = "AWS/ELB"
  statistic          = "Sum"
  period             = 300
  evaluation_periods  = 1
  threshold          = 1000
  comparison_operator = "GreaterThanThreshold"
  dimensions = {
    LoadBalancerName = "<LOAD_BALANCER_NAME>"
  }
  alarm_description   = "This alarm will trigger if request count exceeds 1000 in 5 minutes."
  alarm_actions       = ["<SNS_TOPIC_ARN>"]
}

resource "aws_cloudwatch_metric_alarm" "instance_activity" {
  alarm_name          = "Instance Activity"
  metric_name        = "StatusCheckFailed"
  namespace          = "AWS/EC2"
  statistic          = "Average"
  period             = 300
  evaluation_periods  = 1
  threshold          = 1
  comparison_operator = "GreaterThanThreshold"
  dimensions = {
    InstanceId = "<INSTANCE_ID>"
  }
  alarm_description   = "This alarm will trigger if an instance fails status checks."
  alarm_actions       = ["<SNS_TOPIC_ARN>"]
}
