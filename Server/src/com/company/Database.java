package com.company;
import java.io.*;
import java.util.*;

class DataBase {
    static public int usersChecker(String userID , String password) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("D:\\AP_TA_Project\\Server\\src\\com\\company\\DatabaseFile\\users.txt"));
        System.out.println("user Database founded!");
        String line = reader.readLine();
        int result = 0;
        while (line != null) {
            String[] elements = line.split("~");
            if (elements[0].equals(userID)) {
                result = 1;
                if (elements[1].equals(password)) {
                    result = 2;
                    reader.close();
                    return result; // 2 ->  userID and password are correct
                }
                reader.close();
                return result; // 1 -> userID is correct but password is incorrect
            }
            line = reader.readLine();
        }
        reader.close();
        return result ; // 0 -> userID is incorrect
    }

    static public String userinfo (String userID) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("D:\\AP_TA_Project\\Server\\src\\com\\company\\DatabaseFile\\usersInfo.txt"));
        System.out.println("userInfo Database founded!");
        String line = reader.readLine();
        StringBuilder responseOfRequest = new StringBuilder();
        while (line != null) {
            String[] elements = line.split("~");
            if (elements[0].equals(userID)) {
                for (int i = 0; i < elements.length; i++){
                    responseOfRequest.append(elements[i]).append("~");
                }
                reader.close();
                return responseOfRequest.toString();
                }
            line = reader.readLine();
        }
        reader.close();
        return "Information of this user is notfound!  {userID: " +  userID+"}"  ;
    }

//    // save new user to file
//    static public void addUser(User user) throws IOException {
//        BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\Lenovo\\Desktop\\untitled\\DataBase\\users.txt", true));
//        writer.append(user.email).append("~").append(user.userName).append("~").append(user.password).append("\n");
//        writer.close();
//    }
//
//    static public void deleteUser(String userName) throws IOException {
//        File file = new File("DataBase/users.txt");
//        File tempFile = new File("DataBase/temp.txt");
//        BufferedReader reader = new BufferedReader(new FileReader(file));
//        BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));
//        String currentLine;
//        while((currentLine = reader.readLine()) != null) {
//            // trim newline when comparing with lineToRemove
//            String trimmedLine = currentLine.trim();
//            if(trimmedLine.contains(userName))
//                continue;
//            writer.write(currentLine + System.getProperty("line.separator"));
//        }
//        writer.close();
//        reader.close();
//        file.delete();
//        boolean successful = tempFile.renameTo(file);
//        System.out.println(successful);
//    }
//
//    // saving changes user pass or email or userName
//    static public void changeInfo(String oldLine, String newLine) throws IOException {
//        Scanner scanner = new Scanner(new File("DataBase/users.txt"));
//        StringBuilder buffer = new StringBuilder();
//        while (scanner.hasNextLine())
//            buffer.append(scanner.nextLine()).append(System.lineSeparator());
//        String fileContents = buffer.toString();
//        System.out.println("Contents of the file: "+fileContents);
//        scanner.close();
//        fileContents = fileContents.replaceAll(oldLine, newLine);
//        FileWriter writer = new FileWriter("DataBase/users.txt");
//        System.out.println("new data: " + fileContents);
//        writer.append(fileContents);
//        writer.flush();
//        writer.close();
//    }
}
