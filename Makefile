
clean:
	rm -rf build-dir

prepare/jdk:
	mkdir -p prepare/jdk
	curl "https://cdn.azul.com/zulu/bin/zulu25.34.17-ca-jdk25.0.3-linux_x64.tar.gz" -sS | \
	tar -xz -C prepare/jdk --strip-components=1 --exclude='*/legal' --exclude='*/man' --exclude='*/demo'

prepare/maven:
	mvn -f ../sample-javafx/ clean package
	mkdir -p prepare
	ln -s ../../sample-javafx/target/sample-javafx-1.0.0-SNAPSHOT-dist prepare/maven

build: prepare/maven prepare/jdk
	flatpak-builder --force-clean build-dir com.github.phoswald.sample.JavaFX.yml

install: prepare/maven prepare/jdk
	flatpak-builder --user --install --force-clean build-dir com.github.phoswald.sample.JavaFX.yml
