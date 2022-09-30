import arsd.png;
import std.file;
import std.path;
import std.stdio;

enum SRB2PMapCode : Color
{
	T_WALL        = Color(0, 0, 0, 255),
	T_EMPTY       = Color(255, 255, 255, 255),
	T_ITEM        = Color(255, 255, 0, 255),
	T_ENEMY       = Color(255, 0, 0, 255),
	T_START       = Color(128, 0, 128, 255),
	T_EXIT        = Color(0, 128, 0, 255),
	T_CHECKPOINT  = Color(0, 255, 0, 255),
	T_BOSS        = Color(128, 0, 0, 255),
	T_PIT         = Color(128, 128, 128, 255),
	T_RINGS       = Color(218, 165, 32, 255),
	T_GOLDI       = Color(255, 215, 0, 255),
	T_SHOP        = Color(0, 0, 139, 255),
	T_SPIKES      = Color(169, 169, 169, 255),
	T_FLOORSPIKES = Color(192, 192, 192, 255),
	T_GATE        = Color(255, 0, 255, 255),
	T_GOLDENEMY   = Color(184, 134, 11, 255),
	T_NOSWITCH    = Color(224, 224, 224, 255),
}

int main(string[] args)
{
	if (args.length == 1)
	{
		throw new Exception("No arguments given, please supply path to PNG file.");
	}
	//Create a MemoryImage from our given png
	writeln("Loading PNG image....");
	MemoryImage inputImage = readPng(args[1]);
	writeln("Done!");
	writeln("Processing image data...");
	//Verify that image dimensions are correct
	if (inputImage.width() != 48 || inputImage.height() != 48)
	{
		throw new Exception("ERROR: Image does not have 48x48 dimensions.");
	}
	//Begin the main loop,and process the image data
	string output = "map = {\n";
	for (int x = 0; x < 48; x++)
	{
		output ~= "\t";
		for (int y = 0; y < 48; y++)
		{
			//Grab our pixel
			Color pixel = inputImage.getPixel(x, y);
			//I made that enum and I'm gonna use it
			if (pixel == SRB2PMapCode.T_WALL)
			{
				output ~= "0";
			}
			else if (pixel == SRB2PMapCode.T_EMPTY)
			{
				output ~= "1";
			}
			else if (pixel == SRB2PMapCode.T_ITEM)
			{
				output ~= "2";
			}
			else if (pixel == SRB2PMapCode.T_ENEMY)
			{
				output ~= "3";
			}
			else if (pixel == SRB2PMapCode.T_START)
			{
				output ~= "4";
			}
			else if (pixel == SRB2PMapCode.T_EXIT)
			{
				output ~= "5";
			}
			else if (pixel == SRB2PMapCode.T_CHECKPOINT)
			{
				output ~= "6";
			}
			else if (pixel == SRB2PMapCode.T_BOSS)
			{
				output ~= "7";
			}
			else if (pixel == SRB2PMapCode.T_PIT)
			{
				output ~= "8";
			}
			else if (pixel == SRB2PMapCode.T_RINGS)
			{
				output ~= "9";
			}
			else if (pixel == SRB2PMapCode.T_GOLDI)
			{
				output ~= "10";
			}
			else if (pixel == SRB2PMapCode.T_SHOP)
			{
				output ~= "11";
			}
			else if (pixel == SRB2PMapCode.T_SPIKES)
			{
				output ~= "12";
			}
			else if (pixel == SRB2PMapCode.T_FLOORSPIKES)
			{
				output ~= "13";
			}
			else if (pixel == SRB2PMapCode.T_GATE)
			{
				output ~= "14";
			}
			else if (pixel == SRB2PMapCode.T_GOLDENEMY)
			{
				output ~= "15";
			}
			else if (pixel == SRB2PMapCode.T_NOSWITCH)
			{
				output ~= "16";
			}
			else
			{
				writefln("On Pixel X: %s, Y: %s", x, y);
				throw new Exception("ERROR: Pixel has invalid color");
			}
			output ~= ",";
		}
		output ~= "\n";
	}
	writeln("Done!");
	writeln("Writing data to file...");
	//Ok, we're all ready to output this data to a txt file.
	output ~= "}";
	File outputFile = File(args[1] ~ "-output.txt", "w");
	outputFile.write(output);
	writeln("Done! Process Complete!");
	return 0;
}