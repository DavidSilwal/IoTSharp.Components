.PHONY: all configure  debug release package clean

all: debug

configure:
	if [ ! -f ./tools/nuget.exe ]; then \
		mkdir -p tools; \
		echo "nuget.exe not found! downloading latest version"; \
	    curl -O https://dist.nuget.org/win-x86-commandline/latest/nuget.exe; \
	    mv nuget.exe tools/; \
	fi
	echo "Restoring nugets..."
	mono tools/nuget.exe restore ./IoTSharp.Components.sln

debug:
	echo "Building project in debug mode"
	msbuild /p:Configuration=Debug ./IoTSharp.Components.sln 
	echo "Finished."

release:
	echo "Building project in release mode"
	msbuild /p:Configuration=Release ./IoTSharp.Components.sln 
	echo "Finished."

package: 
	msbuild /p:Configuration=Package ./IoTSharp.Components.sln 
	echo "Generating package addin..."
	#mono tools/nuget.exe pack NuGet/IoTSharp.Components.Monodroid.nuspec -outputdirectory NuGet/packages/
	mono tools/nuget.exe pack NuGet/IoTSharp.Components.Raspbian.nuspec -outputdirectory NuGet/packages/

clean:
	msbuild ./IoTSharp.Components.sln /t:Clean

