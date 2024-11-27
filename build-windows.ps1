git clone https://github.com/ProtonDriveApps/windows-drive-block-verification.git
cd windows-drive-block-verification
git reset --hard 4616d8c7a29f28efd9e33e5f2b6d3e5b3b53a437

git clone https://github.com/ProtonDriveApps/dotnet-security.git
cd dotnet-security
git reset --hard fa3fe7f3445c56f6c2ef7e3b8ab54ccf02348c4d

git clone https://github.com/ProtonDriveApps/windows-drive.git
cd windows-drive
git reset --hard e5553a80d4b8d09e26d3def57c8fd1b1c2f4dad2

cd dotnet-security/build
.\build-cshared-windows.ps1
cd ../../
dotnet pack -p:Version=1.2.0 -p:PackageVersion=1.2.0 dotnet-security/src/dotnet/Proton.Security.csproj --artifacts-path build-dotnet-security

#cd ../../../windows-drive-block-verification/src/ProtonDrive.BlockVerification
cp NuGet-block.Config windows-drive-block-verification/src/ProtonDrive.BlockVerification/NuGet.Config
dotnet pack -p:Version=1.1.0 -p:PackageVersion=1.1.0 windows-drive-block-verification/src/ProtonDrive.BlockVerification/ProtonDrive.BlockVerification.csproj --artifacts-path build-windows-drive-block-verification

cp -r z-custom-releases windows-drive/src/ProtonDrive.Update/Releases

cp NuGet.Config windows-drive/src/ProtonDrive.App/NuGet.Config
cp NuGet.Config windows-drive/src/ProtonDrive.App.Windows/NuGet.Config
cp NuGet.Config windows-drive/src/ProtonDrive.Client/NuGet.Config
dotnet build windows-drive/src/ProtonDrive.App.Windows/ProtonDrive.App.Windows.csproj --artifacts-path build-windows-drive
dotnet publish --configuration Release --runtime win-x64 windows-drive/src/ProtonDrive.App.Windows/ProtonDrive.App.Windows.csproj --output "publish-win-x64"

#Obvisouly, the following command will fail : dotnet publish --configuration Release --runtime linux-x64 windows-drive/src/ProtonDrive.App.Windows/ProtonDrive.App.Windows.csproj --output "publish-linux64"