FROM mooxe/gogost

ADD tasks /root/tasks

ENV runner gost

ENTRYPOINT [ "task", "-t", "./tasks/locale.yml", "client" ]
