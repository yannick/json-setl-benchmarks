import std.stdio;
import std.algorithm;
import asdf;
import std.conv;
import std.datetime;


struct Company
{
	size_t ts;

	@serializationScoped:

	string name;
	@serializationKeysIn("homepage_url")
	string url;
	@serializationKeysIn("email_address")
	string mail;

	@serializationKeysIn("created_at")
	string createdAt;
}

void main()
{
	size_t fails;
	foreach(ref line; 
		stdin
			.byChunk(4096 * 8)
			.parseJsonByLine(4096)
			.filter!(a => a.data.length))
	{
		try
		{
			Company company = line.deserialize!Company;
			auto ser = jsonSerializer(a => write(a));
			ser.serializeValue(company);
			ser.flush;
			writeln;
		}
		catch(Exception e)
		{
			fails++;
		}
	}
	//writeln(fails);
}
