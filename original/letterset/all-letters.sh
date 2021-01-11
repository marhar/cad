OPENSCAD=/Applications/OpenSCAD-2019.05.app/Contents/MacOS/OpenSCAD
# i and j are special cases because of the dots.
for i in A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h k l m n o p q r s t u v w x y z;do
  time $OPENSCAD  -D letter=\"$i\" -o $i.stl one-letter.scad
done
