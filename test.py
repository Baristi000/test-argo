from subprocess import check_output
out = check_output(["argocd", "app", "list"]).decode("utf-8")
data = out.split("\n")
data.pop(0)
data.pop(-1)
# print(data)
for app in data:
    print(app.strip().split(" ")[0])
