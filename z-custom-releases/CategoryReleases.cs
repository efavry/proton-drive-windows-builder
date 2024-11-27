using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using ProtonDrive.Update.Contracts;
namespace ProtonDrive.Update.Releases;

internal class CategoryReleases : IEnumerable<Release>
{
    public CategoryReleases() {}
    public CategoryReleases(IReadOnlyList<CategoryContract> list, Version version, string someString) {}
    public IEnumerator<Release> GetEnumerator() => new List<Release>().GetEnumerator();
    private IEnumerator GetEnumerator1() => this.GetEnumerator();
    IEnumerator IEnumerable.GetEnumerator() => GetEnumerator1();
}
