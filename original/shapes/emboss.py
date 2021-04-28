from xml.dom import minidom
import zipfile

# mirror([1,0,0]) linear_extrude(1) text("12345", halign="right");
# OpenSCAD -o mirrored-text.3mf mirrored-text.scad

fn='mirrored-text.3mf'
zz=zipfile.ZipFile(fn)
print(zz.namelist())
model_text = str(zz.read('3D/3dmodel.model'), 'utf-8')

xmldoc = minidom.parseString(model_text)

objectlist = xmldoc.getElementsByTagName('object')
print(len(objectlist))
obj=objectlist[0]
print(obj.toxml())

#print(itemlist[0].attributes['name'].value)
#for s in itemlist:
#        print(s.attributes['name'].value)

def addemboss(infile, outfile, embossfile):
    pass
