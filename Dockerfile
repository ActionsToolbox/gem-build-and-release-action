FROM wolfsoftwareltd/gem-release:0.1.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
