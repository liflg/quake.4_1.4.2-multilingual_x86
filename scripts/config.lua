Setup.Package
{
 	vendor = "liflg.org",
 	id = "quake4",
 	description = "Quake 4",
 	version = "1.4.2-multilingual",
 	splash = "splash.png",
 	superuser = false,
	write_manifest = true,
 	support_uninstall = true,
 	recommended_destinations =
 	{
 		"/usr/local/games",
		"/opt",
		MojoSetup.info.homedir,
 	},

 	Setup.Readme
	{
 		description = "README",
		source = "README.liflg"
 	},

	Setup.Eula
	{
		description = "Quake 4 EULA",
		source = "License.txt",
	},

	Setup.Media
 	{
 		id = "quake4-disc",
		description = "Quake 4 US Disc",
		uniquefile = "Setup/Data/q4base/pak001.pk4"	
 	},

	Setup.Option
	{
		required = true,
		description = "Files for Quake 4",
		bytes = 3063947475,
                Setup.DesktopMenuItem
                {
                	disabled = false,
			name = "Quake 4",
                        genericname = "Egoshooter",
                        tooltip = "Play Quake 4",
                        builtin_icon = false,
                        icon = "icon.png",
                        commandline = "%0/quake4",
                        category = "Game",
                },

		Setup.File
		{
			source = "base:///bin.tar.xz",
			permissions = "0755",
		},

		Setup.File 
		{
			source = "base:///data.tar.xz",
			allowoverwrite = true,
		},
		
		Setup.File
		{	
			wildcards = { "README.liflg", "README", "License.txt", "icon.png" },
		},

		Setup.File
		{
			source = "media://quake4-disc/Setup/Data/q4base/",
			destination = "q4base/",
			filter = function(dest)
				if string.match(dest, "pak") then
					return dest
				end
				return nil
			end
		},

		Setup.Option
		{
			required = false,
			value = false,
			description = "Install PunkBuster",
			tooltip = "Recommended for multiplayer",
			bytes = 5291425,

			Setup.Eula
			{
				description = "PunkBuster EULA",
				source = "PBEULA.txt",
			},

			Setup.File
			{
				source = "base:///pb.tar.xz",
			},
		},

		Setup.OptionGroup
		{
			description = "Select your disc",
			
			Setup.Option
			{
				value = true,
				bytes = 613693,
				description = "International",
				Setup.File
				{
					source = "base:///us.tar.xz",
					allowoverwrite = true,
				},

				Setup.OptionGroup
				{
					description = "Select language",
					Setup.Option
					{
						value = true,
						bytes = 0,
						description = "English",
					},

					Setup.Option
					{
						bytes = 25,
						description = "French",
						Setup.File
						{
							source = "media://quake4-disc/Setup/Data/q4base/FRA/",
							destination = "q4base/",
						},
					},

					Setup.Option
					{
						bytes = 23,
						description = "Spanish",
						Setup.File
						{
							source = "media://quake4-disc/Setup/Data/q4base/ESP/",
							destination = "q4base/",
						},
					},

					Setup.Option
					{
						bytes = 25,
						description = "Italian",
						Setup.File
						{
							source = "media://quake4-disc/Setup/Data/q4base/ITA/",
							destination = "q4base/",
						},
					},

					Setup.Option
					{
						bytes = 25,
						description = "Polish",
						Setup.File
						{
							source = "media://quake4-disc/Setup/Data/q4base/PLK/",
							destination = "q4base/",
						},
					},
				},
			},

			Setup.Option
			{
				value = false,
				bytes = 11422558,
				description = "German",
				Setup.File
				{
					source = "base:///germany.tar.xz",
					allowoverwrite = true,
				},
				Setup.OptionGroup
				{
					description = "Select language",
					Setup.Option
					{
						value = false,
						bytes = 0,
						description = "English",
					},
				},
			},
		},
	},
}
