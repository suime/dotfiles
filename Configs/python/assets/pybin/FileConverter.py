import fire
import os


def get_unique_filename(file):
    base, extension = os.path.splitext(file)
    counter = 1
    new_file = f"{base}_{counter}{extension}"
    while os.path.exists(new_file):
        counter += 1
        new_file = f"{base}_{counter}{extension}"
    return new_file


def process_file(filepath, text, ext):
    if text[0:1] == b"\"" and ext == "csv" and filepath.count(".") > 1:
        text = text[1:]
        new = filepath.rsplit(".", 1)[0]

        if new.rsplit(".", 1)[-1] == "pdf":
            text = b"%" + text

        if os.path.exists(new):
            new = get_unique_filename(new)

        try:
            with open(new, 'wb') as new_f:
                new_f.write(text)
        except ValueError as e:
            return f"{e} 오류가 발생했습니다."

        return f"{new}로 파일을 해독하였습니다."

    else:
        new_file = f"{filepath}.csv"

        if os.path.exists(new_file):
            new_file = get_unique_filename(new_file)

        if ext == "pdf":
            text = text[1:]

        with open(new_file, 'wb') as csv:
            text = b"\"" + text
            csv.write(text)

        return f"{new_file}로 파일을 저장했습니다."


def main(filepath: str):
    if not os.path.isfile(filepath):
        return f"{filepath} 파일이 존재하지 않거나 경로가 잘못되었습니다."

    ext = filepath.rsplit(".", 1)[-1]

    with open(filepath, 'rb') as f:
        text = f.read()

    return process_file(filepath, text, ext)


if __name__ == "__main__":
    fire.Fire(main)
