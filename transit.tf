# Create TGW
resource "aws_ec2_transit_gateway" "Transit-GW-1" {
  description = "Transit Gateway"

  tags = {
    Name = "Transit-GW-1"
}
}

# TGW attachment for "prod"
resource "aws_ec2_transit_gateway_vpc_attachment" "Prod-tgw-attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.Transit-GW-1.id
  vpc_id             = aws_vpc.prodvpc.id
  subnet_ids      = toset([aws_subnet.private_subnets[0].id])

   tags = {
    Name = "Prod-tgw-attachment"
}
}

# TGW attachment for "bastion"
resource "aws_ec2_transit_gateway_vpc_attachment" "Bastion-tgw-attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.Transit-GW-1.id
  vpc_id             = aws_vpc.Bastion.id
  subnet_ids = toset([aws_subnet.bastion-public.id])

  tags = {
    Name = "Bastion-tgw-attachment"
}
}

