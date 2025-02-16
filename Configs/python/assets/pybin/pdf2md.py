import os
import re 
import pathlib
import pymupdf4llm
import fire 

def convert_pdfs_to_markdown(directory):
    for index, filename in enumerate(os.listdir(directory), start=1):  # 순번 추가
        if filename.endswith(".pdf"):
            pdf_path = os.path.join(directory, filename)
            try:  # 예외 처리 추가
                md_text = pymupdf4llm.to_markdown(
                    pdf_path,
                    write_images=True,
                    image_path=f"./{index:02d}_img",
                    show_progress=False,  # 순번으로 이미지 폴더명 변경
                )

                md_text = clean_markdown_text(md_text)
                output_md_path = os.path.splitext(pdf_path)[0]
                output_md_path = f"{output_md_path[:output_md_path.rfind(os.sep) + 1]}{index:02d}-{os.path.basename(output_md_path)}.md"  # 순번 추가
                pathlib.Path(output_md_path).write_bytes(md_text.encode())
                print(f'{filename} 변환을 완료했습니다.')
            except Exception as e:  # 예외 발생 시 처리
                print(f'{filename} 변환 중 오류 발생: {e}')  # 오류 메시지 출력


def clean_markdown_text(md_text):
    # 두 번 이상의 줄바꿈을 하나의 줄바꿈으로 변환
    text = re.sub(r"(?m)^-*", "", md_text)
    # 빈 줄 제거
    text = re.sub(r"(?m)\n{2,}", "\n", text)
    # 줄 시작의 공백 제거
    text = re.sub(r"(?m)^\s*", "", text)

    text = re.sub(r"(?m)```", "", text)

    # 커스텀 헤더
    text = re.sub(r"(?m)^(\(\d{2}\)|대 표 도)", "### \\1", text)

    head, body = re.split(r"(?m)^## 명 세 서", text)

    body = "## 명세서\n" + body
    body = re.sub(r"(?m)^(청구범위|기 술 분 야|특허문헌)", "\n### \\1", body)
    body = re.sub(r"(?m)^(청구항 \d)", "\n#### \\1 \n", body)
    body = re.sub(r"(?m)^(\[\d{4}\])", "#####", body)

    try :
        body, belly = re.split(r"(?m)^### 기 술 분 야", body)
        belly = "### 기술분야 \n" + belly
        belly = re.sub(r"(?<!#####)\n(?!#)", "", belly)
        text = head + body + belly

    except Exception as e:
        body = re.sub(r"(?<!#####)\n(?!#)", "", body)
        text = head + body
    

    # 해시 기호 앞에 두 줄 바꿈 추가
    text = re.sub(r"(?m)^#", "\n#", text)
    text = re.sub(r"(?m)^#####", "", text)
    return text

# 사용 예시
def main(filepath: str):
    if not os.path.exists(filepath):
        return f"{filepath} 파일이 존재하지 않거나 경로가 잘못되었습니다."
    
    return convert_pdfs_to_markdown(filepath)

if __name__ == "__main__":
    fire.Fire(main)
