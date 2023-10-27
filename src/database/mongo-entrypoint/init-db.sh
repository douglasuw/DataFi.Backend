if [ "$MONGO_INITDB_ROOT_USERNAME" ] && [ "$MONGO_INITDB_ROOT_PASSWORD" ]; then
  "${mongo[@]}" "$MONGO_INITDB_DATABASE" <<-EOJS
  db.createUser({
     user: $(_js_escape "$MONGO_INITDB_ROOT_USERNAME"),
     pwd: $(_js_escape "$MONGO_INITDB_ROOT_PASSWORD"),
     roles: [ "readWrite", "dbAdmin" ]
     });
  db.createCollection("Fields");
  db.createCollection("Integrations");
  db.createCollection("Templates");
  db.createCollection("Projects");
  db.createCollection("ProjectFields");
  db.createCollection("Users");
EOJS
fi

echo ======================================================
echo created $MONGO_INITDB_ROOT_USERNAME in database $MONGO_INITDB_DATABASE
echo ======================================================