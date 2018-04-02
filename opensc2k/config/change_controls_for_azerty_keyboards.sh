#!/usr/bin/env bash
set -e

if [ $KEYBOARD_TYPE = "AZERTY" ]
then
    echo "Fixing controls for $KEYBOARD_TYPE keyboards."
    sed -i "s,'up': Phaser.Input.Keyboard.KeyCodes.W,'up': Phaser.Input.Keyboard.KeyCodes.Z,g" /root/OpenSC2K/src/world/worldCamera.js
    sed -i "s,'left': Phaser.Input.Keyboard.KeyCodes.A,'left': Phaser.Input.Keyboard.KeyCodes.Q,g" /root/OpenSC2K/src/world/worldCamera.js
    sed -i "s,'zoomIn': Phaser.Input.Keyboard.KeyCodes.Q,'zoomIn': Phaser.Input.Keyboard.KeyCodes.A,g" /root/OpenSC2K/src/world/worldCamera.js
    sed -i "s,this.scene.input.keyboard.on('keydown_Z',this.scene.input.keyboard.on('keydown_W',g" /root/OpenSC2K/src/world/worldCamera.js
    echo "Done!"
fi
