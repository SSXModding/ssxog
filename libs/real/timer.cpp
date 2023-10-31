extern "C"
{

	static int timerinitalized = 0;

	// called on intc
	static void tintchandler()
	{
	}

	static void inittimer(int hz)
	{
		if (!timerinitalized)
		{
			if (hz == 0)
				hz = 100;
		}
	}
}