Remove-Item -Recurse -Force "build.x86"
New-Item -Name "build.x86" -ItemType Directory -Force
Set-Location build.x86

cmake -Wno-dev -G "Visual Studio 16 2019" -T v141_xp -DCPACK_PACKAGE_VERSION_PATCH="$Git_Revision" -DCMAKE_GENERATOR_PLATFORM=Win32 ..
cmake --build . --config Release -j

Set-Location ..

Remove-Item -Recurse -Force "build.x64"
New-Item -Name "build.x64" -ItemType Directory -Force
Set-Location build.x64

cmake -Wno-dev -G "Visual Studio 16 2019" -T v141_xp -DCPACK_PACKAGE_VERSION_PATCH="$Git_Revision" -DCMAKE_GENERATOR_PLATFORM=x64 ..
cmake --build . --config Release -j