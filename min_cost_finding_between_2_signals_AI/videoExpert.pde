String sketchName = getClass().getName();
import java.util.*;
import com.hamoid.*;

VideoExport videoExport;


void rec(){
  if(frameCount ==1){
    videoExport = new VideoExport(this, "../"+sketchName+".mp4");
    videoExport.saveFrame();
    videoExport.setFrameRate(frameRate);
    videoExport.startMovie();
  }
  videoExport.saveFrame();
}
