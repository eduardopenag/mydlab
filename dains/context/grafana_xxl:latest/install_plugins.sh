
while read -r plugin
do
    if [ "$plugin" != "" ] ; then
        grafana-cli plugins install $plugin
    fi
done < "/tmp/plugins_list.txt"

