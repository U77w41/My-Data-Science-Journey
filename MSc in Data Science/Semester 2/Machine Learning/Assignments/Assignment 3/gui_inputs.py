"""
-----------------------------------------------------------------------------
Get 2D-points from gui using keyboard inputs
-----------------------------------------------------------------------------
AUTHOR: Soumitra Samanta (soumitra.samanta@gm.rkmvu.ac.in)
-----------------------------------------------------------------------------
Package required:
Numpy: https://numpy.org/
Matplotlib: https://matplotlib.org/
-----------------------------------------------------------------------------
"""

import numpy as np
from matplotlib import pyplot as plt
import pandas as pd

class get_2d_points():
    
    def __init__(
        self, 
        xbounds = (0, 30), 
        ybounds = (0, 30), 
        class_ids = ['1', '2', '3', '4', '5', '6', '7'],
        class_plot_colors = 'brgcmyk',
        class_plot_markers = '+x*ov^<'
    ):
        """Get 2D points using keyboard inputs"""
        
        self.xbounds = xbounds
        self.ybounds = ybounds
        self.class_ids = class_ids
        self.class_plot_colors = class_plot_colors
        self.class_plot_markers = class_plot_markers
        
    def points(self):
        
        self.points_pos = []
        self.class_labels = []
        self.count_points = 0

        self.fig, self.ax = plt.subplots()
        self.ax.set_title('Draw the data points with keys: {} for the corresponding class and press "esc" for complete' .format(self.class_ids))

        self.cid = self.fig.canvas.mpl_connect('key_press_event', self.get_keyboard_inputs)
        plt.xlim(self.xbounds)
        plt.ylim(self.ybounds)
        plt.show()
        
        return self.points_pos, self.class_labels


    def get_keyboard_inputs(self, event):
        """Get keyboard inputs"""
        
        key = event.key
        
        if key in self.class_ids:
            x, y = event.xdata, event.ydata
            self.points_pos.append((x, y))
            self.class_labels.append(int(key))
            
            self.ax.plot(x, y, self.class_plot_colors[int(key)-1]+self.class_plot_markers[int(key)-1])
            self.fig.canvas.draw()
            self.count_points += 1
            print('Position of {}-th point: ({}, {})' .format(self.count_points, x,y))
            
        elif key == 'escape':
            self.fig.canvas.mpl_disconnect(self.cid)
            plt.close()
            
        else:
            print('Press key : {} for the corresponding class labels' .format(self.class_ids))

if __name__ == '__main__':
    
    points_pos, labels = get_2d_points().points()
    print('Points are: {}' .format(points_pos))
    print('Labels are: {}' .format(labels))
        
    # SAVE ANNOTATED POINTS AS CSV FILE
    pd.DataFrame(data = np.concatenate((np.asarray(points_pos), np.asarray(labels).reshape(len(labels), 1)), axis=1), 
                 columns = ['x', 'y', 'labels']
                ).to_csv(''.join(['annotated_points_np_', str(len(points_pos)), 
                                  '.csv']),
                         index=False)
    
    



