state("BushsideRangers-Win64-Shipping")
{
     int paused: 0x59EC9B4;
     bool loads: 0x5635EF9;
}

isLoading
{
    return current.paused == 3 || current.loads == true;
}

update
{
    if (current.paused != old.paused)
        print("Paused = " + current.paused);

    if (current.loads != old.loads)
        print("Current Loading Is " + current.loads);
}