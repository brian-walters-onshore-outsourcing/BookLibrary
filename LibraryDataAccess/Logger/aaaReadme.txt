This assembly provides access to the logger class which is used to log exceptions into 
the database

The usage Pattern is:
    bool Logger.Log(ex,"Layer")

    catch(Exception ex) when(Logger.Log(ex,"Layer"))
	{
	// never invoked
	}
	 
--- Logger.Log(ex,"Layer") always returns false (the bool) so that the when
clause will log the exception, and then the exception will flow to the higher
levels to be caught again without losing the context of the exception

	or
    int Logger.Log(ex,"Layer",int)

	int newLogRecordID = Logger.Log(ex,"Layer",1);

---  returns the ID of the newly created logitem in the database
for the case where you want to work with it.  The additional integer is ignored, it is only
required in order to disambiguate whether you are returning false, or the LogID

	

