import urllib2, json, sys


def getRemoteContents(url):
    req = urllib2.Request(url)
    r = urllib2.urlopen(req)

    return r.read()


def getJsonValue(json_file, key):
    value = json.loads(json_file)
    splitted = key.split('/')
    for subkey in splitted:
        value = value[subkey]

    return value


def main():
    print getJsonValue(getRemoteContents('http://files.minecraftforge.net/maven/net/minecraftforge/%s/promotions_slim.json' % sys.argv[1]), sys.argv[2])


if __name__ == "__main__":
    main()