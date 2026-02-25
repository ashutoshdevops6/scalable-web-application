# Architecture Diagram & Project Structure

## VPC Setup
- A Virtual Private Cloud (VPC) is created to isolate the resources securely within a defined network.
- CIDR Block: 10.0.0.0/16

### Subnets
- Public Subnet: 10.0.1.0/24
- Private Subnet: 10.0.2.0/24

## EC2 Instances
- Two types of EC2 instances are used:
  - Application servers (t2.medium) running the web application.
  - A bastion host in the public subnet for administrative access.

## Load Balancers
- An Application Load Balancer (ALB) is used to distribute traffic across the EC2 instances in the private subnet.
- It performs health checks and ensures that traffic is routed to healthy instances.

## Auto Scaling
- An Auto Scaling group is created to maintain the desired number of EC2 instances.
- Scaling policies are defined based on CPU utilization and request count to automatically scale the number of instances up or down based on demand.

## RDS Database Configuration
- An Amazon RDS instance is set up for the application database.
- DB Instance Class: db.t3.medium
- Multi-AZ deployment for high availability.
- Automated backups and snapshots are enabled for data protection.

## Project Structure
```
scalable-web-application/
├── src/
│   ├── app/
│   │   ├── models/
│   │   ├── controllers/
│   │   ├── routes/
│   │   └── views/
│   ├── config/
│   ├── scripts/
│   └── tests/
├── docs/
│   └── ARCHITECTURE.md
├── README.md
├── package.json
└── server.js
```

The project is structured to separate concerns, making it easier to manage and scale as needed.