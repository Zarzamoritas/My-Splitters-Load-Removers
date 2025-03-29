state("BushsideRangers-Win64-Shipping")
{
     int paused: 0x59EC9B4;
     bool loads: 0x5635EF9;
}

startup
{
    settings.Add("Split", false, "Split When In A Loading Screen");
    settings.SetToolTip("Split", "DOES NOT auto end when in the final cutscene that must still be done manually");
}

isLoading
{
    return current.paused == 3 || current.loads == true;
}

split
{
    if (current.loads == true && current.loads != old.loads)
    {
        return settings ["Split"];
    }
}

update
{
    if (current.paused != old.paused)
        print("Paused = " + current.paused);

    if (current.loads != old.loads)
        print("Current Loading Is " + current.loads);
}
