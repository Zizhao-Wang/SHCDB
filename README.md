# SHCDB
separating cold data from hot data in LSM-based Key-value store


## Project structure

The following is the directory structure of the project:
```
SHCDB/
│
├── workload_data_generation/ # 数据生成脚本存放目录
│ ├── data_display.py # 数据展示脚本
│ ├── etc_data_generation.py # ETC数据生成脚本
│ └── zipf_data_display.py # Zipf数据展示脚本
│
├── workloads/ # 存放生成的工作负载数据
| |
| └── dataset_description.md # 数据集描述文件 
├── README.md # 项目说明文件
└── requirements.txt # Python依赖列表
```

## Install
Ensure that Python and pip are installed on your system. then run the following command to install the project dependencies:
```bash
pip install -r requirements.txt
```


## Usage
To generate data using this item, follow the steps below:  

```bash
git clone https://github.com/CODER-UCAS/SHCDB.git
```
Open a terminal and navigate to the workload_data_generation directory:
```bash
cd workload_data_generation
```
Run the etc_data_generation.py script to generate the dataset:
```bash
python etc_data_generation.py
```  
After executing the above script, you will find a file named etc_data.csv in the workloads directory, which contains the generated simulated key-value pair operation data  

## Dataset Description
A detailed description of the dataset can be found in the dataset_description.md file. This file provides an explanation of each column of data in the dataset and an overall overview of the dataset.

## Licenses
The project uses the MIT license. See the LICENSE file in the project for more details.
