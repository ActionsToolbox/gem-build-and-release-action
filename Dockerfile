FROM wolfsoftwareltd/gem-release:0.1.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
