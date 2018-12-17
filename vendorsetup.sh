croot

export TARGET_USE_SDCLANG=false
export SDCLANG=false
#export SDCLANG_FLAGS="-O3 -fvectorize -Wno-vectorizer-no-neon -Wno-user-defined-warnings"
#export SDCLANG_FLAGS_2="-O3 -fvectorize -Wno-vectorizer-no-neon -Wno-user-defined-warnings"
#export SDCLANG_COMMON_FLAGS="-O3 -fvectorize -Wno-vectorizer-no-neon -Wno-user-defined-warnings"

GCC_DIR=prebuilts/gcc/linux-x86/aarch64/aarch64-opt-linux-android
GCC_LINK="https://github.com/krasCGQ/aarch64-linux-android/"

if [ ! -d $GCC_DIR ]; then

  tput bold
  tput setaf 1
  echo -e "\nWARNING: GCC 8.x not present at $GCC_DIR"

  wget -q --spider https://github.com

  if [ $? -eq 0 ]; then
    tput setaf 4
    echo -e "\nInternet connection detected"
    echo -e "\n=======================\nCloning GCC 8.x ....\n=======================\n"
    git clone -b opt-gnu-8.x $GCC_LINK $GCC_DIR
  else
    tput setaf 1
    echo -e "You are not connected to the internet! Cannot clone GCC 8.x toolchain automatically\n"
    echo -e "ERROR: Please clone GCC 8.x from $GCC_LINK (opt-gnu-8.x branch) \nto $GCC_DIR, before continuing build !!\n"
    tput sgr0
    exit 1
  fi

  tput sgr0

fi
