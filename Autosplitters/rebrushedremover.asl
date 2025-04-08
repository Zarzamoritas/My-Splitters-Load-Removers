state("recolored-Win64-Shipping")
{
    byte loading: 0x0522E878, 0xE0, 0x60;
}

startup
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
   {
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Disney Epic Mickey: Rebrushed",
            MessageBoxButtons.YesNo, MessageBoxIcon.Question
        );

        if (timingMessage == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }
}

exit
{
    //pauses timer if the game crashes
	timer.IsGameTimePaused = true;
}

onStart
{
    // This makes sure the timer always starts at 0.00
    timer.IsGameTimePaused = true;
}

isLoading
{
    return current.loading == 1 || current.loading == null;
}

start
{
    return current.loading == 1;
}