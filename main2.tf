resource "local_file" games{
  filename = "/home/rhyme/fav_games.txt"
  sensitive_content ="FIFA 21"
  file_permission=”0755”
}
