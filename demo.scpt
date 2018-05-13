tell application "iTerm2"
  -- TAB 1 --
  tell current window
    create tab with profile "falcon-server"
  end tell

  -- Falcon Server --
  tell first session of current tab of current window
    set name to "falcon-server home"
    write text "git pull"
    write text "alembic upgrade head"

    delay 5

    split horizontally with profile "falcon-server"
    split vertically with profile "falcon-server"
  end tell

  -- PyCharm --
  tell third session of current tab of current window
    set name to "falcon-server shell"

    if application "PyCharm" is not running then
        write text "charm $FALCON_SERVER_HOME"
    end if

    split vertically with profile "falcon-server"
  end tell

  -- Falcon Admin --
  tell fourth session of current tab of current window
    set name to "falcon-server front"

    write text "cd front/admin"
    write text "npm i"
    write text "npm start"
  end tell


end tell
