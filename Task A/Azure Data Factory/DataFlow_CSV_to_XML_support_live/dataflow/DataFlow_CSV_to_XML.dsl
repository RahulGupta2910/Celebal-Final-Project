source(output(
		id as string,
		first_name as string,
		last_name as string,
		email as string,
		gender as string,
		ip_address as string
	),
	allowSchemaDrift: true,
	validateSchema: true,
	ignoreNoFilesFound: false) ~> source1
source1 derive(xmlRow = '<Customer>' + '<Id>' + id + '</Id>' + '<FirstName>' + first_name + '</FirstName>' + '<LastName>' + last_name + '</LastName>' + '<Email>' + email + '</Email>' + '<Gender>' + gender + '</Gender>' + '<IPAddress>' + ip_address + '</IPAddress>' + '</Customer>') ~> AddXMLFormat
AddXMLFormat sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		Column_1 as string
	),
	partitionFileNames:['customer.xml'],
	umask: 0022,
	preCommands: [],
	postCommands: [],
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	partitionBy('hash', 1)) ~> sink1