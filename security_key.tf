resource "aws_key_pair" "ycochet_public_key" {
    key_name = "key_public_ec2"
    public_key = file("~/.ssh/id_rsa.pub")

}
