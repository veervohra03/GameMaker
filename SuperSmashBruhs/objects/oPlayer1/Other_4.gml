// overwrite old file
if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

// create + write new file
var file;
file = file_text_open_write(SAVEFILE);
file_text_write_real(file,room);
file_text_close(file);
