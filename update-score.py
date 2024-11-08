#! /usr/bin/python3
import sys
import pandas as pd
if __name__ == "__main__":
    id = sys.argv[1]
    v = sys.argv[2]
    dtype_spec = {'ID': 'str'}

# 读取 CSV 文件
    f = 'lab0-class2.csv'
    df = pd.read_csv(f, dtype=dtype_spec)

    # 指定你要检查的列和匹配值，以及要修改的列和新值
    column_to_check = 'SIS Login ID'
    value_to_match = id
    column_to_modify = '拆弹实验'
    new_value = v

    # 查找匹配的行索引
    matching_rows = df[df[column_to_check] == value_to_match]

# 如果没有匹配的行，抛出错误
    if len(matching_rows) != 1:
        raise ValueError(f"Matched error for {value_to_match} in column {column_to_check}")
    columns_to_modify = [col for col in df.columns if col.startswith(column_to_modify)]
# 查找匹配的行并修改另一列的值
    df.loc[df[column_to_check] == value_to_match, columns_to_modify] = new_value

# 保存修改后的数据回到 CSV 文件
    df.to_csv(f, index=False)