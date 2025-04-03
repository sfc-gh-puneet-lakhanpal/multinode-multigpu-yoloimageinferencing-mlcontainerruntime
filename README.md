# Multi-Node, multi-GPU Yolo object detection using Snowflake ML Container Runtime

This repo shows how we can use ML Container runtime to perform multi-node, multi-gpu Yolo object detection over multiple image files in a snowflake stage. In this demo, we use a GPU compute pool with 5 GPU_NV_S nodes and use Yolo11 pretrained model, which is trained first on a single GPU_NV_S node and then leveraged to perform multi node, multi gpu inferencing.

### Setup instructions
1. Run `step0_setup.sql` to setup basic objects.
2. Import `Yolo object detection - Distributed Inferencing Setup.ipynb` as a container based Snowflake notebook, select a warehouse and choose `object_detection_cp_gpu_nv_s_data_download` compute pool created in the above step. Use the external access integration `allow_all_integration` which will download the audio files.
3. Import `Yolo object detection - Distributed Inferencing.ipynb` as a container based Snowflake notebook, select a warehouse and choose `object_detection_cp_gpu_nv_s_5_nodes` compute pool in the above step. Use the external access integration `allow_all_integration`.
4. Run `Yolo object detection - Distributed Inferencing Setup.ipynb` and that notebook will train the model on a single GPU_NV_S node, and then put test images in a snowflake stage `MODELREGISTRYTOSPCSYOLO_INTERNALSTAGE/data/` as well as the trained model under `MODELREGISTRYTOSPCSYOLO_INTERNALSTAGE/model/` to be used in the other notebook. 
5. Run `Yolo object detection - Distributed Inferencing.ipynb` and that notebook will create a Ray cluster scaled upto 5 nodes, run distributed multi-node, multi-GPU object detection and write data to Snowflake using Snowflake APIs.

### Future Planned updates
I am waiting to hear back from engineering if multi node HPO has come into prod. Yolo also integrates with Ray for distributed multi node HPO, and I plan to update this repo after testing multi node HPO in prod. 

See here: https://docs.ultralytics.com/integrations/ray-tune/