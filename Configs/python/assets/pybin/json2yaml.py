import os
import json
from pprint import pp
import yaml
import fire


def json_to_yaml(directory, output_file):
    yaml_documents = []

    # 디렉터리 내 모든 JSON 파일 찾기
    for filename in os.listdir(directory):
        if filename.endswith(".json"):
            json_path = os.path.join(directory, filename)

            with open(json_path, "r", encoding="utf-8") as json_file:
                try:
                    data = json.load(json_file)  # JSON 읽기
                    data["filename"] = filename  # 파일명 속성 추가
                    yaml_str = yaml.dump(
                        data, allow_unicode=True, default_flow_style=False
                    )  # YAML 변환
                    yaml_documents.append(yaml_str)
                    print(f"{filename} << 변환완료")
                except json.JSONDecodeError as e:
                    print(f"❌ JSON 파싱 오류: {json_path}, {e}")

    if len(yaml_documents) == 0:
        print(f"🛑 {directory} 에 json 파일이 없습니다.")
    else:
        # YAML 파일로 저장 (문서 구분자 사용)
        with open(output_file, "w", encoding="utf-8") as yaml_file:
            yaml_file.write("---\n".join(yaml_documents))
        print(f"✅ 변환 완료! 결과 저장: {output_file}")


def main(dirpath: str = ".", filename: str = "병합.yaml"):
    print(f"변환을 시작합니다.")
    if filename == "":
        filename = "병합.yaml"

    return json_to_yaml(dirpath, filename)


if __name__ == "__main__":
    fire.Fire(main)
