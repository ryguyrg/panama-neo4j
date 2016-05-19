FROM neo4j/neo4j:3.0.1
MAINTAINER Ryan Boyd, <ryan@neo4j.com>

ADD download_db.sh /
ADD download_db_run_neo4j.sh /
RUN chmod +x /download_db.sh
RUN chmod +x /download_db_run_neo4j.sh
RUN ln -s /var/lib/neo4j/data /var/lib/neo4j/databases

ENV NEO4J_dbms_memory_pagecache_size 1024M
ENV NEO4J_dbms_memory_heap_maxSize 2048

WORKDIR /var/lib/neo4j

CMD ["/download_db_run_neo4j.sh"]
