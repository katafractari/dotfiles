# Linak Controller

## Installation

- Install Python env
```
python3 -m venv ./linak-controller
```

- Install https://github.com/rhyst/linak-controller
```
./linak-controller/bin/pip3 install linak-controller
```

- Run server
```
./linak-controller/bin/linak-controller --config ./linak-controller.yaml --server
```

- Control desk
```
./linak-controller/bin/linak-controller --config ../linak-controller.yaml --forward --move-to stand
```
