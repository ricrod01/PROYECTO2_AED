:begin
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{_id:8, properties:{genero_favorito:"Drama", nombre:"U1"}}, {_id:9, properties:{genero_favorito:"Terror", nombre:"U2"}}, {_id:10, properties:{genero_favorito:"Drama", nombre:"U3"}}, {_id:11, properties:{genero_favorito:"Accion", nombre:"U4"}}, {_id:12, properties:{genero_favorito:"Terror", nombre:"U5"}}, {_id:13, properties:{genero_favorito:"Drama", nombre:"U6"}}, {_id:14, properties:{genero_favorito:"Accion", nombre:"U7"}}, {_id:15, properties:{genero_favorito:"Drama", nombre:"U8"}}, {_id:16, properties:{genero_favorito:"Accion", nombre:"U9"}}, {_id:17, properties:{genero_favorito:"Drama", nombre:"U10"}}, {_id:18, properties:{genero_favorito:"Drama", nombre:"U11"}}, {_id:19, properties:{genero_favorito:"Drama", nombre:"U12"}}] AS row
MERGE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Usuario;
UNWIND [{_id:20, properties:{puntuacion:4, genero:"Drama", nombre:"P1"}}, {_id:21, properties:{puntuacion:1, genero:"Drama", nombre:"P2"}}, {_id:22, properties:{puntuacion:4, genero:"Drama", nombre:"P3"}}, {_id:23, properties:{puntuacion:5, genero:"Drama", nombre:"P4"}}, {_id:24, properties:{puntuacion:5, genero:"Terror", nombre:"P5"}}, {_id:32, properties:{puntuacion:4, genero:"Accion", nombre:"P6"}}, {_id:33, properties:{puntuacion:1, genero:"Accion", nombre:"P7"}}, {_id:34, properties:{puntuacion:3, genero:"Terror", nombre:"P8"}}, {_id:35, properties:{puntuacion:2, genero:"Terror", nombre:"P9"}}] AS row
MERGE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Pelicula;
:commit
:begin
UNWIND [{start: {_id:8}, end: {_id:9}, properties:{peso:0.4}}, {start: {_id:8}, end: {_id:10}, properties:{peso:0.8}}, {start: {_id:8}, end: {_id:11}, properties:{peso:1.0}}, {start: {_id:9}, end: {_id:8}, properties:{peso:0.4}}, {start: {_id:9}, end: {_id:10}, properties:{peso:0.6}}, {start: {_id:10}, end: {_id:8}, properties:{peso:0.8}}, {start: {_id:10}, end: {_id:9}, properties:{peso:0.6}}, {start: {_id:11}, end: {_id:8}, properties:{peso:1.0}}, {start: {_id:11}, end: {_id:12}, properties:{peso:0.5}}, {start: {_id:12}, end: {_id:11}, properties:{peso:0.5}}, {start: {_id:13}, end: {_id:14}, properties:{peso:1.0}}, {start: {_id:14}, end: {_id:13}, properties:{peso:1.0}}, {start: {_id:15}, end: {_id:17}, properties:{peso:0.6}}, {start: {_id:16}, end: {_id:18}, properties:{peso:0.5}}, {start: {_id:16}, end: {_id:19}, properties:{peso:0.5}}, {start: {_id:17}, end: {_id:15}, properties:{peso:0.6}}, {start: {_id:18}, end: {_id:16}, properties:{peso:0.5}}, {start: {_id:18}, end: {_id:19}, properties:{peso:0.5}}, {start: {_id:19}, end: {_id:16}, properties:{peso:0.5}}, {start: {_id:19}, end: {_id:18}, properties:{peso:0.5}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
MERGE (start)-[r:AMIGO_DE]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:32}, properties:{peso:0.32}}, {start: {_id:9}, end: {_id:24}, properties:{peso:0.4}}, {start: {_id:10}, end: {_id:20}, properties:{peso:0.92}}, {start: {_id:10}, end: {_id:21}, properties:{peso:0.68}}, {start: {_id:11}, end: {_id:20}, properties:{peso:0.32}}, {start: {_id:12}, end: {_id:32}, properties:{peso:0.92}}, {start: {_id:13}, end: {_id:33}, properties:{peso:0.08}}, {start: {_id:14}, end: {_id:21}, properties:{peso:0.08}}, {start: {_id:14}, end: {_id:22}, properties:{peso:0.32}}, {start: {_id:14}, end: {_id:34}, properties:{peso:0.84}}, {start: {_id:15}, end: {_id:24}, properties:{peso:1.0}}, {start: {_id:16}, end: {_id:33}, properties:{peso:0.08}}, {start: {_id:17}, end: {_id:23}, properties:{peso:0.4}}, {start: {_id:17}, end: {_id:24}, properties:{peso:1.0}}, {start: {_id:17}, end: {_id:34}, properties:{peso:0.84}}, {start: {_id:18}, end: {_id:23}, properties:{peso:1.0}}, {start: {_id:18}, end: {_id:35}, properties:{peso:0.16}}, {start: {_id:19}, end: {_id:35}, properties:{peso:0.16}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
MERGE (start)-[r:VIO]->(end) SET r += row.properties;
:commit
:begin
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
:commit
:begin
DROP CONSTRAINT UNIQUE_IMPORT_NAME;
:commit
