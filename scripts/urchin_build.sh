# Build file just for me focusing on cradio

podman run --rm\
    --mount type=bind,source=/home/santiago/projects/zmk,target=/workspace/zmk \
    --mount type=bind,source=/home/santiago/projects/zmk-config-urob,target=/workspace/zmk-config,readonly \
    --mount type=bind,source=/home/santiago/projects/zmk-modules,target=/workspace/zmk-modules,readonly \
    --mount type=volume,source=zmk-root-user-3.5,target=/root \
    --mount type=volume,source=zmk-zephyr-3.5,target=/workspace/zmk/zephyr \
    --mount type=volume,source=zmk-zephyr-modules-3.5,target=/workspace/zmk/modules \
    --mount type=volume,source=zmk-zephyr-tools-3.5,target=/workspace/zmk/tools \
    -w /workspace/zmk/app zmkfirmware/zmk-dev-arm:3.5 \
    west build -s /workspace/zmk/app -d "build/nice_nano_v2_3.5_docker_left" -b nice_nano_v2 \
    -- -DZMK_CONFIG="/workspace/zmk-config/config" -DSHIELD="settings_reset"

mv /home/santiago/projects/zmk/app/build/nice_nano_v2_3.5_docker_left/zephyr/zmk.uf2 /home/santiago/projects/zmk-config-urob/results/urchin_left.u2f

podman run --rm\
    --mount type=bind,source=/home/santiago/projects/zmk,target=/workspace/zmk \
    --mount type=bind,source=/home/santiago/projects/zmk-config-urob,target=/workspace/zmk-config,readonly \
    --mount type=bind,source=/home/santiago/projects/zmk-modules,target=/workspace/zmk-modules,readonly \
    --mount type=volume,source=zmk-root-user-3.5,target=/root \
    --mount type=volume,source=zmk-zephyr-3.5,target=/workspace/zmk/zephyr \
    --mount type=volume,source=zmk-zephyr-modules-3.5,target=/workspace/zmk/modules \
    --mount type=volume,source=zmk-zephyr-tools-3.5,target=/workspace/zmk/tools \
    -w /workspace/zmk/app zmkfirmware/zmk-dev-arm:3.5 \
    west build -s /workspace/zmk/app -d "build/nice_nano_v2_3.5_docker_right" -b nice_nano_v2 \
    -- -DZMK_CONFIG="/workspace/zmk-config/config" -DSHIELD="urchin_right"

mv /home/santiago/projects/zmk/app/build/nice_nano_v2_3.5_docker_right/zephyr/zmk.uf2 /home/santiago/projects/zmk-config-urob/results/urchin_right.u2f
