# Xing Server

## Install Step

### VM Setup

1. VM 생성 WinXP 32bit 512MB 20G
1. bridge network drive 추가
1. 설치용 공유 폴더 추가
1. WinXP 설치
1. Guest 확장 이미지 설치
1. bridge network IP 세팅

### Environment Setup

1. ebest 인증서 추가
1. git 설치
1. ruby 2.0 설치 (32bit 필수)
1. ruby devkit 설치 (32bit 필수)
  1. 압축 해제: C:\rubydev
  1. ruby dk.rb init
  1. ruby dk.rb install
1. 방화벽 차단해제 (방화벽 사용 안함 설정)

### Project Setup

1. git clone
  1. git clone https://github.com/ermaker/xing_server.git
1. git name & email setting and install bundler
  1. bootstrap
1. .env 작성
  1. copy .env.example .env
  1. .env 수정
1. 자동시작 세팅
  1. 시작프로그램에 run.bat 바로가기 추가

### Kick off

1. 재시작
