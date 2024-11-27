using System;
using System.IO;
using System.Collections.Generic;
using ProtonDrive.Update.Contracts;

namespace ProtonDrive.Update.Releases;

internal class Release : IRelease
{
    public Release() {}
    public Release(ReleaseContract r, bool someBool,Version currentVersion) {}
    public Version Version => new Version();
    public DateTime ReleaseDate => DateTime.Now;
    public bool IsEarlyAccess => false;
    public bool IsNew => false;
    public IReadOnlyList<string> ChangeLog => new List<string>();
    public IReadOnlyList<ReleaseNote> ReleaseNotes => new List<ReleaseNote>();
    public bool IsAutoUpdateDisabled => true;
    public bool IsEmpty() => true;
    public RelFile File => new RelFile();
    public static Release EmptyRelease() => new Release();
    public double? RolloutRatio => 0.0;
}