import cv2
import numpy as np
import glob

# Dimensions du damier
pattern_size = (8, 6)  # nombre de coins intérieurs par ligne et colonne
square_size = 0.025  # taille d'une case en mètres (par exemple, 2.5 cm)

# Préparation des points 3D dans le monde réel
objp = np.zeros((pattern_size[0]*pattern_size[1], 3), np.float32)
r = np.mgrid[0:pattern_size[0], 0:pattern_size[1]].T.reshape(-1, 2)
objp *= square_size

# Listes pour stocker les points 3D et 2D
objpoints = []  
imgpoints = []  

# Chargement des images
images = glob.glob("C:\Users\User\Pictures\A4 Chessboard Calibration Pattern.png")  

for fname in images:
    img = cv2.imread(fname)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # Recherche des coins du damier
    ret, corners = cv2.findChessboardCorners(gray, pattern_size, None)

    if ret:
        objpoints.append(objp)
        imgpoints.append(corners)

        # Affichage des coins détectés
        cv2.drawChessboardCorners(img, pattern_size, corners, ret)
        cv2.imshow('img', img)
        cv2.waitKey(500)

cv2.destroyAllWindows()

# Calibration de la caméra
ret, mtx, dist, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, gray.shape[::-1], None, None)

# Affichage des résultats
print("Matrice de la caméra :\n", mtx)
print("Coefficients de distorsion :\n", dist)
