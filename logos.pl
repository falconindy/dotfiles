## Put your distrobutions logos here
#
# Format::
#   For a new distro
#       push @distros, ["DistroShowName", "/path/to/current/version", "Optional regexp to get & append to the DistroShowName"];
#       $distroname = "..distros logo..";
#   
#   The logo variable should be a lower-cased version of the DistroShowName.
#   With in the logo, Please escape unused %.
# 
#
 
  
  push @distros, ["ArchLinux", "/etc/issue", "Arch Linux \\((.*?)\\)"];
  $archlinux = "
  $colors[1]
  $colors[1]
  $colors[1]
  $colors[1]                       __       $colors[0]___                                 
  $colors[1]                      /\\ \\    $colors[0] /\\_ \\    __                          
  $colors[1]     __     _ __   ___\\ \\ \\___ $colors[0]\\//\\ \\  /\\_\\    ___   __  __  __  _  
  $colors[1]   /'__`\\  /\\`'__\\/'___\\ \\  _ `\\ $colors[0]\\ \\ \\ \\/\\ \\ /' _ `\\/\\ \\/\\ \\/\\ \\/'\\ 
  $colors[1]  /\\ \\L\\.\\_\\ \\ \\//\\ \\__/\\ \\ \\ \\ \\ $colors[0]\\_\\ \\_\\ \\ \\/\\ \\/\\ \\ \\ \\_\\ \\/>  </ 
  $colors[1]  \\ \\__/.\\_\\\\ \\_\\\\ \\____\\\\ \\_\\ \\_\\$colors[0]/\\____\\\\ \\_\\ \\_\\ \\_\\ \\____//\\_/\\_\\
  $colors[1]   \\/__/\\/_/ \\/_/ \\/____/ \\/_/\\/_/$colors[0]\\/____/ \\/_/\\/_/\\/_/\\/___/ \\//\\/_/
  $colors[0]   
  $colors[0]      $colors[2]%s
  $colors[0]      $colors[2]%s
  $colors[0]      $colors[2]%s
  $colors[0]      $colors[2]%s     
  $colors[0]      $colors[2]%s
  $colors[0]      $colors[2]%s
  $colors[0]      $colors[2]%s
  $colors[0]      $colors[2]%s
  $colors[0]      $colors[2]%s
  $colors[1]
  $colors[1]"
