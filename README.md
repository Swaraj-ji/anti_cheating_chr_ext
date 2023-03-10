# anti_cheating

This is made using the Flutter Web and Firebase is used for the backend. Inside the lib folder we have two folder named as fornted and backend.

## Frontend
![Screenshot (49)](https://user-images.githubusercontent.com/68496595/224402531-2ecd9928-de2b-4361-9fd5-41d8be4d6a0e.png)
![Screenshot (59)](https://user-images.githubusercontent.com/68496595/224402893-d0b8f471-c537-4d6d-8b91-4695ace74946.png)

Frontend folder consist of the files that deals with the frontend of this project which basically a form which contains five text fields, a camera preview box and three buttons at the bottom.

1. Text feilds ask for email, firest name, last name, phone number and the test duration.

2. Camera Preview: It is used to see the current picture from the webcam.

3. Check WebCam button: It enables the webcam. After pressing permission box pops up.

4. Looks Good: It is to validate that web cam works fine by turing its color to green. It'll only get enabled after you click Check WebCam button.

5. Submit: This button gets enaled after clicking looks good button. It sends the current picture of the user to firebase database.

Below is shown how this wroks.

![Screenshot (61)](https://user-images.githubusercontent.com/68496595/224403661-f809d9da-82e5-4124-bbbc-cf1e133a8188.png)
![Screenshot (63)](https://user-images.githubusercontent.com/68496595/224403689-39ed40ab-b022-49ac-8632-4e34832203a5.png)
![Screenshot (64)](https://user-images.githubusercontent.com/68496595/224403710-9180f0d4-a3ad-4a31-98e0-2c6c1bbed3d1.png)

## Backend
I
Backend folder consist of the backend code it simply takes the picture and send it to the firebase storage bucket. Inside the default storage bucket a folder is created whose name is same as of the email, which makes that folder unique for every user. There pictures is being stored in that folder inside the bucket.

This is the code to capture the picture and upload it to the firebase storage bucket.
![Screenshot (67)](https://user-images.githubusercontent.com/68496595/224410362-b7d18273-4e58-43b2-97cb-e322d575cf98.png)

Image shown below is snapshot of the firebase bucket with some user's folders.
![Screenshot (65)](https://user-images.githubusercontent.com/68496595/224407369-48d46a29-5827-4832-98cf-d351edd3d598.png)

