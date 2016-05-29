import std.stdio;
import std.algorithm;
import asdf;
import asdf.serialization;
import std.conv;
import std.datetime;

struct Company
{
	size_t ts;
	@serializationEscaped
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
		
	foreach(ref line; stdin.byChunk(4096).parseJsonByLine(4096))
	{
		try{


		Company c = line.deserialize!Company;

		writeln(c.serializeToJson());
		} catch(Exception e)
		{
			 //writeln(e);
		}
	}
}

     
