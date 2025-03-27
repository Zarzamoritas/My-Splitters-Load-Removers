state("Death To The Universe")
{   
}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Death To The Universe";
    vars.Helper.LoadSceneManager = true;
}

start
{
    return current.activeScene == "MainLevel" && old.activeScene == "StartMenu";
}

update
{
     current.activeScene = vars.Helper.Scenes.Active.Name == null ? current.activeScene : vars.Helper.Scenes.Active.Name;

    if(current.activeScene != old.activeScene) vars.Log("active: Old: \"" + old.activeScene + "\", Current: \"" + current.activeScene + "\"");
}
   