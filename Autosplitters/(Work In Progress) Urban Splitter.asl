/***************************************************
 * Urban Nightmare Autosplitter And Load Remover *
 * By Arkhamfan69 *
 **************************************************/

state("Parkourror-Win64-Shipping")
{ 
    int level: 0x049D3D30, 0x808, 0x278, 0x318, 0x118;
    int EndTrigger: 0x04A46FA0, 0x7D8, 0x18, 0x1B8, 0x50;
    int MainMenu: 0x49FFA54; // 3276 on menu, 32 in-game
}

startup
{
    // Base Game Settings
    settings.add("Base Game", true, "Base Game Splits");
    settings.CurrentDefaultParent = "Base Game";
    settings.SetToolTip("Base Game", "Select if you're running All Levels or Normal Any%");

    settings.add("Level One", true, "Split after finishing Level 1", "Base Game");
    settings.add("Level Two", true, "Split after finishing Level 2", 'Base Game');
    settings.add("Level Three", true, "Split after finishing Level 3", "Base Game");
    settings.add("Level Four", true, "Split after finishing Level 4", "Base Game");
    settings.add("Level Five", true, "Split after finishing Level 5", "Base Game");
    settings.add("Normal Ending", true, "Split after getting the Normal Ending", "Base Game");

    // Lost Footage Settings
    settings.add("LF", true, "Lost Footage");
    settings.CurrentDefaultParent = "LF";
    settings.SetToolTip("LF", "Select if you're running All Levels or Lost Footage");

    settings.add("Lost Footage Level 1", true, "Split after finishing Lost Footage Level 1", "LF");
    settings.add("Lost Footage Level 2", true, "Split after finishing Lost Footage Level 2", "LF");
    settings.add("Lost Footage Level 3", true, "Split after finishing Lost Footage Level 3", "LF");
    settings.add("Lost Footage Level 4", true, "Split after finishing Lost Footage Level 4", "LF");
    settings.add("Lost Footage Level 5", true, "Split after finishing Lost Footage Level 5", "LF");
    settings.add("Lost Footage Ending", true, "Split after getting the Lost Footage Ending", "LF");

    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {
        var timingMessage = MessageBox.Show(
            "Thank you for using the Urban Nightmare Autosplitter!\n" +
            "LiveSplit is currently using Real Time.\n" +
            "We recommend switching to Game Time for more precise timing.\n" +
            "Would you like to switch to Game Time now?",
            "LiveSplit | Urban Nightmare",
            MessageBoxButtons.YesNo, MessageBoxIcon.Question
        );

        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

start
{
   
}

onStart
{
    vars.completedSplits.Clear();

    // Ensure the timer starts at 0.00
    timer.IsGameTimePaused = true;
}

split
{
    // Base Game Level Splits
    if (current.level == 1 && old.MainMenu != 3276) 
    {
        return settings["Level One"];
    }
    if (current.level == 2 && old.level == 1) 
    {
        return settings["Level Two"];
    }
    if (current.level == 3 && old.level == 2) 
    {
        return settings["Level Three"];
    }
    if (current.level == 4 && old.level == 3) 
    {
        return settings["Level Four"];
    }
    if (current.level == 5 && old.level == 4) 
    {
        return settings["Level Five"];
    }
    if (current.level == 6 && old.level == 5) 
    {
        return settings["Normal Ending"];
    }

    // Lost Footage Level Splits
    if (current.level == 11 && old.MainMenu != 3276) 
    {
        return settings["Lost Footage Level 1"];
    }
    if (current.level == 12 && old.level == 11) 
    {
        return settings["Lost Footage Level 2"];
    }
    if (current.level == 13 && old.level == 12) 
    {
        return settings["Lost Footage Level 3"];
    }
    if (current.level == 14 && old.level == 13) 
    {
        return settings["Lost Footage Level 4"];
    }
    if (current.level == 15 && old.level == 14) 
    {
        return settings["Lost Footage Level 5"];
    }
    if (current.level == 16 && old.level == 15) 
    {
        return settings["Lost Footage Ending"];
    }
}

exit
{
    // Pause the timer if the game closes or crashes
    timer.IsGameTimePaused = true;
}

isLoading
{
    return current.EndTrigger == 1 || current.MainMenu == 3276;
}

reset
{
  vars.completedSplits = []; //This Should Reset Completed Splits On The Timer Reset  
}
