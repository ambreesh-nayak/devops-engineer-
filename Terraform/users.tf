# create users

resource "aws_iam_user" "u1" {
    name = "babubhaiya"
}

resource "aws_iam_user" "u2" {
   name = "shyam"
}

resource "aws_iam_user" "u3" {
    name = "raju"
}
# create group

resource "aws_iam_group" "g1" {
    name = "hera-pheri"
}

# add users into group
resource "aws_iam_group_membership" "gm" {
    name = "team"

    users = [
        aws_iam_user.u1.name,
        aws_iam_user.u2.name,
        aws_iam_user.u3.name
    ]

    group = aws_iam_group.g1.name
}
