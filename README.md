# Folder to Floppy Disk Image Converter

This repository contains a shell script that allows you to convert a folder into a floppy disk image (.ima) format. The script is designed to be executed inside an Alpine-based Docker container.

## Prerequisites

Before running the script, you need to have Docker installed on your machine. You can download and install Docker from the official Docker website: [https://www.docker.com](https://www.docker.com)

## Usage

To convert a folder to a floppy disk image, follow these steps:

1. Clone this repository to your local machine or download the shell script (`convert_to_floppy.sh`) directly.
2. Open a terminal and navigate to the location of the `convert_to_floppy.sh` script.
3. Build and run the alpine-based Docker container.
4. Execute the script with the full path to the folder you want to convert:

   ```bash
   /create_ima_from_dir.sh /full/path/to/folder
   ```

   Replace `/full/path/to/folder` with the actual full path to the folder on your host machine that you want to convert.

5. The script will create a floppy disk image file named `full_path_to_folder_disk.ima` in the current directory.

## Notes

- The Docker container is based on Alpine Linux to keep it lightweight and efficient.
- The Docker container is removed automatically (`--rm` flag) after executing the script.
- Make sure to provide the full absolute path to the folder as an argument to the script to ensure proper execution.

## License

This repository is licensed under the [MIT License](LICENSE). Feel free to modify and distribute the script according to your needs.
