#! /bin/sh

wid=$1
class=$2
instance=$3
consequences=$4

main () {
    case "$class" in
        google-chat-linux|whatsapp-nativefier-d40211|TelegramDesktop)
            eval "$consequences"
            [ "$state" ] || echo "desktop=^1 follow=on"
            ;;
        Pavucontrol|jetbrains-toolbox)
            eval "$consequences"
            [ "$state" ] || echo "state=floating follow=on center=on"
            ;;
        Virt-manager)
            eval "$consequences"
            [ "$state" ] || echo "desktop=^10 follow=on"
            ;;
        Thunar)
            eval "$consequences"
            [ "$state" ] || echo "follow=on"
            ;;
        Spotify)
            eval "$consequences"
            [ "$state" ] || echo "desktop=^3 follow=on"
            ;;
        "")
        sleep 0.5
        wm_class=($(xprop -id $wid | grep "WM_CLASS" | grep -Po '"\K[^,"]+'))
        class=${wm_class[-1]}
        [[ ${#wm_class[@]} == "2" ]] && instance=${wm_class[0]}
        [[ -n "$class" ]] && main
        ;;
    esac
}

main
