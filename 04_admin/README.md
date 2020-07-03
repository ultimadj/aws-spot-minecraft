# Server Admin
MC Server commands: https://minecraft.gamepedia.com/Commands

### Quick List
```
op Ultimadj
kick That1Jerk
ban That1Jerk
ban-ip <That1Jerk's IP from usercache.json>
```

### Start the Server
See: https://superuser.com/questions/582427/using-minecraft-server-with-screen
```

$ /var/lib/minecraft/start.sh
$ /var/lib/minecraft/connect.sh

# Disconnect with ctrl+a,d
```

### From a Connected Screen (interactive server terminal)
```
# Op a user
op Ultimadj

# Stop Server
stop

# Flush Save
save-all
```