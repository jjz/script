# coding=utf-8
import glob
import os
import re

path = 'ios'

ignores = {r'image_\d+'}
images = glob.glob('ios/images.xcassets/*/*.imageset')

def find_un_used():
    img_names = [os.path.basename(pic)[:-9] for pic in images]
    unused_imgs = []
    for i in range(0, len(images)):
        pic_name = img_names[i]
        if is_ignore(pic_name):
            continue
        command = 'ag "%s" %s' % (pic_name, path)
        result = os.popen(command).read()
        if result == '':
            unused_imgs.append(images[i])
            print 'remove %s' % (images[i])
            os.system('rm -rf %s' % (images[i]))


    text_path = 'unused.txt'
    tex = '\n'.join(sorted(unused_imgs))
    os.system('echo "%s" > %s' % (tex, text_path))
    print 'unuse res:%d' % (len(unused_imgs))
    print 'Done!'


def is_ignore(str):
    for ignore in ignores:
        if re.match(ignore, str):
            return True
    return False


if __name__ == '__main__':
    find_un_used()
