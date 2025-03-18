// Credits
// Nikoheart - Splitting Logic (Huge Thanks)
// Arkhamfan69 - Everything Else
state("TheFirstTree")
{
}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "The First Tree";
    vars.Helper.LoadSceneManager = true;
    vars.Helper.AlertLoadless();
}

start
{
    return current.activeScene == "Level1" && old.activeScene == "Loading";
}

split
{
    return current.activeScene != "Loading" && current.activeScene != old.activeScene;
}

isLoading
{
    return current.activeScene == "Loading";
}

reset
{
    return current.activeScene == "Title";
}

update
{
    current.activeScene = vars.Helper.Scenes.Active.Name == null ? current.activeScene : vars.Helper.Scenes.Active.Name;

 if(current.activeScene != old.activeScene) vars.Log("active: Old: \"" + old.activeScene + "\", Current: \"" + current.activeScene + "\"");
}