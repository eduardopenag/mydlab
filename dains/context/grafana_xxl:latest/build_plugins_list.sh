curl -s https://grafana.net/api/plugins?orderBy=name | grep slug > plugins_list.txt
sed -i s/'      "slug": "'//g  plugins_list.txt
sed -i s/'",'//g  plugins_list.txt
