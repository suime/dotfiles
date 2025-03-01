import os
import pandas as pd
import fire
import warnings


def merge_excel_files(folder_path, output_file="Merged.xlsx", header_offset=0):
    warnings.simplefilter("ignore")
    """
    특정 폴더 내 모든 Excel 파일(.xls, .xlsx)을 병합하여 하나의 파일로 저장하는 함수.

    :param folder_path: 병합할 Excel 파일들이 있는 폴더 경로
    :param output_file: 저장할 병합된 파일 경로 (기본값: "Merged.xlsx")
    :param header_offset: 몇 번째 행부터 데이터를 가져올지 설정 (기본값: 5)
    """
    # 병합할 데이터 리스트
    merged_data = []

    # 폴더 내 모든 .xls 및 .xlsx 파일 찾기
    excel_files = [f for f in os.listdir(folder_path) if f.endswith((".xls", ".xlsx"))]

    if not excel_files:
        print("병합할 엑셀 파일이 없습니다.")
        return

    for file in excel_files:
        file_path = os.path.join(folder_path, file)
        try:
            # 파일 확장자에 따라 적절한 엔진 선택
            if file.endswith(".xls"):
                dfs = pd.read_excel(
                    file_path, sheet_name=None, header=header_offset, engine="xlrd"
                )
            else:  # .xlsx
                dfs = pd.read_excel(
                    file_path, sheet_name=None, header=header_offset, engine="openpyxl"
                )

            # 모든 시트를 병합
            for df in dfs.values():
                merged_data.append(df)
            print(f"▶ 파일 읽기 완료: {file}")
        except Exception as e:
            print(f"▷ 파일 처리 오류: {file}, 오류: {e}")

    # 모든 데이터 병합
    if merged_data:
        final_df = pd.concat(merged_data, ignore_index=True)

        # 행의 개수가 엑셀의 최대 제한을 초과하는지 확인
        if len(final_df) > 1048576:
            print(
                "⚠️ 경고: 병합된 데이터의 행 수가 엑셀의 최대 제한을 초과했습니다. Parquet 파일로 저장합니다."
            )
            output_path = os.path.join(
                folder_path, output_file.replace(".xlsx", ".parquet")
            )
            final_df.to_parquet(output_path, index=False)
            print(f"▶ 모든 파일 병합 완료! \n▶ 저장된 파일: {output_path}")
        else:
            output_path = os.path.join(folder_path, output_file)
            print(f"▶ 파일 병합 중입니다!")
            final_df.to_excel(output_path, index=False, engine="openpyxl")
            print(f"▶ 모든 파일 병합 완료! \n▶ 저장된 파일: {output_path}")
    else:
        print("유효한 데이터가 없습니다.")


# 사용 예시
def main(dirpath: str, merge_name: str = "", header: int = 0):
    if not os.path.exists(dirpath):
        return f"{dirpath} 경로가 존재하지 않거나 경로가 잘못되었습니다."

    if merge_name == "":
        merge_name = "병합.xlsx"

    return merge_excel_files(dirpath, merge_name, header)


if __name__ == "__main__":
    fire.Fire(main)
