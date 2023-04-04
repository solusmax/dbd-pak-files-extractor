dbd_folder="/c/Program Files (x86)/Steam/steamapps/common/Dead by Daylight/"
# Путь к папке DBD


is_separate_folder=false
is_locres_only=false

while getopts sl option; do
  case $option in
    s)
      is_separate_folder=true
      ;;
    l)
      is_locres_only=true
      ;;
    \?)
      echo "Error: Invalid option"
      exit;;
  esac
done


dbd_paks_folder="$dbd_folder/DeadByDaylight/Content/Paks"
output_folder="./output"


if [ ! -d "$output_folder" ]
then
  mkdir "$output_folder"
fi


pak_paths=()


while IFS=  read -r -d $'\0'; do
  pak_paths+=("$REPLY")
done < <(find "$dbd_paks_folder/" -path "*.pak" -print0)


for pak_path in "${pak_paths[@]}"; do
  pak_file="${pak_path//$dbd_paks_folder\//}"

  if [ $is_locres_only == true ]
  then
    if [ "$pak_file" != "pakchunk0-WindowsNoEditor.pak" ]
    then
      if [ "$pak_file" != "pakchunk4-WindowsNoEditor.pak" ]
      then
        continue
      fi
    fi
  fi

  if [ $is_separate_folder == false ]
  then
    pak_file_output_folder="$output_folder"
  else
    pak_file_output_folder="$output_folder/${pak_file//.pak/}"
    if [ ! -d "$pak_file_output_folder" ]
    then
      mkdir "$pak_file_output_folder"
    fi
  fi

  ./utils/quickbms_4gb_files.exe "./utils/unreal_engine_4_0.4.27.bms" "$dbd_paks_folder/$pak_file" "$pak_file_output_folder"
done

