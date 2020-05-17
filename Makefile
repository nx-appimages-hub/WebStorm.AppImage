SOURCE="https://download.jetbrains.com/webstorm/WebStorm-2019.3.tar.gz"
DESTINATION="build.tar.bz2"
OUTPUT="WebStorm.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)

	tar -zxvf $(DESTINATION)
	rm -rf AppDir/opt

	mkdir --parents AppDir/opt/application
	cp -r WebStorm-193.5233.80/* AppDir/opt/application

	chmod +x AppDir/AppRun
	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -rf WebStorm-193.5233.80
	rm -f $(DESTINATION)
	rm -rf AppDir/opt
