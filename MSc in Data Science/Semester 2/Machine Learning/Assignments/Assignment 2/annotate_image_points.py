"""
-----------------------------------------------------------------------------
Statelite image(band4.gif) point annotation
-----------------------------------------------------------------------------
AUTHOR: Soumitra Samanta (soumitra.samanta@gm.rkmvu.ac.in)
-----------------------------------------------------------------------------
Package required:
Numpy: https://numpy.org/
scikit-image: https://scikit-image.org/
OpenCV: https://opencv.org/
pandas: https://pandas.pydata.org/
-----------------------------------------------------------------------------
"""

import numpy as np
import skimage.io as io
import cv2
import pandas as pd


def draw_point(event, x, y, flags, param):
    """Take one point"""
    
    global points_pos, count_points
    
    if event == cv2.EVENT_LBUTTONDBLCLK:        
        cv2.drawMarker(img, (x, y), color=(255,255,0), markerType=cv2.MARKER_CROSS, markerSize=5)
        points_pos.append((y, x))
        count_points += 1
        print('Position of {}-th point: ({}, {})' .format(count_points, x,y))
        
        
if __name__ == '__main__':
    
    # IMAGE FILE NAME YOU WANT TO READ
    image_path = '../data/images/satellite/'
    img_filename = 'band4.gif'

    img = io.imread(''.join([image_path, img_filename]))
    print('Input image size: {}' .format(img.shape))

    # TO STORE ANNOTATED POINTS
    points_pos = []
    count_points = 0

    num_poins = int(input('How many points would you like to annotate? '))

    cv2.namedWindow('Move mouse pointer and double click to locate the position')
    cv2.setMouseCallback('Move mouse pointer and double click to locate the position', draw_point)

    while(1):
        cv2.imshow('Move mouse pointer and double click to locate the position', img)
        k = cv2.waitKey(20) & 0xFF
        if(k == 27 or count_points==num_poins):
            # WRITE ANNOTATED IMAGE
            img_save_filename = ''.join([image_path, 
                                         'annotated_', img_filename.split('.')[0], 
                                         '_np_', str(len(points_pos)), 
                                         '.gif'])
            io.imsave(img_save_filename, img)
            
            # SAVE ANNOTATED POINTS AS CSV FILE
            pd.DataFrame(data = np.asarray(points_pos), 
                         columns = ['row', 'column']
                        ).to_csv(''.join([image_path, 
                                          'annotated_points_', img_filename.split('.')[0], 
                                          '_np_', str(len(points_pos)), 
                                          '.csv']), 
                                 index=False)
            break
            
