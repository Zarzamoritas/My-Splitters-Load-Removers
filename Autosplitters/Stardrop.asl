state("Stardrop") { }

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.LoadSceneManager = true;
}

update
{
    current.Scene = vars.Helper.Scenes.Active.Name ?? current.Scene;

    // if (old.Scene != current.Scene)
    //     vars.Log("Scene: " + old.Scene + " -> " + current.Scene);
}

start
{
    return old.Scene != "Stage1" && current.Scene == "Stage1";
}

reset
{
    return old.Scene != "Stage0" && current.Scene == "Stage0";
}
