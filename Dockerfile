FROM shreyapohekar/joomla:ine
CMD service apache2 start && \
    service mysql start && /bin/bash
