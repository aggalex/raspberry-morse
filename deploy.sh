set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

readonly TARGET_HOST=192.168.1.17
readonly TARGET_PATH=/home/alex/Downloads/raspberry-morse
readonly TARGET_ARCH=aarch64-unknown-linux-gnu
readonly SOURCE_PATH=./target/${TARGET_ARCH}/release/raspberry-morse

cargo zigbuild --release --target=${TARGET_ARCH}
rsync ${SOURCE_PATH} ${TARGET_HOST}:${TARGET_PATH}
ssh -t ${TARGET_HOST} ${TARGET_PATH}