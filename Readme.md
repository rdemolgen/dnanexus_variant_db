<!-- dx-header -->
# Exeter variant database (DNAnexus Platform App)

## Mongo variant database

### Running the app
Built app is located: https://platform.dnanexus.com/panx/projects/G729Kkj4fq4Q9X1BPy0807bK/data/variants/mongodb
#### App options
- Extend app time (mins) - Enter in the number of minutes you wish to use the app for before it terminates (default is 60mins). ![image](https://github.com/rdemolgen/dnanexus_variant_db/assets/19330012/1edc29c5-2cc3-488d-b886-d1ed8b84ec6a)


### Mongodb Shell
- To interact with the mongodb inside the docker `docker exec -it mongodb mongosh`
- Following cheat sheet is useful for running mongodb shell commands: https://www.mongodb.com/developer/products/mongodb/cheat-sheet/


### Pymongo
- Run `python3` to load python shell
- Use the follow code to connect to the database
- ```
  from pymongo import MongoClient
  client = MongoClient("mongodb://localhost:27017")
  databases = client.list_database_names()
  ```
- Following cheat sheet for using pymongo and interacting with the database: https://sysadmins.co.za/mongodb-cheatsheet-with-pymongo/
