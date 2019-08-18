FROM grafana/grafana:5.4.2

COPY ./plugins_list.txt /tmp/plugins_list.txt

RUN while read -r plugin; \
    do \
        grafana-cli plugins install $plugin; \
    done < "/tmp/plugins_list.txt"


EXPOSE 3000



