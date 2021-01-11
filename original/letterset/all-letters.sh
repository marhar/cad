# Generate all letters.
OPENSCAD=/Applications/OpenSCAD-2019.05.app/Contents/MacOS/OpenSCAD
for i in A B C D E F G H I J K L M N O P Q R S T U V W X Y Z; do
  echo generating $i
  time $OPENSCAD  -D letter=\"$i\" -o upper_$i.stl one-letter.scad
done
for i in a b c d e f g h i j k l m n o p q r s t u v w x y z; do
  echo generating $i
  time $OPENSCAD  -D letter=\"$i\" -o lower_$i.stl one-letter.scad
done
