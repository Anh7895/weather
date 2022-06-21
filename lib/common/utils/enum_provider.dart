enum TimerStatus{
  start,
  pause,
  resume,
  stop,
  reset
}

enum CRUDStatus{
  create,
  update,
  delete,
}

enum ClientsTarget{
  time_tracking,
  projects,
  get_client
}

enum ProjectsTarget{
  projects,
  appointment
}

enum ItemsTarget{
  select_item,
  edit_item
}

enum ProjectFileType{
  photo,
  invoice,
  estimate,
  pdfFile,
}