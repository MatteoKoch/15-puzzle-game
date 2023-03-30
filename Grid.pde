class Grid {
  
  int num;
  int[][] grid;
  int w = 800;
  int h = 800;
  boolean won = false;
  
  Grid(int num_) {
    this.num = num_;
  }
  
  void initGrid() {
    int i = 0;
    grid = new int[num][num];
    for(int y = 0; y < num; y++) {
      for(int x = 0; x < num; x++) {
        i++;
        if(i <= (num*num)-1) grid[x][y] = i;
        else grid[x][y] = 0;
      }
    }
  }
  
  void scramble() {
    for(int i = 0; i < 4000; i++) {
      move((int)random(w), (int)random(h));
    }
  }
  
  void move(int x, int y) {
    x = (int)map(x, 0, w, 0, num);
    y = (int)map(y, 0, h, 0, num);
    //println(x, y);
    int dx = 0;
    int dy = 0;
    for(int i = 0; i < num; i++) {
      if(grid[i][y] == 0) dx = i - x;
    }
    for(int j = 0; j < num; j++) {
      if(grid[x][j] == 0) dy = j - y;
    }
    //println(dx, dy);
    if(dx > 0) {
      for(int i = dx; i > 0; i--) {
        grid[x+i][y] = grid[x+(i-1)][y];
      }
      grid[x][y] = 0;
    } else if(dx < 0) {
      for(int i = dx; i < 0; i++) {
        grid[x+i][y] = grid[x+(i+1)][y];
      }
      grid[x][y] = 0;
    }
    else if(dy > 0) {
      for(int i = dy; i > 0; i--) {
        grid[x][y+i] = grid[x][y+(i-1)];
      }
      grid[x][y] = 0;
    } else if(dy < 0) {
      for(int i = dy; i < 0; i++) {
        grid[x][y+i] = grid[x][y+(i+1)];
      }
      grid[x][y] = 0;
    }
  }
  
  void checkWin() {
    int i = 1;
    for(int y = 0; y < num; y++) {
      for(int x = 0; x < num; x++) {
        if(grid[x][y] == i) i++;
      }
    }
    if(i == (num*num) && grid[num-1][num-1] == 0) {
      fill(200, 30, 30);
      rect(0, h/3, w, h/3);
      fill(255);
      textSize(80);
      text("Du hast gewonnen!", 10, 70+height/3);
      won = true;
    }
  }
  
  void show() {
    for(int y = 0; y < num; y++) {
      for(int x = 0; x < num; x++) {
        if(grid[x][y] != 0) {
          fill(255);
          rect(w*x/num, h*y/num, w/num, h/num);
          fill(0);
          textSize(210/num);
          text(grid[x][y], (w*x/num) + (0.4*w/num), (h*y/num) + (0.55*h/num));  
        }
      }
      stroke(180);
      line(w*y/num, 0, w*y/num, h);
      line(0, h*y/num, w, h*y/num);
    }
  }
  
}
