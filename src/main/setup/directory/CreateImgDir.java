package directory;

import java.io.File;

/**
 * This module for creating 'img' directory in for this project
 * It will create 'img' directory of this project parent folder
 * The "img" directory will be the same level of this project
 * e.g. this project path is "D:\java\project\PetPeeves" then the "img" path is "D:\java\project\img"
 */
public class CreateImgDir {
    private final String path="../";
    /* Name of the 'img' directory*/
    private final String dirName="img";

    public static void main(String[] args){
        CreateImgDir createImgDir = new CreateImgDir();

        String path = createImgDir.path+createImgDir.dirName;
        File f1 = new File(path);

        try{

            if (f1.mkdir()){
                System.out.println(createImgDir.dirName + " Directory Created");
            } else {
                System.out.println("Directory is not created");
            }
        } catch (Exception ex){
            System.out.println(ex.getMessage());
        }

    }
}
