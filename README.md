



### APK 파일 생성
    1. 터미널에서 해당 프로젝트 디렉토리로 이동
    2. flutter build apk --release --target-platform=android-arm64
    3. 파일 경로는 [Project Forder]/build/app/outputs/apk/release/app-release.apk
    혹은 cd android && ./gradlew clean && cd .. && flutter build apk --release --target-platform=android-arm64