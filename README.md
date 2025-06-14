<div align="center">

# 【 end_4's Hyprland Dotfiles for Fedora 】

 Automated setup of the Quickshell version of end_4's dotfiles on **Fedora Linux**  


</div>

---

## ⚠️ Fedora Workstation Only

This script is intended for **Fedora Workstation**, other non-atomic variants like KDE Plasma should also work, but they have not been tested.
For the Arch version, visit: [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland)

> ✅ **Tested on Fedora 42**

---

<div align="center">
    <h2>• screenshots •</h2>
    <h3></h3>
</div>

## illogical-impulse<sup>Quickshell</sup>

| AI | Common widgets |
|:---|:---------------|
| ![image](https://github.com/user-attachments/assets/08d26785-b54d-4ad1-875b-bb08cc6757f5) | ![image](https://github.com/user-attachments/assets/4fcd63d9-0943-4b21-8737-4bed97b71961) |
| Window management | Weeb power |
| ![image](https://github.com/user-attachments/assets/86cc511b-0d33-4c78-bcc0-3037d02a17da) | ![image](https://github.com/user-attachments/assets/292259fc-57d3-4663-a583-2ce2faad13fb) |

By the way...
- The funny notification positions are mimicking Android 16's dragging behavior
- The clock on the wallpaper is automatically placed at the "least busy" region of the image

## Installation

### First read the notes section, this is not optional.

Run the automatic installer:

```bash
bash <(curl -s https://raw.githubusercontent.com/EisregenHaha/fedora-hyprland/f42/setup.sh)
```
or if you are using fish shell (non-posix-compliant shell) then:
   
```bash
bash -c "$(curl -s https://raw.githubusercontent.com/EisregenHaha/fedora-hyprland/f42/setup.sh)"
```

Then **reboot** and select the **Hyprland (non-uwsm)** session to log in.

---

## Updating

To update the configs:

1. Make sure you have read the Notes
2. Run the script again.
3. Select **option 1** again in the menu.

---

## Notes

### Regarding Updates
> Place any custom Hyprland config changes in `.config/hypr/custom` and then comment out the old configuration in `.config/hypr/hyprland.conf`.
> These files are **not overwritten** by the update process. Otherwise you **will** lose your configuration changes after updating.  
  
### For Nvidia users:
- Uncomment the lines found in ~/.config/hypr/custom/env.conf

### Keybinds
- Default keybinds: Parts similar to Windows and GNOME. Hit Super+/ for a list
    
   ![image](https://github.com/user-attachments/assets/c09531c9-3b55-493a-880f-7e044cd9dca0)


### Archive (not needed)
- Original (outdated) discussion: [#840](https://github.com/end-4/dots-hyprland/discussions/840)
---

## Thanks

- [@Kamion008](https://github.com/Kamion008) – Fedora version  
- [@nullptroma](https://github.com/nullptroma) – Original OpenSUSE script

                        
## stars because i like big numbers
[![Stargazers over time](https://starchart.cc/EisregenHaha/fedora-hyprland.svg?variant=adaptive)](https://starchart.cc/EisregenHaha/fedora-hyprland)

                    
