{ pkgs, ... }:

{
  notifyDone = pkgs.writeShellScriptBin "script" ''
    ${pkgs.libnotify}/bin/notify-send "System Rebuild Complete 🚀"
  '';

  waybarBatteryScript = pkgs.writeShellScriptBin "script" ''
    percentage=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ $percentage -ge 100 ]; then
      echo "100" # My battery reports over 356% when full. It is broken.
    else
      echo $percentage
    fi
  '';

  rofiPowerMenuScript = pkgs.writeShellScriptBin "script" ''
    lock="🔒️  Lock"
    logout="🏃  Log Out"
    shutdown="💡  Shut Down"
    reboot="🔃  Reboot"
    sleep="💤  Sleep"
    # Get answer from user via rofi
    selected_option=$(echo "$lock
    $logout
    $sleep
    $reboot
    $shutdown" | ${pkgs.rofi-wayland}/bin/rofi -dmenu -i -p "Power")
    # Do something based on selected option
    if [ "$selected_option" == "$lock" ]
    then
        hyprlock
    elif [ "$selected_option" == "$logout" ]
    then
        loginctl terminate-user "$(whoami)"
    elif [ "$selected_option" == "$shutdown" ]
    then
        systemctl poweroff
    elif [ "$selected_option" == "$reboot" ]
    then
        systemctl reboot
    elif [ "$selected_option" == "$sleep" ]
    then
        systemctl suspend
    else
        echo "No match"
    fi
  '';
}
