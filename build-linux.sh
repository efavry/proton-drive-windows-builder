git clone https://github.com/ProtonDriveApps/windows-drive-block-verification.git
git clone https://github.com/ProtonDriveApps/dotnet-security.git
git clone https://github.com/ProtonDriveApps/windows-drive.git

cd dotnet-security/build
.\build-cshared-windows.ps1
#cd ../src/dotnet
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

dotnet publish --configuration Release --runtime linux-x64 windows-drive/src/ProtonDrive.App.Windows/ProtonDrive.App.Windows.csproj --output "publish-linux64"
