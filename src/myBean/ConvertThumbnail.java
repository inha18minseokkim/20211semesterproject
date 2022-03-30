package myBean;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import java.awt.*;
import org.jcodec.scale.AWTUtil;
import org.jcodec.api.FrameGrab;
import org.jcodec.api.JCodecException;
import org.jcodec.common.model.Picture;
public class ConvertThumbnail {//thumbnail 자동으로 생성해주는 클래스 일회성 호출이라 그냥 static으로 선언함.
	public static String convert(String fileName,String filePath) throws IOException, JCodecException {
		//jcodec 이라는 라이브러리를 깃허브에서 받아 썼습니다 일단 mp4파일은 지원하는데.. 나머지 파일은 어떻게 될지 모르겠습니다.
		File src = new File(filePath + "\\" + fileName);
		int frameNumber = 3;//그냥 아무 프레임 하나 잡고 따옴
		Picture picture = FrameGrab.getFrameFromFile(src, frameNumber);
		
		BufferedImage bufferedImage = AWTUtil.toBufferedImage(picture);
		String thumbnailName = fileName+"createdTHumbnail";
		ImageIO.write(bufferedImage, "png", new File(filePath + "\\" + thumbnailName));
		return thumbnailName;//리턴해서 sql에 저장할때 활용할 예정
	}//이미지작업때문에 sql쿼리가 좀 늦을수도 있어서 최대시간 좀 늘려놓을것.
}
