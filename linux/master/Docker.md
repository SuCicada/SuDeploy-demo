- nvidia_gpu_exporter
```bash
docker run -d \
--name nvidia_smi_exporter \
--restart unless-stopped \
--device /dev/nvidiactl:/dev/nvidiactl \
--device /dev/nvidia0:/dev/nvidia0 \
-v /usr/lib/x86_64-linux-gnu/libnvidia-ml.so:/usr/lib/x86_64-linux-gnu/libnvidia-ml.so:ro \
-v /usr/lib/x86_64-linux-gnu/libnvidia-ml.so.1:/usr/lib/x86_64-linux-gnu/libnvidia-ml.so.1:ro \
-v /usr/bin/nvidia-smi:/usr/bin/nvidia-smi:ro \
-p 9835:9835 \
utkuozdemir/nvidia_gpu_exporter:1.1.0
```

 
