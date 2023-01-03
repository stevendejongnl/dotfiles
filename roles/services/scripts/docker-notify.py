import json
import subprocess


def docker_inspect():
    data = None
    error = None
    command = "docker inspect --format='{{json .State.Health}}' db"
    subprocess.call(command, shell=True, stdout=data, stderr=error)
    # json_data = json.dumps(data)

    # print(type(json_data), json_data)

    # for container in json.load(json_data):
    #     print(container)


if __name__ == "__main__":
    docker_inspect()
