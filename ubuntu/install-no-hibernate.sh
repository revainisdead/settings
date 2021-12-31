source ../utils.sh

filename='do-not-hibernate'
hib_final_path="/run/${filename}"

# Check that hibernate file does not already exist
if [ ! -f $hib_final_path ]; then
    cecho "Copying file ${filename} to ${hib_final_path}" green
else
    cecho "File ${hib_final_path} already exists." yellow
fi
