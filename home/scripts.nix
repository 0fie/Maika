{pkgs}:
# Several scripts that will be used throughout the system.
{
  # The Temperature module should "just work" on Waybar, but it does not. Maybe my machine is too old?
  # That's why I resort to these hacks.
  waybarTemperatureScript = pkgs.writeShellScriptBin "script" ''
    temp=$(cat /sys/class/hwmon/hwmon4/temp1_input)
    actualTemp=$((temp / 1000))
    echo $actualTemp
  '';

  batteryNotificationScript = pkgs.writeShellScriptBin "script" ''
    percentage=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ $percentage -ge 100 ]; then
      ${pkgs.libnotify}/bin/notify-send "Battery Full" # My battery reports over 356% when full. It is broken.
    else
      ${pkgs.libnotify}/bin/notify-send "Current battery: $percentage"
    fi
  '';

  suspendScript = pkgs.writeShellScriptBin "script" ''
    ${pkgs.pipewire}/bin/pw-cli i all 2>&1 | ${pkgs.ripgrep}/bin/rg running -q
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
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
