resource "aws_key_pair" "shyun2_key" {
    key_name = "shyun2-key"
  #  public_key = ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLfTY1GBKqweZivQ4KWxPKDb7vfGrbSOXoFAfV7Hr41yNMtshYRjuDoQ4JqVQNE15z71Djq/foSfs3G818Ui+Lwlo/iYyZeCm89RhimpcZ+5zLCsDYgazNyFDMP1gUqPaU3pXlhfjhoZEaG1G86gCYf2OlLnc1JSxRR3jylmHymlq5XjSeBvCGoeuQiI6Sd0Zluj8Zx7nHo2rlUlb5G0mY5goRhQSFiMfAd69yJi+mNYvEqIL2Zxhudm/VDZ0V/gMeoScqnn4O9skjLnMVN8IZWbUFa0PjQVcOJs7w1xRJaRw6iuP/w36xWDzQ9+zwkcKreafloyTpB19G0Ot95yr9D66uUFpmHfjI9X+lEg8CXOie3iJvhPUnvztO+LpKtMKfrQMasHAhujFxMGulYeImEu6/WoR4Jxa/q9XO7NoWIxlhJrJPqrMjIZ6PA7oWa0LUa+Rus5/8+cf7AOPROu0vmZY+Evb2B51Bg/lo/f0XK+2dIqLcxzKY4XF81Jy9qG0=
    public_key = file("../../.ssh/shyun-key.pub")
}